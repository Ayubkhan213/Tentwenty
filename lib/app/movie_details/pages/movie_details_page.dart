import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tentwenty/app/movie_details/controller/movie_details_controller.dart';
import 'package:tentwenty/app/movie_details/pages/landscape.dart';
import 'package:tentwenty/app/movie_details/pages/portrait.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: height < width
          ? LandscapeMode(
              width: width,
              height: height,
            )
          : PortaitMode(width: width, height: height),
    );
  }
}
