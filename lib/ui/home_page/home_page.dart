import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/ui/home_page/widgets/todo_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.1;
    final signInMessageStyle = Theme.of(context).textTheme.headlineMedium;
    final signInLinkMessageStyle = Theme.of(context).textTheme.labelLarge;

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
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    children: const [
                      Todo(
                        icon: Icon(
                          Icons.sunny,
                          color: Colors.amber,
                        ),
                        title: "Todo",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Todo(
                        icon: Icon(
                          Icons.priority_high_rounded,
                          color: Colors.red,
                        ),
                        title: "In Progress",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Todo(
                        icon: Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                        title: "Done",
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      //Sized
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
