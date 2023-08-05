// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tentwenty/app/common/colors.dart';
import 'package:tentwenty/app/common/reusable_widgets.dart';
import 'package:tentwenty/app/routes/app_pages.dart';
import 'package:tentwenty/app/movies/controller/movies_controller.dart';

class ListViewPage extends GetView<MoviesController> {
  double height;
  double width;
  ListViewPage({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.moviesList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.moviesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.MOVIEDETAILS,
                          arguments: {"id": controller.moviesList[index].id});
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          height: height / 4.6,
                          width: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              controller.baseUrl +
                                  controller.posterSize +
                                  controller.moviesList[index].backdropPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: height / 4.6,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topCenter,
                              end: AlignmentDirectional.bottomCenter,
                              stops: const [0.7, 0.8],
                              colors: [
                                Colors.transparent,
                                // Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: height / 6,
                          left: width * 0.05,
                          child: txt(
                            txt: controller.moviesList[index].originalTitle,
                            color: MyColors.white,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
