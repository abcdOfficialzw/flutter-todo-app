// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:todo/res/values/dimensions.dart';
// import 'package:todo/ui/theme/type.dart';

// class TaskView extends StatelessWidget {
//   const TaskView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.01;

//     return Scaffold(
//         appBar: AppBar(
//           leading: const Icon(Icons.arrow_back_ios),
//         ),
//         backgroundColor: Theme.of(context).colorScheme.background,
//         body: SingleChildScrollView(
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(Dimens.padding.defaultHorizontal,
//                   scaffoldTopPadding, Dimens.padding.defaultHorizontal, 0),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Text(
//                       "TASKS IN TO DO",
//                       style: materialTextTheme().headlineMedium,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.8,
//                     child: ListView.builder(
//                         itemCount: pinned["totalElements"],
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (BuildContext context, int index) {
//                           print("totalElements: ${pinned["totalElements"]}");

//                           return Card(
//                             elevation: 3,
//                             child: ListTile(
//                               leading: GestureDetector(
//                                 onTap: (() async {
//                                   String response =
//                                       await NetworkingService.updateStatus(
//                                     taskId: pinned["content"][index]["id"],
//                                     status: pinned["content"][index]["status"],
//                                     description: pinned["content"][index]
//                                         ["description"],
//                                     assigneeId: pinned["content"][index]
//                                         ["assigneeId"],
//                                     pinned: pinned["content"][index]["pinned"],
//                                   );

//                                   if (response == 'success') {
//                                     setState(() {
//                                       getTasks(assigneeId: User.assigneeId);
//                                     });
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(const SnackBar(
//                                       content: Text(
//                                           'your task was updated successfully'),
//                                     ));
//                                   } else {
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(const SnackBar(
//                                       content: Text(
//                                           'Something went wrong, please try again'),
//                                     ));
//                                   }
//                                 }),
//                                 child: Icon(Icons.circle,
//                                     color: (pinned["content"][index]
//                                                 ["status"] ==
//                                             'TO_DO')
//                                         ? Colors.white
//                                         : Colors.amber),
//                               ),
//                               title: Text(
//                                 pinned["content"][index]["description"],
//                                 style: materialTextTheme().bodyMedium,
//                               ),
//                               // ignore: prefer_interpolation_to_compose_strings
//                               subtitle: Text(
//                                 "STATUS: ${pinned["content"][index]["status"]}",
//                                 style: materialTextTheme().bodySmall,
//                               ),
//                               trailing: GestureDetector(
//                                   onTap: (() async {
//                                     var response =
//                                         await NetworkingService.unPinTask(
//                                             pinned["content"][index]["id"]);

//                                     print("test response $response");
//                                     if (response == 'success') {
//                                       // ignore: use_build_context_synchronously

//                                       setState(() {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                           content: Text(
//                                               'your task was unpinned successfully'),
//                                         ));
//                                         getTasks(assigneeId: User.assigneeId);
//                                         reload = !reload;
//                                       });
//                                     } else {
//                                       // ignore: use_build_context_synchronously
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(const SnackBar(
//                                         content: Text(
//                                             'A problem occurred while unpinning your task'),
//                                       ));
//                                     }
//                                   }),
//                                   child: const Icon(Icons.push_pin)),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               )),
//         ));
//   }
// }
