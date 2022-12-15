import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/services/networking_service.dart';
import 'package:todo/ui/home_page/widgets/todo_list_tile.dart';
import 'package:todo/ui/theme/type.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<dynamic, dynamic> pinned = {};
  Future<Map<dynamic, dynamic>> getTasks({required int assigneeId}) async {
    Map<String, dynamic> pinnedTasks =
        await NetworkingService.getPinnedTasks(assigneeId: assigneeId);
    if (pinnedTasks["status"] == 200) {
      print("Tasks: $pinnedTasks");
      print("content> ${pinnedTasks["content"]["content"]}");
      pinned = pinnedTasks["content"];
      print("pinned>> $pinned");
      return pinnedTasks;
    } else {
      return {};
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getTasks(assigneeId: User.assigneeId);
    });
    Future.delayed(const Duration(seconds: 5));

    super.initState();
  }

  bool reload = false;

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.01;

    getTasks(assigneeId: User.assigneeId);
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                  color: Colors.grey, child: const Center(child: Text("TN"))),
            ),
          ),
          title: Text(
            "${User.firstName} ${User.lastName}",
            style: materialTextTheme().bodySmall,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(Dimens.padding.defaultHorizontal,
                scaffoldTopPadding, Dimens.padding.defaultHorizontal, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      const Todo(
                        icon: Icon(
                          Icons.sunny,
                          color: Colors.amber,
                        ),
                        title: "Todo",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const Todo(
                        icon: Icon(
                          Icons.priority_high_rounded,
                          color: Colors.red,
                        ),
                        title: "In Progress",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const Todo(
                        icon: Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                        title: "Done",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pinned Tasks",
                            style: materialTextTheme().titleMedium,
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                getTasks(assigneeId: User.assigneeId);
                                reload = true;
                              });
                            }),
                            child: const Text(
                              "reload",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height: 500,
                          child: (pinned["totalElements"] != null)
                              ? ListView.builder(
                                  itemCount: pinned["totalElements"],
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print(
                                        "totalElements: ${pinned["totalElements"]}");

                                    return Card(
                                      elevation: 3,
                                      child: ListTile(
                                        leading: GestureDetector(
                                          onTap: (() async {
                                            String response =
                                                await NetworkingService
                                                    .updateStatus(
                                              taskId: pinned["content"][index]
                                                  ["id"],
                                              status: pinned["content"][index]
                                                  ["status"],
                                              description: pinned["content"]
                                                  [index]["description"],
                                              assigneeId: pinned["content"]
                                                  [index]["assigneeId"],
                                              pinned: pinned["content"][index]
                                                  ["pinned"],
                                            );

                                            if (response == 'success') {
                                              setState(() {
                                                getTasks(
                                                    assigneeId:
                                                        User.assigneeId);
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'your task was updated successfully'),
                                              ));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Something went wrong, please try again'),
                                              ));
                                            }
                                          }),
                                          child: Icon(Icons.circle,
                                              color: (pinned["content"][index]
                                                          ["status"] ==
                                                      'TO_DO')
                                                  ? Colors.white
                                                  : Colors.amber),
                                        ),
                                        title: Text(
                                          pinned["content"][index]
                                              ["description"],
                                          style: materialTextTheme().bodyMedium,
                                        ),
                                        // ignore: prefer_interpolation_to_compose_strings
                                        subtitle: Text(
                                          "STATUS: ${pinned["content"][index]["status"]}",
                                          style: materialTextTheme().bodySmall,
                                        ),
                                        trailing: GestureDetector(
                                            onTap: (() async {
                                              var response =
                                                  await NetworkingService
                                                      .unPinTask(
                                                          pinned["content"]
                                                              [index]["id"]);

                                              print("test response $response");
                                              if (response == 'success') {
                                                // ignore: use_build_context_synchronously

                                                setState(() {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        'your task was unpinned successfully'),
                                                  ));
                                                  getTasks(
                                                      assigneeId:
                                                          User.assigneeId);
                                                  reload = !reload;
                                                });
                                              } else {
                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'A problem occurred while unpinning your task'),
                                                ));
                                              }
                                            }),
                                            child: const Icon(Icons.push_pin)),
                                      ),
                                    );
                                  })
                              : Container(
                                  height: 5,
                                  width: 4,
                                  child: const Text(
                                      "Your connection seems to be slow, please reload ...")))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
