import 'package:feedbackstation/app/modules/requests/_main/bindings/main_requestpage_binding.dart';
import 'package:feedbackstation/app/modules/requests/_main/views/main_requestpage_view.dart';
import 'package:feedbackstation/app/modules/requests/create_requestpage/bindings/create_requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requests/detail_requestpage/bindings/detail_requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requests/list_requestpage/bindings/requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requests/create_requestpage/views/create_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requests/detail_requestpage/views/detail_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requests/list_requestpage/views/requestspage_view.dart';
import 'package:get/get.dart';

class RequestspageModule {
  static const route = '/requests';

  static final List<GetPage> routes = [
    GetPage(
      name: route,
      page: () => const MainRequestpageView(),
      binding: MainRequestspageBinding(),
    ),
    GetPage(
      name: '$route/list/',
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
