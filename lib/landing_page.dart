import 'package:flutter/material.dart';
import 'package:todo/res/common/buttons.dart/filled_icon_button.dart';
import 'package:todo/res/values/dimensions.dart';
import 'package:todo/res/values/strings.dart';
import 'package:todo/ui/authentication/signin_page.dart';

/// The screen that is shown for the first time when the app is
/// opened after installation.
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size of the image should a percentage of the width and the image is a square image.
    final imageSize = MediaQuery.of(context).size.width * 0.7;

    final scaffoldTopPadding = MediaQuery.of(context).size.height * 0.1;

    final welcomeMessageStyle = Theme.of(context).textTheme.headlineSmall;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            Dimens.padding.defaultHorizontal,
            scaffoldTopPadding,
            Dimens.padding.defaultHorizontal,
            Dimens.padding.defaultVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Illustration at the top of the screen.
            Center(
              child: Image(
                image: const AssetImage('landing_illustration.png'),
                height: imageSize,
                width: imageSize,
              ),
            ),

            SizedBox(
              height: Dimens.spacing.large,
            ),

            // Welcome text
            Text.rich(
              TextSpan(
                  text: Strings.auth.landingWelcomeMessage1,
                  style: welcomeMessageStyle?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  children: [
                    TextSpan(
                      text: Strings.auth.landingWelcomeMessage2,
                      style: welcomeMessageStyle?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    TextSpan(
                        text: Strings.auth.landingWelcomeMessage3,
                        style: welcomeMessageStyle?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground))
                  ]),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: Dimens.spacing.veryLarge,
            ),

            // Continue button
            FilledIconButton(
              Icons.arrow_forward_rounded,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignInPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
