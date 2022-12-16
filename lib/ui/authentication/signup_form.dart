import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/res/common/buttons.dart/filled_button.dart';
import 'package:todo/res/common/dialogue/number_picker_sheet.dart';
import 'package:todo/res/common/textfields/checkbox_formfield.dart';
import 'package:todo/res/common/textfields/outlined_textformfield.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/res/values/strings.dart';
import 'package:todo/services/networking_service.dart';
import 'package:todo/ui/authentication/signin_page.dart';
import 'package:todo/ui/home_page/home_page.dart';

/// Contains the TextFields used to validate information entered into the sign-up form.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  /// A global key that uniquely identifies the Form widget
  /// and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  Country? _selectedCountry;

  bool _agreeToTerms = false;

  // Text controllers for user input.
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  // Focus node to move focus from one field to another.
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _firstNameFocusNode;
  late FocusNode _surnameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _initCountry();

    super.initState();

    // Initialize all focus nodes.
    _firstNameFocusNode = FocusNode();
    _surnameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  void _initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onAgreeToTerms(bool? value) {
    setState(() {
      _agreeToTerms = value ?? false;
    });
  }

  @override
  void dispose() {
    // Dispose of all the focus nodes.
    _firstNameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    // Dispose of the all textfield resources.
    _usernameTextController.dispose();
    _firstNameTextController.dispose();
    _surnameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Triggered when the form is submitted.
    // Use textfield controllers in this function.
    void onFormSubmit() async {
      if (_formKey.currentState!.validate()) {
        String username = _usernameTextController.text;
        String firstname = _firstNameTextController.text;
        String lastname = _surnameTextController.text;
        String email = _emailTextController.text;
        String password = _passwordTextController.text;
        String confirmPassword = _confirmPasswordTextController.text;

        Map<String, dynamic> response = await NetworkingService.signup(
            username, firstname, lastname, email, password);
        print("res: $response");
        print("res status : ${response["status"]}");
        if (response["status"] == 200) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    Strings.generalSuccessTitle,
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                    'Your sign up was successful, you can proceed to log in',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Close the dialog
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                      },
                      child: Text(Strings.buttonLabels.ok),
                    ),
                  ],
                );
              });
        } else {
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
                    response["response"],
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(Strings.buttonLabels.retry),
                    ),
                  ],
                );
              });
        }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // username field
          OutlinedTextFormField(
            labelText: Strings.auth.usernameLabel,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: _usernameTextController,
            validator: (value) {
              if (value == '') {
                return Strings.auth.usernameEmptyError;
              }
            },
            onFieldSubmitted: (value) {
              _emailFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // Email TextField
          OutlinedTextFormField(
            keyboardType: TextInputType.emailAddress,
            labelText: Strings.auth.emailLabel,
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
            controller: _emailTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.emailEmptyError;
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return Strings.auth.emailInvalidError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              _firstNameFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // First-name TextField
          OutlinedTextFormField(
            labelText: Strings.auth.firstNameLabel,
            textInputAction: TextInputAction.next,
            focusNode: _firstNameFocusNode,
            controller: _firstNameTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.firstNameEmptyError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              _surnameFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // Surname TextField
          OutlinedTextFormField(
            labelText: Strings.auth.surnameLabel,
            textInputAction: TextInputAction.next,
            focusNode: _surnameFocusNode,
            controller: _surnameTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.surnameEmptyError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              _passwordFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // Password TextField
          OutlinedTextFormField(
            labelText: Strings.auth.passwordLabel,
            textInputAction: TextInputAction.next,
            focusNode: _passwordFocusNode,
            controller: _passwordTextController,
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
              _confirmPasswordFocusNode.requestFocus();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          // Confirm-password TextField
          OutlinedTextFormField(
            labelText: Strings.auth.confirmPasswordLabel,
            textInputAction: TextInputAction.done,
            focusNode: _confirmPasswordFocusNode,
            controller: _confirmPasswordTextController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.auth.confirmPasswordEmptyError;
              } else if (value != _passwordTextController.text) {
                return Strings.auth.passwordMismatchError;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              onFormSubmit();
            },
          ),

          SizedBox(
            height: Dimens.spacing.medium,
          ),

          CheckboxFormField(
              title: Text.rich(
                TextSpan(
                    text: Strings.auth.agreeToTermsLabel1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    children: [
                      TextSpan(
                        text: Strings.auth.agreeToTermsLabel2,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //TODO: NAVIGATE TO TnC PAGE
                          },
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline),
                      ),
                    ]),
              ),
              onSaved: (val) {
                _agreeToTerms = val!;
              },
              validator: (value) {
                if (value == false) {
                  return 'Required.';
                }
              }),

          SizedBox(
            height: Dimens.spacing.extremeSpacing,
          ),

          // Login Button
          FilledButton(
            Strings.auth.signUpButtonLabel,
            onPressed: onFormSubmit,
          ),
        ],
      ),
    );
  }

  void _onPressedShowBottomSheet() async {
    final country = await showPickerSheet(context);
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}

/**
 * SIGN UP FAILED
 * ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );


  Sign up in progress
  ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Strings.auth.signInAttemptMessage)),
          );


  Sign up success 
  ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(Strings.auth.signInSuccessMessage),
              onVisible: () {
                // Go to home page after a 5 second delay.
                Future.delayed(const Duration(seconds: 5)).then((value) {
                  //TODO: NAVIGATE TO HOM PAGE
                });
              },
              backgroundColor:
                  (Theme.of(context).brightness == Brightness.light)
                      ? lightSuccessGreen
                      : darkSuccessGreen,
            ),
          );
 * 
 */