// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:tentwenty/app/media_library/pages/library_page.dart';
import 'package:tentwenty/app/more/pages/more_page.dart';
import 'package:tentwenty/app/movie_details/binding/movie_details_binding.dart';
import 'package:tentwenty/app/trailer/binding/tralier_binding.dart';
import 'package:tentwenty/app/trailer/pages/trailer_page.dart';
import '../dashboard/binding/dashboard_binding.dart';
import '../dashboard/pages/dashboard_page.dart';
import '../media_library/binding/library_binding.dart';
import '../more/binding/more_binding.dart';
import '../movie_details/pages/movie_details_page.dart';
import '../movie_search/binding/movie_search_binding.dart';
import '../movie_search/pages/movie_search_page.dart';
import '../movies/binding/movies_binding.dart';
import '../movies/pages/bottom_navbar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.WATCH;
  static final routes = [
    GetPage(
      name: Routes.WATCH,
      page: () => const BottomNavBar(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.LIBRARY,
      page: () => const LibraryPage(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: Routes.MORE,
      page: () => const MorePage(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: Routes.MOVIEDETAILS,
      page: () => const MovieDetailsPage(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: Routes.TRAILER,
      page: () => const TrailerPage(),
      binding: TrailerBinding(),
    ),
    GetPage(
      name: Routes.MOVIESEARCH,
      page: () => const MovieSearchPage(),
      binding: MovieSearchBnding(),
    ),
  ];
}
