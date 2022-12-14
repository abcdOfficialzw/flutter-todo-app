import 'package:flutter/material.dart';

class FilledIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const FilledIconButton(this.icon, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: Size.fromWidth(MediaQuery.of(context).size.width),
            foregroundColor: Theme.of(context).colorScheme.onPrimary),
        child: Icon(icon),
      ),
    );
  }
}
