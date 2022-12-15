import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/services/networking_service.dart';
import 'package:todo/ui/home_page/widgets/todo_list_tile.dart';
import 'package:todo/ui/theme/type.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

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
    getTasks(assigneeId: 10);
    Future.delayed(const Duration(seconds: 5));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.01;
    Future.delayed(const Duration(seconds: 10));
    getTasks(assigneeId: 10);
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
          title: const Text("Takudzwa Nyanhanga"),
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
                      Text(
                        "Pinned Tasks",
                        style: materialTextTheme().titleMedium,
                      ),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            itemCount: pinned["totalElements"],
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              print(
                                  "totalElements: ${pinned["totalElements"]}");

                              return ListTile(
                                leading: Icon(Icons.circle),
                                title: Text(
                                    pinned["content"][index]["description"]),
                                subtitle:
                                    Text(pinned["content"][index]["status"]),
                                trailing: Icon(Icons.arrow_forward_ios),
                              );
                            }),
                      )
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
