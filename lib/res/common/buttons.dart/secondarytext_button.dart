import 'package:flutter/material.dart';

/// Material-styled text button.
class SecondaryTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? contentColor;
  final double? width;
  const SecondaryTextButton(this.text,
      {Key? key,
      this.width,
      this.onPressed,
      this.backgroundColor,
      this.contentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
            minimumSize:
                Size.fromWidth(width ?? MediaQuery.of(context).size.width),
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.onPrimary),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: contentColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
