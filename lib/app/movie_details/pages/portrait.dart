// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tentwenty/app/common/reusable_widgets.dart';
import 'package:tentwenty/app/movie_details/controller/movie_details_controller.dart';

import '../../common/colors.dart';
import '../../routes/app_pages.dart';

class PortaitMode extends GetView<MovieDetailsController> {
  double width;
  double height;
  PortaitMode({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.formatedDate.value == ''
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: height / 2,
                      width: width,
                      child: Image.network(
                        controller.baseUrl +
                            controller.posterSize +
                            controller.movieDetailData[0].backdropPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SafeArea(
                          child: Row(
                            children: [
                              pw(width * 0.06),
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: MyColors.white,
                                ),
                              ),
                              pw(width * 0.05),
                              txt(
                                  txt: 'Watch',
                                  size: 20.0,
                                  color: MyColors.white,
                                  weight: FontWeight.w200),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            txt(
                              txt: controller.movieDetailData[0].originalTitle,
                              color: MyColors.goldenropd,
                              size: 18.0,
                              align: TextAlign.center,
                            ),
                            txt(
                              txt: "In Theaters  ${controller.formatedDate}",
                              color: MyColors.white,
                              size: 18.0,
                            ),
                            ph(height * 0.02),
                            containerbtn(
                              icon: false,
                              width: width * 0.6,
                              height: height * 0.08,
                              bgColor: MyColors.cornflowerBlue,
                              title: 'Get Tickets',
                            ),
                            ph(height * 0.02),
                            containerbtn(
                              click: () {
                                Get.toNamed(Routes.TRAILER, arguments: {
                                  "id": controller.movieDetailData[0].id
                                });
                              },
                              icon: true,
                              width: width * 0.6,
                              height: height * 0.08,
                              borderColor: MyColors.cornflowerBlue,
                              bgColor: Colors.transparent,
                              title: 'Watch Trailer',
                            ),
                            ph(height * 0.02),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          pw(width * 0.02),
                          txt(
                              txt: 'Genres',
                              size: 18.0,
                              weight: FontWeight.w400),
                        ],
                      ),
                      ph(height * 0.02),
                      Row(
                        children: [
                          containerbtn(
                            icon: false,
                            width: width * 0.21,
                            height: height * 0.05,
                            bgColor: MyColors.cyan,
                            title: 'Action',
                            titleSize: 14.0,
                          ),
                          pw(width * 0.02),
                          containerbtn(
                            icon: false,
                            width: width * 0.21,
                            height: height * 0.05,
                            bgColor: MyColors.carnationPink,
                            title: 'Thriller',
                            titleSize: 14.0,
                          ),
                          pw(width * 0.02),
                          containerbtn(
                            icon: false,
                            width: width * 0.21,
                            height: height * 0.05,
                            bgColor: MyColors.dartBlue,
                            title: 'Science',
                            titleSize: 14.0,
                          ),
                          pw(width * 0.02),
                          containerbtn(
                            icon: false,
                            width: width * 0.21,
                            height: height * 0.05,
                            bgColor: MyColors.goldenropd,
                            title: 'Fiction',
                            titleSize: 14.0,
                          ),
                        ],
                      ),
                      ph(height * 0.02),
                      Row(
                        children: [
                          pw(width * 0.02),
                          txt(
                              txt: 'Overview',
                              size: 18.0,
                              weight: FontWeight.w400),
                        ],
                      ),
                      ph(height * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: txt(
                                txt: controller.movieDetailData[0].overview,
                                color: MyColors.dartBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
  }
}
