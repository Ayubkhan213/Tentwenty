import 'package:get/get.dart';
import 'package:tentwenty/app/movies/controller/movies_controller.dart';

class MoviesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesController());
  }
}
