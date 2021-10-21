import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tuple/tuple.dart';

enum ApiType {
  categories,
  getJobs,
  subPostByPostId,
  relatedJobs,
  getAllState,
  getAllQualification,
}

class ApiConstant {
  static String get baseDomain =>
      "http://allgovernmentjobportal.com/newapi/ws/admin/";

  static String getValue(ApiType type) {
    switch (type) {
      case ApiType.categories:
        return 'categorylist';
      case ApiType.getJobs:
        return 'getJobs';
      case ApiType.subPostByPostId:
        return 'getsubpostbyPost';
      case ApiType.relatedJobs:
        return 'getRelated';
      case ApiType.getAllState:
        return 'getAllState';
      case ApiType.getAllQualification:
        return 'getAllQualification';
      default:
        return "";
    }
  }

  static Tuple3<String, Map<String, String>, Map<String, dynamic>>
      requestParamsForSync(
    ApiType type, {
    Map<String, dynamic>? params,
    String? urlParams,
  }) {
    String apiUrl = ApiConstant.baseDomain + ApiConstant.getValue(type);

    if (urlParams != null) apiUrl = apiUrl + urlParams;

    Map<String, dynamic> paramsFinal = params ?? Map<String, dynamic>();
    Map<String, String> headers = Map<String, String>();
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    headers['X-API-KEY'] = '840c953f22b6ec4a7ac9cb60ac9be576fcd74790';

    Logger().d("Request Url :: $apiUrl");
    Logger().d("Request Params :: $paramsFinal");
    // Logger().d("Request headers :: $headers");

    return Tuple3(apiUrl, headers, paramsFinal);
  }
}

class ResponseKeys {
  static String kStatus = 'STATUS';
  static String kMessage = 'MESSAGE';
  static String kTitle = 'title';
  static String kData = 'DATA';
}

class HttpResponse {
  dynamic status;
  String? errMessage;
  dynamic data;
  dynamic mainResponse;

  HttpResponse({
    this.status,
    this.errMessage,
    this.data,
    this.mainResponse,
  });
}

class BaseClient {
  final Dio dio = Dio();

  BaseClient() {
    dio.options.connectTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  HttpResponse _handleNetworkSuccess({Response<dynamic>? response}) {
    dynamic jsonResponse = response!.data;

    Logger().v("Response Status code:: ${response.statusCode}");
    Logger().v("response body :: $jsonResponse");

    final message =
        (jsonResponse is Map) ? jsonResponse[ResponseKeys.kMessage] ?? '' : '';
    final status = (jsonResponse is Map)
        ? jsonResponse[ResponseKeys.kStatus] ?? response.statusCode
        : response.statusCode;
    final data =
        (jsonResponse is Map) ? jsonResponse[ResponseKeys.kData] : null;
    if (response.statusCode! >= 200 && response.statusCode! < 299) {
      return HttpResponse(
          status: status,
          errMessage: message,
          data: data,
          mainResponse: jsonResponse);
    } else {
      var errMessage = jsonResponse[ResponseKeys.kMessage] ?? '';
      return HttpResponse(
          status: status, errMessage: errMessage, mainResponse: jsonResponse);
    }
  }

  Future<HttpResponse> _handleDioNetworkError({DioError? error}) async {
    Logger().v("Error Details :: ${error!.message}");

    if ((error.response == null) || (error.response!.data == null)) {
      String errMessage = Strings.msgSomethingWrong;
      return HttpResponse(
        status: 500,
        errMessage: errMessage,
      );
    } else {
      Logger().v("Error Details :: ${error.response!.data}");
      dynamic jsonResponse = getErrorData(error);
      if (jsonResponse is Map) {
        final status = jsonResponse[ResponseKeys.kStatus] ?? 400;
        String errMessage = jsonResponse[ResponseKeys.kTitle] ??
            (jsonResponse[ResponseKeys.kMessage] ?? Strings.msgSomethingWrong);
        return HttpResponse(
          status: status,
          errMessage: errMessage,
        );
      } else {
        return HttpResponse(
          status: 500,
          errMessage: Strings.msgSomethingWrong,
        );
      }
    }
  }

  Map getErrorData(DioError error) {
    if (error.response!.data is Map) {
      return error.response!.data;
    } else if (error.response!.data is String) {
      return json.decode(error.response!.data);
    }
    return Map();
  }

  Future<HttpResponse> getRequest(ApiType apiType,
      {Map<String, String>? params, String? urlParam}) async {
    if (!await isNetworkAvailable()) {
      return HttpResponse(status: 101, errMessage: Strings.msgInternetMessage);
    }

    final requestFinal = ApiConstant.requestParamsForSync(apiType,
        params: params, urlParams: urlParam);

    final option = Options(headers: requestFinal.item2);

    try {
      final response = await this.dio.get(requestFinal.item1,
          queryParameters: requestFinal.item3, options: option);
      return _handleNetworkSuccess(response: response);
    } on DioError catch (error) {
      final result = await this._handleDioNetworkError(error: error);
      return result;
    }
  }

  Future<HttpResponse> postRequest(ApiType apiType,
      {Map<String, dynamic>? params, String? urlParams}) async {
    if (!await isNetworkAvailable()) {
      return HttpResponse(status: 101, errMessage: Strings.msgInternetMessage);
    }

    final requestFinal = ApiConstant.requestParamsForSync(apiType,
        params: params, urlParams: urlParams);
    final option = Options(headers: requestFinal.item2);
    try {
      final response = await dio.post(requestFinal.item1,
          data: requestFinal.item3, options: option);
      return this._handleNetworkSuccess(response: response);
    } on DioError catch (error) {
      final result = await this._handleDioNetworkError(error: error);
      return result;
    }
  }

// Future<HttpResponse> deleteRequest(ApiType apiType, {Map<String, dynamic> params, String urlParams}) async {
//   if (!Reachability().isInterNetAvaialble()) {
//     return HttpResponse(status: 101, errMessage: Translations.of(NavigationService().context).msgInternetMessage);
//   }
//
//   final requestFinal = ApiConstant.requestParamsForSync(apiType, params: params, urlParams: urlParams);
//   final option = Options(headers: requestFinal.item2);
//   this.lastRequestToken = CancelToken();
//   try {
//     final response = await this.dio.delete(requestFinal.item1, data: json.encode(requestFinal.item3), options: option, cancelToken: this.lastRequestToken);
//     return this._handleNetworkSuccess(response: response);
//   } on DioError catch (error) {
//     final result = await this._handleDioNetworkError(error: error);
//     return result;
//   }
// }

// Future<HttpResponse> putRequest(ApiType apiType, {Map<String, dynamic> params, List<AppMultiPartFile> arrFile = const [], String urlParam, bool isFormDataApi = false, bool paramsFormData = false}) async {
//   if (!Reachability().isInterNetAvaialble()) {
//     return HttpResponse(status: 101, errMessage: Translations.of(NavigationService().context).msgInternetMessage);
//   }
//
//   Logger().v("Request Type :: PUT");
//   final requestFinal = ApiConstant.requestParamsForSync(apiType, params: params, arrFile: arrFile, urlParams: urlParam);
//
//   dynamic data;
//   if (isFormDataApi) {
//     // Create form data Request
//     FormData formData;
//     if (paramsFormData) {
//       formData = new FormData.fromMap(Map<String, dynamic>());
//       requestFinal.item3.forEach((key, value) {
//         List<int> bytesData = utf8.encode(json.encode(value));
//         MediaType mineType = MediaType('application', 'json', {'charset': 'utf-8'},);
//         MultipartFile mFile = MultipartFile.fromBytes(bytesData, contentType: mineType,);
//         formData.files.add(MapEntry(key, mFile));
//       });
//     }
//     else {
//       formData = new FormData.fromMap(requestFinal.item3);
//     }
//
//     /* Adding File Content */
//     for (AppMultiPartFile partFile in requestFinal.item4) {
//       for (File file in partFile.localFiles) {
//         Logger().v("File Path :: ${file.path}");
//         String filename = basename(file.path);
//         String mineType = lookupMimeType(filename);
//         if (mineType == null) {
//           MultipartFile mFile = await MultipartFile.fromFile(file.path, filename: filename,);
//           formData.files.add(MapEntry(partFile.key, mFile));
//         } else {
//           MultipartFile mFile = await MultipartFile.fromFile(file.path, filename: filename, contentType: MediaType(mineType.split("/").first, mineType.split("/").last));
//           formData.files.add(MapEntry(partFile.key, mFile));
//         }
//       }
//     }
//     data = formData;
//   } else {
//     data = json.encode(requestFinal.item3);
//   }
//
//   /// Create Header
//   final option = Options(headers: requestFinal.item2);
//   try {
//     final response =
//     await this.dio.put(requestFinal.item1, data: data, options: option, onSendProgress: (sent, total) => Logger().v("uploadFile ${sent / total}"));
//     return this._handleNetworkSuccess(response: response);
//   } on DioError catch (error) {
//     final result = await this._handleDioNetworkError(error: error);
//     return result;
//   }
// }

// Future<HttpResponse> uploadRequest(ApiType apiType, {Map<String, dynamic> params, List<AppMultiPartFile> arrFile, String urlParam}) async {
//   if (!Reachability().isInterNetAvaialble()) {
//     final httpResonse = HttpResponse(status: 101, errMessage: Translations.of(NavigationService().context).msgInternetMessage);
//     return httpResonse;
//   }
//
//   final requestFinal = ApiConstant.requestParamsForSync(apiType, params: params, arrFile: arrFile ?? List<AppMultiPartFile>(), urlParams: urlParam);
//
//   // Create form data Request
//   FormData formData = new FormData.fromMap(Map<String, dynamic>());
//
//   MultipartFile mFile = MultipartFile.fromBytes(utf8.encode(json.encode(requestFinal.item3)),
//       contentType: MediaType(
//         'application',
//         'json',
//         {'charset': 'utf-8'},
//       ));
//   formData.files.add(MapEntry('requestDTO', mFile));
//
//   /* Adding File Content */
//   for (AppMultiPartFile partFile in requestFinal.item4) {
//     for (File file in partFile.localFiles) {
//       Logger().v("File Path :: ${file.path}");
//       String filename = basename(file.path);
//       String mineType = lookupMimeType(filename);
//       if (mineType == null) {
//         MultipartFile mFile = await MultipartFile.fromFile(
//           file.path,
//           filename: filename,
//         );
//         formData.files.add(MapEntry(partFile.key, mFile));
//       } else {
//         MultipartFile mFile =
//         await MultipartFile.fromFile(file.path, filename: filename, contentType: MediaType(mineType.split("/").first, mineType.split("/").last));
//         formData.files.add(MapEntry(partFile.key, mFile));
//       }
//     }
//   }
//
//   /* Create Header */
//   final option = Options(headers: requestFinal.item2);
//
//   try {
//     final response =
//     await this.dio.post(requestFinal.item1, data: formData, options: option, onSendProgress: (sent, total) => Logger().v("uploadFile ${sent / total}"));
//     return this._handleNetworkSuccess(response: response);
//   } on DioError catch (error) {
//     final result = await this._handleDioNetworkError(error: error);
//     return result;
//   }
// }
}
