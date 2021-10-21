import 'dart:io';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:all_govt_jobs/constants/app_color.dart';
import 'package:all_govt_jobs/constants/app_strings.dart';

import 'package:webview_flutter/webview_flutter.dart';
import './webview_controller.dart';

class WebviewPage extends StatefulWidget {
  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  WebviewController controller = Get.find<WebviewController>();
  bool isLoading = true;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var url = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appName)),
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          Visibility(
              visible: isLoading,
              child: Center(
                child: SpinKitSpinningLines(color: AppColor.blueDianne),
              )),
        ],
      ),
    );
  }
}
