import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/res/values/strings.dart';
import 'package:todo/ui/authentication/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.075;
    final signUpMessageStyle = Theme.of(context).textTheme.headlineMedium;
    final signInLinkMessageStyle = Theme.of(context).textTheme.labelLarge;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(Dimens.padding.defaultHorizontal,
              scaffoldTopPadding, Dimens.padding.defaultHorizontal, 0),
          child: Column(
            children: [
              // Sign up message text
              Text.rich(
                TextSpan(
                    text: Strings.auth.signUpMessage1,
                    style: signUpMessageStyle?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    children: [
                      TextSpan(
                        text: Strings.auth.signUpMessage2,
                        style: signUpMessageStyle?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ]),
              ),

              SizedBox(
                height: Dimens.spacing.extremeSpacing,
              ),

              // Sign up form
              const SignUpForm(),

              SizedBox(
                height: Dimens.spacing.extremeSpacing,
              ),

              // Sign in link
              Text.rich(
                TextSpan(
                    text: Strings.auth.goToSignInLabel1,
                    style: signInLinkMessageStyle?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    children: [
                      TextSpan(
                        text: Strings.auth.gotoSignInLabel2,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                        style: signInLinkMessageStyle?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline),
                      ),
                    ]),
              ),

              SizedBox(
                height: Dimens.spacing.veryLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
