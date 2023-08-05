// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tentwenty/app/trailer/controller/trailer_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerController extends GetxController {
  //List for storing movies data
  RxList<Result> trailerList = <Result>[].obs;
  //ready variable for checking if it initialize or no
  RxBool ready = false.obs;
  //controller for youtubeplayed
  late YoutubePlayerController controller;
  late var url;
  late String key;
  String? id;
  @override
  void onInit() async {
    id = Get.arguments['id'].toString();
    await getMoviesTrailer();
    key = trailerList[0].key;
    url = 'https://www.youtube.com/watch?v=$key';
    await initialization(url);
    ready.value = true;
    super.onInit();
  }

//initialization youtubePlayerController
  initialization(String url) {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        hideControls: false,
        isLive: false,
      ),
    );
  }

  getMoviesTrailer() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.themoviedb.org/3/movie/'
              '$id'
              '/videos?api_key=efd4be6e18fb7039f5c4d37ee58a8b12'));
      if (response.statusCode == 200) {
        trailerList.addAll(trailerFromJson(response.body).results);
        print(trailerList[0].key);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onClose() {
    // controller.dispose();
    super.onClose();
  }
}
