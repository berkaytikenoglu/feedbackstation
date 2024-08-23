import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportcenterView extends StatelessWidget {
  const SupportcenterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final SupportcenterController controller =
    //     Get.put(SupportcenterController());

    return Obx(
      () => const Scaffold(
        appBar: AppbarWidget(title: "Ayarlar"),
        body: Column(
          children: [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
