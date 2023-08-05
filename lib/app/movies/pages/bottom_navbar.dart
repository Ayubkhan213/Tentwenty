import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/common/colors.dart';
import 'package:tentwenty/app/movies/controller/movies_controller.dart';

class BottomNavBar extends GetView<MoviesController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.pages[controller.currentIndex.value],
          //Bottm Navagation bar
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: MyColors.dartBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0), // Circular top-left corner
                topRight: Radius.circular(20.0), // Circular top-right corner
              ),
              child: BottomNavigationBar(
                backgroundColor: MyColors.dartBlue,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                selectedLabelStyle: const TextStyle(
                    color: MyColors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
                selectedItemColor: MyColors.white,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                items: [
                  ...List.generate(
                    controller.bottomNavigationBarItem.length,
                    (index) => BottomNavigationBarItem(
                        icon: IconButton(
                          onPressed: () {
                            controller.currentIndex.value = index;
                          },
                          icon: Icon(controller.bottomNavigationBarItem[index]
                              ['icon']),
                        ),
                        label: controller.bottomNavigationBarItem[index]
                            ['title']),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
