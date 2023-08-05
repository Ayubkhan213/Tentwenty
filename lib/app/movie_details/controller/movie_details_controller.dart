import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty/app/movie_details/model/movie_details_model.dart';

import 'package:http/http.dart' as http;

class MovieDetailsController extends GetxController {
  List<MoviesDetail> movieDetailData = [];
  String? id;
  RxString formatedDate = ''.obs;
  DateTime? date;

  String baseUrl = "https://image.tmdb.org/t/p/";
  String posterSize = "w185";
  String backdropSize = "w780";

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//get id and put it in id variable
    id = Get.arguments['id'].toString();
    //Function for getting movies details
    await getMovieDetai();
    date = DateTime.parse(movieDetailData[0].releaseDate.toString());
    formatedDate.value = DateFormat("MMMM, d, yyyy").format(date!);
  }

  getMovieDetai() async {
    final response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/'
            '$id'
            '?api_key=efd4be6e18fb7039f5c4d37ee58a8b12'));
    if (response.statusCode == 200) {
      var data = moviesDetailFromJson(response.body);
      movieDetailData.add(data);
    }
  }
}
