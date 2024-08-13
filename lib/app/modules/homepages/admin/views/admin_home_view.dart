import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
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
    String calculatePercentageChange(double initialValue, double finalValue) {
      if (initialValue == 0) {
        return ("??");
      }

      double change = finalValue - initialValue;
      double percentageChange = (change / initialValue) * 100;
      return "${percentageChange.toStringAsFixed(2)}%";
    }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => Visibility(
                  visible: controller.viewhourly.value,
                  child: SizedBox(
                    height: 210,
                    child: ListView.builder(
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
                                                "${controller.categoryList[index].hourValue! > 1000000 ? "${(controller.categoryList[index].hourValue! / 1000000).toStringAsFixed(1)}M" : controller.categoryList[index].hourValue! > 1000 ? "${(controller.categoryList[index].hourValue! / 1000).toStringAsFixed(1)}K" : controller.categoryList[index].hourValue}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                              const Text(
                                                "(",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                calculatePercentageChange(
                                                  controller.categoryList[index]
                                                      .hourly!.first.values.last
                                                      .toDouble(),
                                                  controller.categoryList[index]
                                                      .hourly!.last.values.last
                                                      .toDouble(),
                                                ),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              controller
                                                              .categoryList[
                                                                  index]
                                                              .hourly!
                                                              .last
                                                              .values
                                                              .last -
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .hourly!
                                                              .first
                                                              .values
                                                              .last >
                                                      0
                                                  ? const Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                              const Text(
                                                ")",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller.categoryList[index]
                                                .category.title,
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
                                    child: controller.categoryList[index]
                                                .hourValue! ==
                                            0
                                        ? const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Veri yok",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        : LineChart(
                                            LineChartData(
                                              gridData: const FlGridData(
                                                show: false,
                                              ),
                                              titlesData: const FlTitlesData(
                                                  show: false),
                                              borderData:
                                                  FlBorderData(show: false),
                                              minX: 0,
                                              minY: 0,
                                              lineTouchData: LineTouchData(
                                                touchTooltipData:
                                                    LineTouchTooltipData(
                                                  getTooltipItems:
                                                      (List<LineBarSpot>
                                                          touchedSpots) {
                                                    return touchedSpots
                                                        .asMap()
                                                        .entries
                                                        .map((entry) {
                                                      int index = entry
                                                          .key; // Indeksi al

                                                      LineBarSpot spot = entry
                                                          .value; // Spot'u al

                                                      int indexval =
                                                          spot.x.round();

                                                      return LineTooltipItem(
                                                        '${controller.categoryList[index].hourly![indexval].keys.first} \n${spot.y.toStringAsFixed(1)}',
                                                        const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      );
                                                    }).toList();
                                                  },
                                                ),
                                              ),
                                              lineBarsData: [
                                                LineChartBarData(
                                                  spots: List.generate(
                                                    controller
                                                        .categoryList[index]
                                                        .hourly!
                                                        .length,
                                                    (index2) {
                                                      return FlSpot(
                                                          index2.toDouble(),
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .hourly![index2]
                                                              .values
                                                              .last
                                                              .toDouble());
                                                    },
                                                  ),
                                                  isCurved: true,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  dotData: const FlDotData(
                                                    show: true,
                                                  ),
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
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
              ),

              Obx(
                () => Visibility(
                  visible: controller.viewweekly.value,
                  child: SizedBox(
                    height: 210,
                    child: ListView.builder(
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
                                                "${controller.categoryList[index].weeklyValue! > 1000000 ? "${(controller.categoryList[index].weeklyValue! / 1000000).toStringAsFixed(1)}M" : controller.categoryList[index].weeklyValue! > 1000 ? "${(controller.categoryList[index].weeklyValue! / 1000).toStringAsFixed(1)}K" : controller.categoryList[index].weeklyValue}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                              const Text(
                                                "(",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                calculatePercentageChange(
                                                  controller.categoryList[index]
                                                      .weekly!.first.values.last
                                                      .toDouble(),
                                                  controller.categoryList[index]
                                                      .weekly!.last.values.last
                                                      .toDouble(),
                                                ),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              controller
                                                              .categoryList[
                                                                  index]
                                                              .weekly!
                                                              .last
                                                              .values
                                                              .last -
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .weekly!
                                                              .first
                                                              .values
                                                              .last >
                                                      0
                                                  ? const Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                              const Text(
                                                ")",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller.categoryList[index]
                                                .category.title,
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
                                    child: controller.categoryList[index]
                                                .hourValue! ==
                                            0
                                        ? const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Veri yok",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        : LineChart(
                                            LineChartData(
                                              gridData: const FlGridData(
                                                show: false,
                                              ),
                                              titlesData: const FlTitlesData(
                                                  show: false),
                                              borderData:
                                                  FlBorderData(show: false),
                                              minX: 0,
                                              minY: 0,
                                              lineTouchData: LineTouchData(
                                                touchTooltipData:
                                                    LineTouchTooltipData(
                                                  getTooltipItems:
                                                      (List<LineBarSpot>
                                                          touchedSpots) {
                                                    return touchedSpots
                                                        .asMap()
                                                        .entries
                                                        .map((entry) {
                                                      int index = entry
                                                          .key; // Indeksi al

                                                      LineBarSpot spot = entry
                                                          .value; // Spot'u al

                                                      int indexval =
                                                          spot.x.round();

                                                      return LineTooltipItem(
                                                        '${controller.categoryList[index].weekly![indexval].keys.first} \n${spot.y.toStringAsFixed(1)}',
                                                        const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      );
                                                    }).toList();
                                                  },
                                                ),
                                              ),
                                              lineBarsData: [
                                                LineChartBarData(
                                                  spots: List.generate(
                                                    controller
                                                        .categoryList[index]
                                                        .weekly!
                                                        .length,
                                                    (index2) {
                                                      return FlSpot(
                                                          index2.toDouble(),
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .weekly![index2]
                                                              .values
                                                              .last
                                                              .toDouble());
                                                    },
                                                  ),
                                                  isCurved: true,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  dotData: const FlDotData(
                                                    show: true,
                                                  ),
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
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
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewmontly.value,
                  child: SizedBox(
                    height: 210,
                    child: ListView.builder(
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
                                                "${controller.categoryList[index].monthlyValue! > 1000000 ? "${(controller.categoryList[index].monthlyValue! / 1000000).toStringAsFixed(1)}M" : controller.categoryList[index].monthlyValue! > 1000 ? "${(controller.categoryList[index].monthlyValue! / 1000).toStringAsFixed(1)}K" : controller.categoryList[index].monthlyValue}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                              const Text(
                                                "(",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                calculatePercentageChange(
                                                  controller
                                                      .categoryList[index]
                                                      .monthly!
                                                      .first
                                                      .values
                                                      .last
                                                      .toDouble(),
                                                  controller.categoryList[index]
                                                      .monthly!.last.values.last
                                                      .toDouble(),
                                                ),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              controller
                                                              .categoryList[
                                                                  index]
                                                              .monthly!
                                                              .last
                                                              .values
                                                              .last -
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .monthly!
                                                              .first
                                                              .values
                                                              .last >
                                                      0
                                                  ? const Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                              const Text(
                                                ")",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller.categoryList[index]
                                                .category.title,
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
                                    child: controller.categoryList[index]
                                                .hourValue! ==
                                            0
                                        ? const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Veri yok",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        : LineChart(
                                            LineChartData(
                                              gridData: const FlGridData(
                                                show: false,
                                              ),
                                              titlesData: const FlTitlesData(
                                                  show: false),
                                              borderData:
                                                  FlBorderData(show: false),
                                              minX: 0,
                                              minY: 0,
                                              lineTouchData: LineTouchData(
                                                touchTooltipData:
                                                    LineTouchTooltipData(
                                                  getTooltipItems:
                                                      (List<LineBarSpot>
                                                          touchedSpots) {
                                                    return touchedSpots
                                                        .asMap()
                                                        .entries
                                                        .map((entry) {
                                                      int index = entry
                                                          .key; // Indeksi al

                                                      LineBarSpot spot = entry
                                                          .value; // Spot'u al

                                                      int indexval =
                                                          spot.x.round();

                                                      return LineTooltipItem(
                                                        '${controller.categoryList[index].monthly![indexval].keys.first} \n${spot.y.toStringAsFixed(1)}',
                                                        const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      );
                                                    }).toList();
                                                  },
                                                ),
                                              ),
                                              lineBarsData: [
                                                LineChartBarData(
                                                  spots: List.generate(
                                                    controller
                                                        .categoryList[index]
                                                        .monthly!
                                                        .length,
                                                    (index2) {
                                                      return FlSpot(
                                                          index2.toDouble(),
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .monthly![index2]
                                                              .values
                                                              .last
                                                              .toDouble());
                                                    },
                                                  ),
                                                  isCurved: true,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  dotData: const FlDotData(
                                                    show: true,
                                                  ),
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
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
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewyearly.value,
                  child: SizedBox(
                    height: 210,
                    child: ListView.builder(
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
                                                "${controller.categoryList[index].yearlyValue! > 1000000 ? "${(controller.categoryList[index].yearlyValue! / 1000000).toStringAsFixed(1)}M" : controller.categoryList[index].yearlyValue! > 1000 ? "${(controller.categoryList[index].yearlyValue! / 1000).toStringAsFixed(1)}K" : controller.categoryList[index].yearlyValue}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                              const Text(
                                                "(",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                calculatePercentageChange(
                                                  controller.categoryList[index]
                                                      .yearly!.first.values.last
                                                      .toDouble(),
                                                  controller.categoryList[index]
                                                      .yearly!.last.values.last
                                                      .toDouble(),
                                                ),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              controller
                                                              .categoryList[
                                                                  index]
                                                              .yearly!
                                                              .last
                                                              .values
                                                              .last -
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .yearly!
                                                              .first
                                                              .values
                                                              .last >
                                                      0
                                                  ? const Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                              const Text(
                                                ")",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller.categoryList[index]
                                                .category.title,
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
                                    child: controller.categoryList[index]
                                                .hourValue! ==
                                            0
                                        ? const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Veri yok",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        : LineChart(
                                            LineChartData(
                                              gridData: const FlGridData(
                                                show: false,
                                              ),
                                              titlesData: const FlTitlesData(
                                                  show: false),
                                              borderData:
                                                  FlBorderData(show: false),
                                              minX: 0,
                                              minY: 0,
                                              lineTouchData: LineTouchData(
                                                touchTooltipData:
                                                    LineTouchTooltipData(
                                                  getTooltipItems:
                                                      (List<LineBarSpot>
                                                          touchedSpots) {
                                                    return touchedSpots
                                                        .asMap()
                                                        .entries
                                                        .map((entry) {
                                                      int index = entry
                                                          .key; // Indeksi al

                                                      LineBarSpot spot = entry
                                                          .value; // Spot'u al

                                                      int indexval =
                                                          spot.x.round();

                                                      return LineTooltipItem(
                                                        '${controller.categoryList[index].yearly![indexval].keys.first} \n${spot.y.toStringAsFixed(1)}',
                                                        const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      );
                                                    }).toList();
                                                  },
                                                ),
                                              ),
                                              lineBarsData: [
                                                LineChartBarData(
                                                  spots: List.generate(
                                                    controller
                                                        .categoryList[index]
                                                        .yearly!
                                                        .length,
                                                    (index2) {
                                                      return FlSpot(
                                                          index2.toDouble(),
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .yearly![index2]
                                                              .values
                                                              .last
                                                              .toDouble());
                                                    },
                                                  ),
                                                  isCurved: true,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  dotData: const FlDotData(
                                                    show: true,
                                                  ),
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
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
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ToggleButtons(
                    color: Colors.grey,
                    borderColor: Colors.grey,
                    selectedColor: Colors.white,
                    selectedBorderColor: Colors.blue,
                    fillColor: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    isSelected: List.generate(
                        4, (index) => index == controller.selectedIndex.value),
                    onPressed: (int index) {
                      controller.updateSelectedIndex(index);
                    },
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 55,
                          child: Text(
                            'Günlük',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 55,
                          child: Text(
                            'Haftalık',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 55,
                          child: Text(
                            'Aylık',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 55,
                          child: Text(
                            'Yıllık',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              // Spacer(),
              SizedBox(
                height: 400,
                child: LineChart(
                  LineChartData(
                      gridData: const FlGridData(
                        drawVerticalLine: false,
                        drawHorizontalLine: true,
                      ),
                      titlesData: const FlTitlesData(
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            reservedSize: 50,
                            showTitles: true,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
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
                              ...List.generate(
                                controller.categoryList[index].hourly!.length,
                                (index2) {
                                  return FlSpot(
                                      index2.toDouble(),
                                      controller.categoryList[index]
                                          .hourly![index2].values.first
                                          .toDouble());
                                },
                              ),
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
              const Text("İstekler"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text("Şikayet"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text("Proje Bildirimi"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text("Bilgi Talebi"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text("İhbar"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text("Teşekkür"),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ...List.generate(
                          AppStatus.values.length,
                          (index) {
                            if (AppStatus.values[index] == AppStatus.close ||
                                AppStatus.values[index] == AppStatus.open ||
                                AppStatus.values[index] == AppStatus.pending) {
                              return Container();
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: AppStatus.values[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    AppStatus.values[index].icon,
                                    Text(
                                      AppStatus.values[index].val,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Text(
                                      "594",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
