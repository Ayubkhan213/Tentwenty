import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/trailer/controller/trailer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends GetView<TrailerController> {
  const TrailerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      body: Obx(
        () => SizedBox(
          height: height,
          child: controller.ready.value
              ? YoutubePlayer(
                  controller: controller.controller,
                  showVideoProgressIndicator: true,
                  onEnded: (data) {
                    Get.back();
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
