import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/message_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';

class AppRequest {
  final int id;
  final FeedbackCategory category;
  final String description;
  final String subject;
  final AppStatus status;
  final DateTime date;
  List<String> documents = [];
  final List<MessageModel>? messages;

  final AdresModel adresses;

  AppRequest({
    required this.id,
    required this.subject,
    required this.category,
    required this.description,
    required this.status,
    required this.date,
    required this.documents,
    required this.adresses,
    this.messages,
  });
}
