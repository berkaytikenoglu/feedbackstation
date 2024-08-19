import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    // Controller'ı widget içinde bağla
    final AppBarWidgetController appBarController =
        Get.find<AppBarWidgetController>();

    return AppBar(
      title: Text(title),
      actions: [
        Obx(() => Text(appBarController.displayName.value)),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => CircleAvatar(
                foregroundImage: CachedNetworkImageProvider(
                  appBarController.avatarUrl.value,
                ),
              )),
        ),
      ],
    );
  }

  // `PreferredSizeWidget` için zorunlu olan özellik
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
