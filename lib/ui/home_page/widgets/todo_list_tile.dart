import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final Icon icon;
  final String title;
  final Icon trailing;
  final void Function()? onTap;

  const Todo({
    Key? key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}
