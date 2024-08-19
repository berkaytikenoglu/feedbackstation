// import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
// import 'package:feedbackstation/app/modules/requests/create_requestpage/views/create_requestspage_view.dart';
// import 'package:feedbackstation/app/widgets/appbar_widget.dart';
// import 'package:feedbackstation/app/widgets/drawer_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RequestmainpageView extends StatelessWidget {
//   const RequestmainpageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppbarWidget.appbar(title: "Ana Sayfa"),
//       drawer: DrawerWidget.drawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
//             crossAxisSpacing: 10, // Sütunlar arasındaki boşluk
//             mainAxisSpacing: 10, // Satırlar arasındaki boşluk
//             childAspectRatio: 1.618, // Çocukların en/boy oranı
//           ),
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Icon(
//                 FeedbackCategory.values[index].homepgIcon,
//                 size: 100,
//                 color: Colors.white,
//               ),
//               title: SizedBox(
//                 child: Text(
//                   FeedbackCategory.values[index].title,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               subtitle: SizedBox(
//                 height: 100,
//                 child: SingleChildScrollView(
//                   child: Text(
//                     FeedbackCategory.values[index].subtitle,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               tileColor: const Color(0xFF3C4CBD),
//               onTap: () {
//                 Get.to(() => const CreateRequestspageView(), arguments: {
//                   "page": FeedbackCategory.values[index].title,
//                   "category": FeedbackCategory.values[index],
//                 });
//               },
//             );
//           },
//           itemCount: FeedbackCategory.values.length,
//         ),
//       ),
//     );
//   }
// }
