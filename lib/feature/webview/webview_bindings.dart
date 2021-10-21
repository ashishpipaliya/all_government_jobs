import 'package:get/get.dart';
import './webview_controller.dart';

class WebviewBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(WebviewController());
    }
}