import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requestspages/detail_requestpage/controllers/detail_requestspage_controller.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailRequestspageView extends GetView<DetailRequestspageController> {
  const DetailRequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = Get.arguments;
    final requestId = data["id"];
    final detail = data["detail"];

    AppRequest requestInfo =
        AppList.requestsList.firstWhere((element) => element.id == requestId);

    TextEditingController tt = TextEditingController();
    tt.text = requestInfo.description;

    return Scaffold(
      appBar: AppBar(
        title: Text('$detail  Detay'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppInfo.appImage,
                      scale: 4,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: requestInfo.status.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              requestInfo.status.val,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            requestInfo.status.icon,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    foregroundImage: CachedNetworkImageProvider(
                      "https://justified.nuslawclub.com/content/images/size/w800/2023/01/bf2eef06-59b6-4298-9a8d-ab384f3aedc1-3e2ba297-d13b-4d9c-b91c-622b2c9a46dd-avatar-the-way-of-water612-4.jpeg",
                    ),
                  ),
                  const Text(
                    "Ad: Avatar Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Tarih: ${requestInfo.date} #$requestId",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Konu: ${requestInfo.subject} #$requestId",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(tt.text),
                  const SizedBox(height: 15),
                  const Text(
                    "Dosya ekleri:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: requestInfo.documents.length,
                      itemBuilder: (context, index) {
                        final file = requestInfo.documents[index];
                        log("Page|$index - $file");

                        List link = file.split("/");
                        String fileName = link[link.length - 1];

                        List ext = fileName.split(".");
                        Widget addedPreview = Container();
                        if ((ext[1].toLowerCase() == 'jpg' ||
                            ext[1].toLowerCase() == 'png' ||
                            ext[1].toLowerCase() == 'jpeg' ||
                            ext[1].toLowerCase() == 'webp')) {
                          addedPreview = Container(
                            color: Colors.black,
                            height: 200,
                            width: 300,
                            child: CachedNetworkImage(
                              imageUrl: file,
                              fit: BoxFit.contain,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                addedPreview,
                                ListTile(
                                  contentPadding: EdgeInsets.all(3),
                                  title: SingleChildScrollView(
                                    child: Text(fileName),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.download),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: requestInfo.messages == null
                    ? null
                    : Column(
                        children: List.generate(
                          requestInfo.messages!.length,
                          (index) {
                            Widget avatar = Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    foregroundImage: CachedNetworkImageProvider(
                                      index % 2 == 0
                                          ? requestInfo.messages![index]
                                              .senderUser.avatar!.minUrl
                                          : "https://justified.nuslawclub.com/content/images/size/w800/2023/01/bf2eef06-59b6-4298-9a8d-ab384f3aedc1-3e2ba297-d13b-4d9c-b91c-622b2c9a46dd-avatar-the-way-of-water612-4.jpeg",
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      index % 2 == 0
                                          ? requestInfo
                                              .messages![index].senderUser.name!
                                          : "Joe Doe",
                                    ),
                                  ),
                                  index % 2 == 0
                                      ? const Text("Personel")
                                      : const Text("Vatandaş")
                                ],
                              ),
                            );

                            Widget text = Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.05,
                                    color: Colors.grey,
                                  ),
                                ),
                                height: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            requestInfo
                                                .messages![index].message,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                            if (index % 2 == 0) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      avatar,
                                      text,
                                    ],
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("11.11.2023"),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      text,
                                      avatar,
                                    ],
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("11.11.2023"),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
