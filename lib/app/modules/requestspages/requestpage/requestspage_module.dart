import 'package:feedbackstation/app/modules/requestspages/requestpage/bindings/create_requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requestspages/detail_requestpage/bindings/detail_requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/bindings/requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/views/create_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/views/detail_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/views/requestspage_view.dart';
import 'package:get/get.dart';

class RequestspageModule {
  static const route = '/requests';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const RequestspageView(),
      binding: RequestspageBinding(),
    ),
    GetPage(
      name: '$route/create/',
      page: () => const CreateRequestspageView(),
      binding: CreateRequestspageBinding(),
    ),
    GetPage(
      name: '$route/detail/',
      page: () => const DetailRequestspageView(),
      binding: DetailRequestspageBinding(),
    ),
  ];
}
