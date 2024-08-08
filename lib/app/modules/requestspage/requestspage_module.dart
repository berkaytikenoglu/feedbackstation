import 'package:feedbackstation/app/modules/requestspage/bindings/create_requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requestspage/bindings/requestspage_binding.dart';
import 'package:feedbackstation/app/modules/requestspage/views/create_requestspage_view.dart';
import 'package:feedbackstation/app/modules/requestspage/views/requestspage_view.dart';
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
      name: '$route/create/:id',
      page: () => const CreateRequestspageView(),
      binding: CreateRequestspageBinding(),
    ),
  ];
}
