import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';

class AppbarWidget {
  static appbar({required String title}) {
    return AppBar(
      title: Text(title),
      actions: [
        Text(AppSession.user!.displayname!),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            foregroundImage: CachedNetworkImageProvider(
              AppSession.user!.avatar!.normalUrl,
            ),
          ),
        ),
      ],
    );
  }
}
