import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget implements PreferredSizeWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller'ı widget içinde bağla
    final DrawerWidgetController drawerController =
        Get.find<DrawerWidgetController>();

    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 190,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "https://www.fatsa.bel.tr/public/site-v1/img/slide/2.jpg",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => CircleAvatar(
                    backgroundColor: const Color(0xFF3C4CBD),
                    radius: 40,
                    backgroundImage: CachedNetworkImageProvider(
                      drawerController.avatarUrl.value,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      drawerController.displayName.value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "${drawerController.permission.value!.category} (${drawerController.permission.value!.name})",
                      style: const TextStyle(color: Colors.amber),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart_rounded),
            title: const Text('Taleplerim'),
            onTap: () {
              Get.toNamed("/requests/list");
            },
          ),
          Visibility(
            visible: AppSession.user.permission!.canShowAdminPanel,
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Gösterge Paneli (Admin İstatistik)'),
              onTap: () {
                Get.toNamed("/dashboard");
              },
            ),
          ),
          Visibility(
            visible: AppSession.user.permission!.canShowAdminPanel,
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Gösterge Paneli'),
              onTap: () {
                Get.toNamed("/dashboard/users");
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ayarlar'),
            onTap: () {
              Get.toNamed("/profile/settings",
                  arguments: {"user": AppSession.user});
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Hizmet Yöntetim Sayfası'),
            onTap: () {
              Get.toNamed("/Adminsettings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış Yap'),
            tileColor: Colors.red,
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () {
              Get.offAllNamed("/login");
            },
          ),
          const SizedBox(
            height: 310,
          ),
          const Text(
            "Versiyon:0.8",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
