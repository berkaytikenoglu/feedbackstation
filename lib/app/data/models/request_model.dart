import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';

class AppRequest {
  final int id;
  final FeedbackCategory category;
  final String description;
  final String? subject;
  final AppStatus status;
  final Media? media;
  final String date;

  AppRequest({
    required this.id,
    required this.subject,
    required this.category,
    required this.description,
    required this.status,
    required this.media,
    required this.date,
  });
}
