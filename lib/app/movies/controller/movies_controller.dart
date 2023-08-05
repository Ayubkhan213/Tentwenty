import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tentwenty/app/dashboard/pages/dashboard_page.dart';
import 'package:tentwenty/app/media_library/pages/library_page.dart';
import 'package:tentwenty/app/movies/model/movies_model.dart';

import '../../more/pages/more_page.dart';
import '../pages/movie_page.dart';

class MoviesController extends GetxController {
  RxList<Result> moviesList = <Result>[].obs;
  String baseUrl = "https://image.tmdb.org/t/p/";
  String posterSize = "w185";
  String backdropSize = "w780";
  @override
  void onInit() async {
    // Set preferred orientations to portrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await getUpComingMovies();
    super.onInit();
  }

//Get data of Upcomming Movies
  getUpComingMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=efd4be6e18fb7039f5c4d37ee58a8b12'));
    if (response.statusCode == 200) {
      var data = moviesFromJson(response.body);
      moviesList.addAll(data.results);
    }
  }

  RxInt currentIndex = 1.obs;
  List<Map<String, dynamic>> bottomNavigationBarItem = [
    {'icon': Icons.dashboard, 'title': 'Dashboard'},
    {'icon': Icons.play_circle_filled, 'title': 'Watch'},
    {'icon': Icons.photo_library, 'title': 'Media Library'},
    {'icon': Icons.view_list, 'title': 'More'},
  ];

  //Pages List
  List<Widget> pages = [
    const DashboardPage(),
    const MoviePage(),
    const LibraryPage(),
    const MorePage(),
  ];

  @override
  void onClose() {
    // Allow all orientations when leaving this page
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.onClose();
  }
}
