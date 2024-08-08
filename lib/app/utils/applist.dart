import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:flutter/material.dart';

class AppList {
  static List<AppRequest> requestsList = [
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.report,
      description: "Hatalı Park",
      status: AppStatus.approved,
      date: "12.12.2022",
      media: null,
    ),
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.thanks,
      description: "Çalışanlar",
      status: AppStatus.approved,
      date: "19.08.2002",
      media: null,
    ),
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.request,
      description: "Zam",
      status: AppStatus.approved,
      date: "2.10.2022",
      media: null,
    ),
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.complaint,
      description: "Pis koku",
      status: AppStatus.denied,
      date: "12.12.2022",
      media: null,
    ),
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.informationRequest,
      description: "Vergi borcu",
      status: AppStatus.approved,
      date: "14.6.2020",
      media: null,
    ),
    AppRequest(
      id: 1,
      subject: null,
      category: FeedbackCategory.projectStatement,
      description: "Kaçak inşaat",
      status: AppStatus.ongoing,
      date: "2.8.2024",
      media: null,
    ),
  ];
}
