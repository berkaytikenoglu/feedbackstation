import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardAdminView extends StatelessWidget {
  const DashboardAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    // final DashboardAdminController controller =
    //     Get.put(DashboardAdminController());

    return Scaffold(
      appBar: const AppbarWidget(
        title: "Gösterge Paneli",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Row(
              children: [
                const Spacer(),
                CardWidget.asdakslaandasd(
                  title: "Yetkili Sayısı",
                  subtitle: (AppList.userList
                          .where(
                            (element) =>
                                element.permission!.category == "Bilgi İşlem",
                          )
                          .toList()
                          .length)
                      .toString(),
                  background: Colors.black,
                  icon: Icons.support_agent_rounded,
                ),
                const Spacer(),
                CardWidget.asdakslaandasd(
                    title: "Vatandaş Sayısı",
                    subtitle: (AppList.userList
                            .where(
                              (element) =>
                                  element.permission!.category == "Kullanıcı",
                            )
                            .toList()
                            .length)
                        .toString(),
                    background: Colors.amber,
                    icon: Icons.person),
                const Spacer(),
                CardWidget.asdakslaandasd(
                    title: "Üye Sayısı",
                    subtitle: (AppList.userList.length).toString(),
                    background: Colors.cyan,
                    icon: Icons.summarize),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: const FixedColumnWidth(320.0),
                    1: const FixedColumnWidth(140.0),
                    2: const FixedColumnWidth(250.0),
                    3: FixedColumnWidth(Get.width - 726),
                  },
                  // defaultColumnWidth: const FixedColumnWidth(200.0),
                  children: [
                    const TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("AD"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Ünvan",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("rol"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(""),
                        ),
                      ],
                    ),
                    ...List.generate(
                      AppList.userList.length,
                      (index) {
                        return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Colors.grey,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: CachedNetworkImageProvider(
                                      AppList.userList[index].avatar!.minUrl,
                                    ),
                                    radius: 26,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppList.userList[index].displayname
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          AppList.userList[index].email
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppList.userList[index].permission!.name,
                                  ),
                                  Text(
                                    AppList
                                        .userList[index].permission!.category,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppList.userList[index].email.toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Düzenle",
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
