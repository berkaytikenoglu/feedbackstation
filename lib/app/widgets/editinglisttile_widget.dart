import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditingListTileWidget {
  static Widget custom1(
      {required String title,
      required String text,
      required Function function}) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () async {
        TextEditingController randomtxt = TextEditingController();
        randomtxt.text = text;
        final a = await Get.dialog(
          Center(
            child: Material(
              type: MaterialType.card,
              child: Container(
                width: Get.width * 0.8,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text(
                        title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: TextfieldWidget.costum2(
                        controller: randomtxt,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back(
                          result: randomtxt.text,
                        );
                      },
                      child: const Text(
                        "Kaydet",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          barrierDismissible: true,
        );

        if (a != null) {
          if (a != "") {
            function(a);
          }
        }
      },
    );
  }
}
