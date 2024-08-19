import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class MainRequestpageView extends StatelessWidget {
  const MainRequestpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(title: "Ana Sayfa"),
      drawer: DrawerWidget(),
    );
  }
}
