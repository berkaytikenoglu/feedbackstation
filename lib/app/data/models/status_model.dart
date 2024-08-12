import 'package:flutter/material.dart';

extension StatusExtension on AppStatus {
  String get val {
    switch (this) {
      case AppStatus.open:
        return "Açık";
      case AppStatus.close:
        return "Kapalı";
      case AppStatus.pending:
        return "Bekleniyor";
      case AppStatus.approved:
        return "Onaylandı";
      case AppStatus.denied:
        return "Reddedildi";
      case AppStatus.ongoing:
        return "İşlemde";
    }
  }

  Icon get icon {
    switch (this) {
      case AppStatus.open:
        return const Icon(Icons.remove);
      case AppStatus.close:
        return const Icon(Icons.remove);
      case AppStatus.pending:
        return const Icon(Icons.remove);
      case AppStatus.approved:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case AppStatus.denied:
        return const Icon(
          Icons.cancel_outlined,
          color: Colors.red,
        );
      case AppStatus.ongoing:
        return const Icon(
          Icons.remove_circle_outline_sharp,
          color: Colors.amber,
        );
    }
  }

  Color get color {
    switch (this) {
      case AppStatus.open:
        return Colors.purple;
      case AppStatus.close:
        return Colors.blue;
      case AppStatus.pending:
        return Colors.black;
      case AppStatus.approved:
        return Colors.green;
      case AppStatus.denied:
        return Colors.red;
      case AppStatus.ongoing:
        return Colors.yellow;
    }
  }
}

enum AppStatus { open, close, pending, approved, denied, ongoing }
