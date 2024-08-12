import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/modules/homepages/admin/controllers/admin_home_controller.dart';
import 'package:feedbackstation/app/modules/requestspages/_main/views/requestspage_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomepageView extends StatelessWidget {
  const AdminHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminHomeController controller = Get.put(AdminHomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
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
                Get.offAllNamed("/login");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 210,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller
                              .categoryList[index].category.backGrndcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${controller.categoryList[index].value.toString()}K ",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_upward,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        controller
                                            .categoryList[index].category.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert_sharp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 118,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: LineChart(
                                  LineChartData(
                                      gridData: const FlGridData(show: false),
                                      titlesData:
                                          const FlTitlesData(show: false),
                                      borderData: FlBorderData(show: false),
                                      minX: 0,
                                      minY: 0,
                                      //maxY: 10,
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: [
                                            FlSpot(0, 11),
                                            FlSpot(1, 3),
                                            FlSpot(2, 6),
                                            FlSpot(3, 3),
                                            FlSpot(4, 7),
                                            FlSpot(5, 1),
                                            FlSpot(6, 5),
                                            FlSpot(8, 5),
                                            FlSpot(9, 8),
                                            FlSpot(10, 6),
                                            FlSpot(11, 4),
                                          ],
                                          isCurved: true,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          dotData: const FlDotData(show: true),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            color: Colors.white30,
                                          ),
                                        )
                                      ]
                                      // lineBarsData: [
                                      //   LineChartBarData(
                                      //     spots: List.generate(
                                      //       controller.categoryList[index]
                                      //           .saatlik!.length,
                                      //       (index2) {
                                      //         log(controller.categoryList[index]
                                      //             .saatlik![index2].values.last);
                                      //         log(controller.categoryList[index]
                                      //             .saatlik![index2].values.first);

                                      //         return FlSpot(
                                      //             index2.toDouble(),
                                      //             controller
                                      //                 .categoryList[index]
                                      //                 .saatlik![index2]
                                      //                 .values
                                      //                 .last
                                      //                 .toDouble());
                                      //       },
                                      //     ),
                                      //     isCurved: true,
                                      //     color: const Color.fromARGB(
                                      //         255, 255, 255, 255),
                                      //     dotData: const FlDotData(show: true),
                                      //     belowBarData: BarAreaData(
                                      //       show: true,
                                      //       color: Colors.white30,
                                      //     ),
                                      //   ),
                                      // ],
                                      ),
                                  duration: Durations.medium1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: LineChart(
                LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: const Text("|"),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: const Text("-"),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    minY: 0,
                    lineBarsData: List.generate(
                      controller.categoryList.length,
                      (index) {
                        return LineChartBarData(
                          spots: [
                            FlSpot(0, Random().nextDouble() * 31),
                            FlSpot(1, Random().nextDouble() * 31),
                            FlSpot(2, Random().nextDouble() * 31),
                            FlSpot(3, Random().nextDouble() * 31),
                            FlSpot(4, Random().nextDouble() * 31),
                            FlSpot(5, Random().nextDouble() * 31),
                            FlSpot(6, Random().nextDouble() * 31),
                          ],
                          isCurved: true,
                          color: controller
                              .categoryList[index].category.backGrndcolor,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: controller
                                .categoryList[index].category.backGrndcolor
                                .withOpacity(0.2),
                          ),
                        );
                      },
                    )),
                duration: Durations.medium1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
