import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requests/detail_requestpage/views/detail_requestspage_view.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/card_widget.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarWidgetController());
    Get.put(DrawerWidgetController());

    // final MainHomeController controller = Get.put(MainHomeController());

    return Scaffold(
      appBar: const AppbarWidget(title: "Kullanıcı Paneli"),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    AppStatus.values.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardWidget.statusCardWidget(
                          backgroundcolor:
                              AppStatus.values[index].backgroundcolor,
                          category: AppStatus.values[index].val,
                          categoryvalue: "12",
                          color: AppStatus.values[index].color,
                          icon: AppStatus.values[index].icon,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.star_border),
                        title: Text("Hızlı Erişim"),
                        tileColor: Colors.yellow,
                      ),
                      ListTile(
                        title: Text("Talep oluştur"),
                        tileColor: Color.fromARGB(255, 224, 223, 223),
                        onTap: () {
                          Get.toNamed("/requests/create");
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text("Yardım Masası"),
                        leading: Icon(Icons.help_center),
                        titleAlignment: ListTileTitleAlignment.center,
                        tileColor: Colors.yellow,
                      ),
                      ListTile(
                        leading: const Icon(Icons.sos),
                        title: const Text("Sıkça Sorulan Sorular"),
                        tileColor: const Color.fromARGB(255, 224, 223, 223),
                        onTap: () {
                          Get.toNamed("/FAQ");
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text("Destek Merkezi"),
                        tileColor: const Color.fromARGB(255, 224, 223, 223),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Son Taleplerim"),
                      tileColor: Colors.blue,
                      trailing: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/requests/list/");
                        },
                        child: const Text("Tüm Taleplerimi Göster"),
                      ),
                    ),
                    ...List.generate(
                      AppList.requestsList.length,
                      (index) {
                        return ListTile(
                          leading: Icon(
                              AppList.requestsList[index].category.homepgIcon),
                          title: Text(
                              "${AppList.requestsList[index].category.title} - ${AppList.requestsList[index].subject}"),
                          tileColor: const Color.fromARGB(255, 224, 223, 223),
                          trailing: Icon(
                            AppList.requestsList[index].status.icon,
                            color: AppList
                                .requestsList[index].status.backgroundcolor,
                          ),
                          onTap: () {
                            Get.to(() => const DetailRequestspageView(),
                                arguments: {
                                  "id": AppList.requestsList[index].id,
                                  "detail": AppList
                                      .requestsList[index].category.title,
                                });
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
