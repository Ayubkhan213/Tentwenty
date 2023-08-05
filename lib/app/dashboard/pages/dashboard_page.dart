import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/reusable_widgets.dart';

class DashboardPage extends GetView<DashboardPage> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: txt(txt: 'DashBoard Page'),
      ),
    );
  }
}
