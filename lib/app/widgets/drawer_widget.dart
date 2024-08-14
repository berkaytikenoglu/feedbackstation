import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget {
  static Widget drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            decoration: BoxDecoration(
              color: Color(0xFF3C4CBD),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFF3C4CBD),
              backgroundImage: CachedNetworkImageProvider(
                'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart_rounded),
            title: const Text('Taleplerim'),
            onTap: () {
              Get.toNamed("/requests");
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Gösterge Paneli'),
            onTap: () {
              Get.toNamed("/dashboard/admin");
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Gösterge Paneli v2'),
            onTap: () {
              Get.toNamed("/dashboard/user");
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış Yap'),
            onTap: () {
              Get.offAllNamed("/login");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ayarlar'),
            onTap: () {
              // Ayarlar sayfasına yönlendirme
              Get.toNamed("/profile/settings");
            },
          ),
        ],
      ),
    );
  }
}
