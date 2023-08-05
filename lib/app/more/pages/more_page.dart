import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/common/reusable_widgets.dart';
import 'package:tentwenty/app/more/controller/more_controller.dart';

class MorePage extends GetView<MoreController> {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: txt(txt: 'More Page'),
      ),
    );
  }
}
