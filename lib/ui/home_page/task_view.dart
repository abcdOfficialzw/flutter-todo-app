import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/ui/theme/type.dart';

class TaskView extends StatelessWidget {
  final String title;
  final String taskStatus;
  const TaskView({
    super.key,
    required this.title,
    required this.taskStatus,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.01;

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (() {
                Navigator.of(context).pop();
              }),
              child: const Icon(Icons.arrow_back_ios)),
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
                        "TASKS IN $title",
                        style: materialTextTheme().headlineMedium,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Container()),
                ],
              )),
        ));
  }
}
