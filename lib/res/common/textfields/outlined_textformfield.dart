import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  /// What to do the user presses the [textInputAction] key on the keyboard.
  final Function(String?)? onFieldSubmitted;

  const OutlinedTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    required this.labelText,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge,
      obscureText: isPassword,
      validator: validator,
      inputFormatters: [
        inputFormatter ??
            TextInputFormatter.withFunction((oldValue, newValue) => newValue)
      ],
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (textInputAction == TextInputAction.done) {
          FocusScope.of(context).unfocus();
        } else if (textInputAction == TextInputAction.next) {
          FocusScope.of(context).nextFocus();
        }

        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelStyle: Theme.of(context).textTheme.labelLarge,
          labelText: labelText),
    );
  }
}
