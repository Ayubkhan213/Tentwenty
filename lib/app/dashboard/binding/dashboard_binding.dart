import 'package:get/get.dart';
import 'package:tentwenty/app/dashboard/controller/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
