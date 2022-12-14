import 'package:flutter/material.dart';

/// Material-styled primary button.
class FilledButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? contentColor;
  final double? width;
  const FilledButton(this.text,
      {Key? key,
      this.width,
      required this.onPressed,
      this.backgroundColor,
      this.contentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          minimumSize:
              Size.fromWidth(width ?? MediaQuery.of(context).size.width),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: contentColor ?? Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
