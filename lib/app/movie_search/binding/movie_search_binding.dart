import 'package:get/get.dart';
import 'package:tentwenty/app/movie_search/controller/movie_search_controller.dart';

class MovieSearchBnding implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieSearchController());
  }
}
