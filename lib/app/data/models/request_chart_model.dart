import 'package:feedbackstation/app/data/models/feedbacks_model.dart';

class AppChartRequest {
  final FeedbackCategory category;
  final int value;

  List<Map<String, int>>? saatlik;
  List<Map<String, int>>? haftalik;
  List<Map<String, int>>? aylik;
  List<Map<String, int>>? yillik;

  AppChartRequest({
    required this.category,
    required this.value,
    this.saatlik,
    this.haftalik,
    this.aylik,
    this.yillik,
  });
}
