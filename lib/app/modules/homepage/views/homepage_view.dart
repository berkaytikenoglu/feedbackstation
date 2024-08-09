import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/modules/requestspage/views/create_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requestspage/views/requestspage_view.dart';
import 'package:feedbackstation/app/modules/startingpage/views/startingpage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
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
      drawer: Drawer(
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
              leading: const Icon(Icons.home),
              title: const Text('Taleplerim'),
              onTap: () {
                Get.to(() => const RequestspageView());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                // Ayarlar sayfasına yönlendirme
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Çıkış Yap'),
              onTap: () {
                Get.to(() => const StartingpageView());
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Grid'deki sütun sayısı
            crossAxisSpacing: 10, // Sütunlar arasındaki boşluk
            mainAxisSpacing: 10, // Satırlar arasındaki boşluk
            childAspectRatio: 1.618, // Çocukların en/boy oranı
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: FeedbackCategory.values[index].homepgIcon,
              title: SizedBox(
                child: Text(
                  FeedbackCategory.values[index].title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              subtitle: SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: Text(
                    FeedbackCategory.values[index].subtitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              tileColor: FeedbackCategory.values[index].backGrndcolor,
              onTap: () {
                Get.to(() => const CreateRequestspageView(), arguments: {
                  "page": FeedbackCategory.values[index].title,
                  "content": FeedbackCategory.values[index].title,
                });
              },
            );
          },
          itemCount: FeedbackCategory.values.length,
        ),
      ),
    );
  }
}
