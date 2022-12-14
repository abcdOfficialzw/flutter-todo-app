import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/res/common/buttons.dart/secondarytext_button.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/res/values/strings.dart';
import 'package:todo/ui/authentication/signin_form.dart';
import 'package:todo/ui/authentication/signup_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(Dimens.padding.defaultHorizontal,
                scaffoldTopPadding, Dimens.padding.defaultHorizontal, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sign in message text
                Text.rich(
                  TextSpan(
                      text: Strings.auth.signInMessage1,
                      style: signInMessageStyle?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                      children: [
                        TextSpan(
                          text: Strings.auth.signInMessage2,
                          style: signInMessageStyle?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                      ]),
                ),

                SizedBox(
                  height: Dimens.spacing.extremeSpacing,
                ),

                const SignInForm(),

                SizedBox(
                  height: Dimens.spacing.normal,
                ),

                // Sign-in as guest button.
                // SecondaryTextButton(
                //   Strings.auth.signInAsGuestLabel,
                //   onPressed: () {
                //     //TODO: Navigate as guest;
                //   },
                // ),

                SizedBox(
                  height: Dimens.spacing.extremeSpacing,
                ),

                // Sign up link
                Text.rich(
                  TextSpan(
                      text: Strings.auth.goToSignUpLabel1,
                      style: signInLinkMessageStyle?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                      children: [
                        TextSpan(
                          text: Strings.auth.goToSignUpLabel2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("tapped");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                            },
                          style: signInLinkMessageStyle?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
