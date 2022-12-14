import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final Icon icon;
  final String title;
  final Icon trailing;
  const Todo({
    Key? key,
    required this.icon,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: trailing,
    );
  }
}
