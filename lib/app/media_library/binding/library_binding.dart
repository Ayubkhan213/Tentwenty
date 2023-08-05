import 'package:get/get.dart';
import 'package:tentwenty/app/media_library/controller/library_controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}
