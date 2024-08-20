import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/dashboard/detailing/controllers/admin_home_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/card_widget.dart';
import 'package:feedbackstation/app/widgets/chart.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomepageView extends StatelessWidget {
  const AdminHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarWidgetController());
    Get.put(DrawerWidgetController());

    final AdminHomeController controller = Get.put(AdminHomeController());

    return Scaffold(
      appBar: const AppbarWidget(title: "Admin Paneli"),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                    isSelected: List.generate(7,
                        (index) => index == controller.selectedTimeIndex.value),
                    onPressed: (int index) {
                      controller.updateTimeSelectedIndex(index);
                    },
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'Tüm Formlar',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'İstekler',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'Şikayetler',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'Proje Bildirimi',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'Bilgi Talebi',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'İhbar',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            'Teşşekür',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Obx(
                () => Visibility(
                  visible: true,
                  child: CardWidget.analysticcard(
                      controller.categoryStatusList, AppStatus.completed),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewhourly.value,
                  child: ChartWidget.asda(controller.categoryList, "hourly"),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewweekly.value,
                  child: ChartWidget.asda(controller.categoryList, "weekly"),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewmontly.value,
                  child: ChartWidget.asda(controller.categoryList, "monthly"),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.viewyearly.value,
                  child: ChartWidget.asda(controller.categoryList, "yearly"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Genel Talep Grafiği",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
