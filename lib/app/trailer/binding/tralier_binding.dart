import 'package:get/get.dart';
import 'package:tentwenty/app/trailer/controller/trailer_controller.dart';

class TrailerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TrailerController());
  }
}
