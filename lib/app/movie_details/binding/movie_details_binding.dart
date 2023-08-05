import 'package:get/get.dart';
import 'package:tentwenty/app/movie_details/controller/movie_details_controller.dart';

class MovieDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}
