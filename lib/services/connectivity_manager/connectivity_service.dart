import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  // var connectionStatus = 'Unknown'.obs;

  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription _streamSubscription;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // getConnectionType();
  //   // _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  // }

  // Future<void> getConnectionType() async {
  //   var connectivityResult;
  //   try {
  //     connectivityResult = await (_connectivity.checkConnectivity());
  //   } on PlatformException catch (e) {
  //     Logger().e(e);
  //   }
  //   print(connectivityResult);
  //   return _updateState(connectivityResult);
  // }
  //
  // _updateState(ConnectivityResult result) {
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //       connectionStatus.value = 'ConnectivityResult.wifi';
  //       update();
  //       break;
  //     case ConnectivityResult.mobile:
  //       connectionStatus.value = 'ConnectivityResult.mobile';
  //       update();
  //       break;
  //     case ConnectivityResult.none:
  //       connectionStatus.value = 'No Internet';
  //       update();
  //       break;
  //     default:
  //       Get.snackbar('Network Error', 'Network Status Undetermined');
  //       break;
  //   }
  //
  //   Logger().wtf(isInternetAvailable);
  // }
  //
  // bool get isInternetAvailable => (connectionStatus.value == 'ConnectivityResult.wifi' || connectionStatus.value == 'ConnectivityResult.mobile');

  // @override
  // void onClose() {
  //   super.onClose();
  //   _streamSubscription.cancel();
  // }

}
