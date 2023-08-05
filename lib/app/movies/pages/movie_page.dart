import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/common/colors.dart';
import 'package:tentwenty/app/common/reusable_widgets.dart';
import 'package:tentwenty/app/movies/controller/movies_controller.dart';
import 'package:tentwenty/app/movies/pages/list_view.dart';

import '../../routes/app_pages.dart';

class MoviePage extends GetView<MoviesController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8.0,
              ),
              color: MyColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text
                  txt(txt: 'Watch', size: 18.0),
                  //Search IconButton
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.MOVIESEARCH);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListViewPage(height: height, width: width),
            ),
          ],
        ),
      ),
    );
  }
}
