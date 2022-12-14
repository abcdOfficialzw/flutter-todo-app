import 'package:flutter/material.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:todo/res/common/buttons.dart/filled_button.dart';
import 'package:todo/res/common/textfields/outlined_textformfield.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/res/values/strings.dart';

/// Contains the TextFields used to validate information entered into the sign-in form.
class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  /// A global key that uniquely identifies the Form widget
  /// and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  Country? _selectedCountry;

  // Form field text controllers.
  final TextEditingController _passwordFieldTextController =
      TextEditingController();
  final TextEditingController _phoneNumberFieldTextController =
      TextEditingController();

  // Focus node to move focus from one field to another.
  late FocusNode _passwordFieldFocusNode;

  @override
  void initState() {
    initCountry();
    super.initState();
    _passwordFieldFocusNode = FocusNode();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  void dispose() {
    // Dispose of the all textfield resources.
    _passwordFieldFocusNode.dispose();
    _passwordFieldTextController.dispose();
    _phoneNumberFieldTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Triggered when the form is submitted.
    // Use textfield controllers in this function.
    void onFormSubmit() {
      if (_formKey.currentState!.validate()) {
        // Add a zero to the beginning of the phone number if it doesn't start with a zero.
        var phoneNumber = _phoneNumberFieldTextController.text;
        if (phoneNumber.characters.first != '0') {
          phoneNumber = '0$phoneNumber';
        }

        //TODO: IMPLEMENT SIGNIN LOGIC
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          OutlinedTextFormField(
            labelText: Strings.auth.usernameLabel,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            controller: _phoneNumberFieldTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.phoneNumberEmptyError;
              } else if (value.length > 9) {
                return Strings.auth.phoneNumberTooLongError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              _passwordFieldFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // Password TextField
          OutlinedTextFormField(
            labelText: Strings.auth.passwordLabel,
            textInputAction: TextInputAction.done,
            focusNode: _passwordFieldFocusNode,
            controller: _passwordFieldTextController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.passwordEmptyError;
              } else if (value.length < 4) {
                return Strings.auth.passwordTooShortError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              onFormSubmit();
            },
          ),

          SizedBox(
            height: Dimens.spacing.normal,
          ),

          // Forgot password link
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                //TODO:  Start the forgot password flow.
              },
              child: Text(
                Strings.auth.forgotPasswordLabel,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          SizedBox(
            height: Dimens.spacing.extremeSpacing,
          ),

          // Login Button
          FilledButton(
            Strings.auth.signInButtonLabel,
            onPressed: onFormSubmit,
          ),
        ],
      ),
    );
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}


/**    SIGN IN FAILED
 * 
 *               // Display dialog with error message to the user.
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        Strings.generalErrorTitle,
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();

                            // Change state back to initial so that user can enter in data
                            context.read<SignInBloc>().add(SignInAcceptError());
                          },
                          child: Text(Strings.buttonLabels.retry),
                        ),
                      ],
                    );
                  });

 */
