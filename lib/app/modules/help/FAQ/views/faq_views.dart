import 'package:feedbackstation/app/modules/help/FAQ/controllers/faq_controllers.dart';

import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    final FAQController controller = Get.put(FAQController());

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
