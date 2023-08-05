import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/app/media_library/controller/library_controller.dart';

import '../../common/reusable_widgets.dart';

class LibraryPage extends GetView<LibraryController> {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: txt(txt: 'Library Page'),
      ),
    );
  }
}
