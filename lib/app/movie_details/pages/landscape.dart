// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tentwenty/app/common/colors.dart';
import 'package:tentwenty/app/common/reusable_widgets.dart';
import 'package:tentwenty/app/movie_details/controller/movie_details_controller.dart';

import '../../routes/app_pages.dart';

class LandscapeMode extends GetView<MovieDetailsController> {
  double width;
  double height;
  LandscapeMode({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            //First Half Page
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: height,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Button for Get Ticket
                              containerbtn(
                                icon: false,
                                width: width * 0.2,
                                height: height * 0.14,
                                bgColor: MyColors.cornflowerBlue,
                                title: 'Get Tickets',
                              ),
                              pw(width * 0.02),
                              //Button for Watch Trailer
                              containerbtn(
                                click: () {
                                  Get.toNamed(Routes.TRAILER, arguments: {
                                    "id": controller.movieDetailData[0].id
                                  });
                                },
                                icon: true,
                                width: width * 0.2,
                                height: height * 0.14,
                                borderColor: MyColors.cornflowerBlue,
                                bgColor: Colors.transparent,
                                title: 'Watch Trailer',
                              ),
                            ],
                          ),
                          ph(height * 0.05),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
        //Second Half Page
        Expanded(
            child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        pw(width * 0.02),
                        txt(txt: 'Genres', size: 18.0, weight: FontWeight.w400),
                      ],
                    ),
                    ph(height * 0.02),
                    Row(
                      children: [
                        containerbtn(
                          icon: false,
                          width: width * 0.1,
                          height: height * 0.08,
                          bgColor: MyColors.cyan,
                          title: 'Action',
                          titleSize: 14.0,
                        ),
                        pw(width * 0.01),
                        containerbtn(
                          icon: false,
                          width: width * 0.1,
                          height: height * 0.08,
                          bgColor: MyColors.carnationPink,
                          title: 'Thriller',
                          titleSize: 14.0,
                        ),
                        pw(width * 0.01),
                        containerbtn(
                          icon: false,
                          width: width * 0.1,
                          height: height * 0.08,
                          bgColor: MyColors.dartBlue,
                          title: 'Science',
                          titleSize: 14.0,
                        ),
                        pw(width * 0.01),
                        containerbtn(
                          icon: false,
                          width: width * 0.1,
                          height: height * 0.08,
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
            ],
          ),
        )),
      ],
    );
  }
}
