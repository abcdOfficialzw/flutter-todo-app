import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/services/networking_service.dart';
import 'package:todo/ui/theme/type.dart';

class TaskView extends StatefulWidget {
  final String title;
  final String taskStatus;
  const TaskView({
    super.key,
    required this.title,
    required this.taskStatus,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  Map<String, dynamic> tasksByStatus = {};
  getTasks() async {
    Map<String, dynamic> tasks = await NetworkingService.getStatusTasks(
        assigneeId: User.assigneeId, status: widget.taskStatus);

    if (tasks["status"] == 200) {
      print("Tasks:== $tasks");
      print("content> ${tasks["content"]["content"]}");
      tasksByStatus = tasks["content"];
      print("STATUS TASKS>>> $tasks");

      return tasks;
    } else {
      return {};
    }
  }

  @override
  void initState() {
    setState(() {
      getTasks();
    });
    super.initState();
  }

  bool reload = false;

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.01;
    void rebuildAllChildren(BuildContext context) {
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }

      (context as Element).visitChildren(rebuild);
    }

    print(reload);
    if (reload) {
      rebuildAllChildren(context);
    }
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (() {
                Navigator.of(context).pop();
              }),
              child: const Icon(Icons.arrow_back_ios)),
          actions: [
            GestureDetector(
                onTap: (() {
                  setState(() {
                    getTasks();
                    reload = true;
                  });
                }),
                child: const Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.refresh),
                ))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(Dimens.padding.defaultHorizontal,
                  scaffoldTopPadding, Dimens.padding.defaultHorizontal, 0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "TASKS IN ${widget.title}",
                        style: materialTextTheme().headlineMedium,
                      ),
                    ),
                  ),
                  (tasksByStatus["totalElements"] == null)
                      ? Container(
                          child: const Text("Please refresh the page"),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.builder(
                              itemCount: tasksByStatus["totalElements"],
                              itemBuilder: ((BuildContext context, int index) {
                                return Card(
                                  elevation: 3,
                                  child: ListTile(
                                    leading: GestureDetector(
                                      onTap: (() async {
                                        String response =
                                            await NetworkingService
                                                .updateStatus(
                                          taskId: tasksByStatus["content"]
                                              [index]["id"],
                                          status: tasksByStatus["content"]
                                              [index]["status"],
                                          description: tasksByStatus["content"]
                                              [index]["description"],
                                          assigneeId: tasksByStatus["content"]
                                              [index]["assigneeId"],
                                          pinned: tasksByStatus["content"]
                                              [index]["pinned"],
                                        );

                                        if (response == 'success') {
                                          setState(() {
                                            getTasks();
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
                                          color: (tasksByStatus["content"]
                                                      [index]["status"] ==
                                                  'TO_DO')
                                              ? Colors.white
                                              : (tasksByStatus["content"][index]
                                                          ["status"] ==
                                                      'DONE'
                                                  ? Colors.green
                                                  : Colors.amber)),
                                    ),
                                    title: Text(
                                      tasksByStatus["content"][index]
                                          ["description"],
                                      style: materialTextTheme().bodyMedium,
                                    ),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    subtitle: Text(
                                      "STATUS: ${tasksByStatus["content"][index]["status"]}",
                                      style: materialTextTheme().bodySmall,
                                    ),
                                    trailing: GestureDetector(
                                        onTap: (() async {
                                          var response =
                                              await NetworkingService.pinTask(
                                                  tasksByStatus["content"]
                                                      [index]["id"]);

                                          print("test response $response");
                                          if (response == 'success') {
                                            // ignore: use_build_context_synchronously

                                            setState(() {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'your task was pinned successfully'),
                                              ));
                                              getTasks();
                                              reload = !reload;
                                            });
                                          } else {
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'A problem occurred while unpinning your task'),
                                            ));
                                          }
                                        }),
                                        child: const Icon(Icons.push_pin)),
                                  ),
                                );
                              }))),
                ],
              )),
        ));
  }
}
