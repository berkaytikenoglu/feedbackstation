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
        return Icon(Icons.remove);
      case AppStatus.close:
        return Icon(Icons.remove);
      case AppStatus.pending:
        return Icon(Icons.remove);
      case AppStatus.approved:
        return Icon(Icons.check);
      case AppStatus.denied:
        return Icon(Icons.cancel_outlined);
      case AppStatus.ongoing:
        return Icon(Icons.remove_circle_outline_sharp);
    }
  }
}

enum AppStatus { open, close, pending, approved, denied, ongoing }
