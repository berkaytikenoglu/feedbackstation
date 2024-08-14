import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/modules/profile/settings/controllers/settings_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileView extends StatelessWidget {
  const SettingsProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsProfileController controller =
        Get.put(SettingsProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
        actions: const [
          Text("John Doe"),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              foregroundImage: CachedNetworkImageProvider(
                  "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400,
                    child: Container(
                      color: Colors.red.shade100,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,
                            foregroundImage: CachedNetworkImageProvider(
                                "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
                          ),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Yönetici",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Hesap ID',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              "TR-6866",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          child: TabBar(
                            controller: controller.tabbarController,
                            tabs: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Kullanıcı Bilgileri"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Erişim Bilgileri"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Avatar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Loglar"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                              controller: controller.tabbarController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          "Kullanıcı Bilgileri",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: null,
                                          child: Text("Güncelle"),
                                        )
                                      ],
                                    ),
                                    // SizedBox(height: 200),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Ad ve Soyad',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "Ömer Faruk SEVGİ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'TC kimlik No',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "35785469269",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Hesap ID',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "TR-6866",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Telefon numarası ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "0535 636 5920",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Cinsiyet',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "Erkek",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'E-posta adresi',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "abc@hotmail.com",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          "Adres Bilgileri",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: null,
                                          child: Text("Güncelle"),
                                        )
                                      ],
                                    ),
                                    // SizedBox(height: 200),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Mahalle ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "Dolunay",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Sokak-Cadde',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "Kumru sokak",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        ' Sokak-Cadde-Ara',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "---------",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Dış kapı No ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "15",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'İç Kapı No',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "32",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Adres Tarif',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "A market Karşısı",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          "Avatar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          onPressed: null,
                                          child: Text("Güncelle"),
                                        )
                                      ],
                                    ),
                                    // SizedBox(height: 200),
                                  ],
                                ),
                                Text("data4"),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
