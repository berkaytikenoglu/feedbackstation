import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/message_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';

class AppRequest {
  final int id;
  final User reportuser;
  final FeedbackCategory category;
  final String description;
  final String subject;
  final AppStatus status;
  FeedbackStatus? responseStatus;
  final DateTime date;
  List<String> documents = [];
  final List<MessageModel>? messages;

  final AddresModel adresses;

  AppRequest({
    required this.id,
    required this.reportuser,
    required this.subject,
    required this.category,
    required this.description,
    required this.status,
    this.responseStatus,
    required this.date,
    required this.documents,
    required this.adresses,
    this.messages,
  });
}
