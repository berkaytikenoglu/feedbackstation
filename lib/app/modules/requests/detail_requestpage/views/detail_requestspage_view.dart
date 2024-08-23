import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requests/detail_requestpage/controllers/detail_requestspage_controller.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailRequestspageView extends GetView<DetailRequestspageController> {
  const DetailRequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = Get.arguments;
    final requestId = data["id"];
    final AppRequest requestInfo = data["detail"];

    TextEditingController tt = TextEditingController();
    tt.text = requestInfo.description;

    return Scaffold(
      appBar: AppbarWidget(title: "${requestInfo.category.name} Formu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: requestInfo.responseStatus == null
                        ? Container()
                        : Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: requestInfo.responseStatus!.color,
                              ),
                              width: 200,
                              child: Row(
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
                                  Icon(requestInfo.responseStatus!.icon)
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              CircleAvatar(
                foregroundImage: CachedNetworkImageProvider(
                  requestInfo.reportuser.avatar!.minUrl,
                ),
              ),
              Text(
                requestInfo.reportuser.displayname.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                "Tarih: ${requestInfo.date.day}.${requestInfo.date.month}.${requestInfo.date.year} #$requestId",
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
              Visibility(
                visible: requestInfo.documents.isNotEmpty,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                    contentPadding: const EdgeInsets.all(3),
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
              ),
              const Divider(),
              Container(
                height: 300,
                width: Get.width,
                color: Colors.red,
                child: Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: CachedNetworkImageProvider(
                        requestInfo.reportuser.avatar!.minUrl,
                      ),
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     labelText: "Label",
                    //     hintText: "Hint metni",
                    //     helperText: "Bu bir yardımcı metindir",
                    //     prefixIcon: Icon(Icons.person),
                    //     suffixIcon: Icon(Icons.check),
                    //     border: OutlineInputBorder(),
                    //     filled: true,
                    //     fillColor: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Container(
              //   height: 300,
              //   width: 300,
              //   color: Colors.amber,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
