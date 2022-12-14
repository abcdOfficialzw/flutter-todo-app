class Strings {
  static Auth auth = const Auth();

  /// Contains all the common button labels, such as:
  /// - Ok
  /// - Cancel
  /// - Retry
  /// - and many more!
  static const CommonButtonLabels buttonLabels = CommonButtonLabels();

  /// Contains all the strings attached to the scan prescription pages:
  /// - Scan Prescription page
  /// - Prescription Upload page
  /// - Prescription Upload Success page
  /// - Prescription Upload Error page
  static const ScanPrescriptionFlow scanPrescriptionPage =
      ScanPrescriptionFlow();

  static const Home home = Home();

  static const cart = Cart();

  static const payment = Payment();

  static const preferences = Preferences();

  static const order = Order();

  // Bottom-navigation bar labels
  static const homePageBottomNavigationBarLabel = 'Home';
  static const cartPageBottomNavigationBarLabel = 'Cart';
  static const profilePageBottomNavigationBarLabel = 'Preferences';
  static const receiptsPageBottomNavigationBarLabel = 'Receipts';
  static const scanPageBottomNavigationBarLabel = 'Scan';

  // Error labels
  static const generalErrorTitle = 'Oops, something went wrong!';
  static const generalSuccessTitle = 'Successfull';
}

// Strings for all authentication screens.
class Auth {
  const Auth();

  // Landing screen.
  final landingWelcomeMessage1 = 'Welcome to the ';
  final landingWelcomeMessage2 = 'Todo App.\n\n';
  final landingWelcomeMessage3 =
      'Our App allows you to track tasks assigned to you and improve your work flow!';

  // Sign-in page.
  final signInMessage1 = 'Hello! 👋\n';
  final signInMessage2 = 'Let\'s get you signed in first.';
  final signInButtonLabel = 'Sign in';
  final signInAsGuestLabel = 'Sign in as guest';
  final signInSuccessMessage = 'Sign-in successful!';
  final signInErrorMessage = 'Sign-in failed, an error has occurred.';
  final signInAttemptMessage = 'Signing you in...';

  // Auth labels.
  final usernameLabel = 'Your username';
  final emailLabel = 'Your email address';
  final passwordLabel = 'Your password';
  final firstNameLabel = 'First name';
  final surnameLabel = 'Surname';
  final confirmPasswordLabel = 'Confirm password';
  final goToSignUpLabel1 = 'Don\'t have an account? ';
  final goToSignUpLabel2 = 'Create an account';

  // Auth error labels
  final passwordEmptyError = 'Please provide a password';
  final phoneNumberEmptyError = 'Please provide your phone number';
  final firstNameEmptyError = 'Please provide your first name';
  final surnameEmptyError = 'Please provide your surname';
  final confirmPasswordEmptyError = 'Please confirm your password';
  final passwordMismatchError = 'Passwords do not match';
  final passwordTooShortError = 'Password must be at least 6 characters';
  final phoneNumberInvalidError = 'Please provide a valid phone number';
  final phoneNumberTooLongError =
      'Phone number must not have more than 9 digits';
  final emailEmptyError = 'Please provide your email address';
  final emailInvalidError = 'Please provide a valid email address';

  // Sign-up page.
  final signUpMessage1 = 'Quality service awaits!';
  final signUpMessage2 = 'Let\'s create your account first.';
  final signUpButtonLabel = 'Create my account';
  final goToSignInLabel1 = 'Already have an account? ';
  final gotoSignInLabel2 = 'Sign into your account.';
  final forgotPasswordLabel = 'Forgot password?';
  final signUpSuccessMessage = 'Created your account successfully!';
  final signUpErrorMessage = 'Failed to create your account, an error '
      'has occurred.';
  final agreeToTermsLabel1 = 'I agree to the ';
  final agreeToTermsLabel2 = 'Terms and Conditions';

  // Forgot password page.
  final forgotPasswordMessage1 = 'Let\'s try to reset your password';
  final forgotPasswordMessage2 =
      'First let\'s get your phone number and send an SMS code';
  final forgotPasswordSendCodeButtonLabel = 'Send code';
  final forgotPasswordContinueButtonLabel = 'Continue';
  final forgotPasswordResetPasswordButtonLabel = 'Reset password';
  final forgotPasswordCodeMessage =
      'Enter the 4-digit code sent to your phone number';
  final forgotPasswordResetMessage = 'Reset your password';
  final digitCodeLabel = '4-digit code';
  final newPasswordLabel = 'New password';
  final confirmNewPasswordLabel = 'Confirm new password';
  final passwordResetSuccessTitle = 'Your password was reset successfully';
  final passwordResetSuccessSubtitle = 'Proceed to attempt to sign in again';
  final passwordResetFailureSubtitle =
      'An error seems to have occurred whilst trying to reset your password,'
      ' please retry.';

  // Terms and conditions page.
  final termsAndConditionsTitle = 'Our Terms and Conditions';
  // Generate terms and conditions from a markdown file styled as HTML text
  final termsAndConditions = ''
      '<h1>Our Terms and Conditions</h1>'
      '<p>Last updated: 2020-10-01</p>'
      '<p>Please read these Terms and Conditions ("Terms", "Terms and Conditions") carefully before using the Diamond Pharmacy App mobile application (the "Service") operated by Diamond Pharmacy ("us", "we", or "our").</p>'
      '<p>Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.</p>'
      '<p>By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.</p>'
      '<h2>Accounts</h2>'
      '<p>When you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.</p>'
      '<p>You are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.</p>'
      '<p>You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>'
      '<h2>Links To Other Web Sites</h2>'
      '<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by Diamond Pharmacy.</p>'
      '<p>Diamond Pharmacy has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Diamond Pharmacy shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>'
      '<p>We strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.</p>'
      '<h2>Termination</h2>'
      '<p>We may terminate or suspend access to our Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>'
      '<p>All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>'
      '<p>We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>'
      '<p>Upon termination, your right to use the Service will immediately cease. If you wish to terminate your account, you may simply discontinue using the Service.</p>'
      '<p>All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>'
      '<h2>Governing Law</h2>'
      '<p>These Terms shall be governed and construed in accordance with the laws of the Republic of Zimbabwe, without regard to its conflict of law provisions.</p>'
      '<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.</p>'
      '<h2>Changes</h2>'
      '<p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.</p>'
      '<p>By continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.</p>'
      '<h2>Contact Us</h2>'
      '<p>If you have any questions about these Terms, please contact us.</p>';
}

class CommonButtonLabels {
  const CommonButtonLabels();

  // Global button Fixlabels
  final cancel = 'Cancel';
  final ok = 'OK';
  final retry = 'Retry';
  final upload = 'Upload';
  final done = 'Done';
}

class ScanPrescriptionFlow {
  const ScanPrescriptionFlow();
  // Scan prescription page
  final String scanPrescriptionAppBarTitle =
      'Place your prescription note in the '
      'frame below and take a picture';
}

class Home {
  const Home();
  final homePageMessage = 'Start shopping for your medicine';
  final currencyChipGroupLabel = 'Prices in:';
  final usdCurrencyPillLabel = 'USD';
  final zwlCurrencyPillLabel = 'ZWL';

  final searchBarLabel = 'Search';
  final searchBaHint = 'Search by name, manufacturer...';
  final categoriesTitle = 'Categories';

  // Product description
  final productDescriptionLabel = 'Description';
  final productUsageLabel = 'Usage';
  final addToCartButtonLabel = 'Add to cart';
}

class Cart {
  const Cart();
  final appBarTitle = 'Cart';
  final checkoutButtonLabel = 'Checkout';
  final totalLabel = 'Total';
  final orderSummaryLabel = 'Order summary';
  final subtotalLabel = 'Subtotal';
  final deliveryFeeLabel = 'Delivery';
}

class Payment {
  const Payment();
  final paymentList = const [
    'Credit/Debit Card',
    'Ecocash FCA',
    'ZIPIT',
    'Medical Aid'
  ];
  final appBarTitle = 'Payment';
  final paymentMethodLabel = 'Please select your desired payment method';
  final cardHolderNameLabel = 'Name on card';
  final cardNumberLabel = 'Card number';
  final cardExpiryLabel = 'Expiry date';
  final cardCvvLabel = 'CVV';
  final payNowButtonLabel = 'Pay now';
  final payLaterButtonLabel = 'Pay later';
  final processingOrderTitle = 'We\'re processing your order now';
  final processingOrderSubtitle =
      'This will take just a few moments to make sure that your order comes through';
  final orderSuccessTitle = 'Your order was processed successfully';
  final orderSuccessSubtitle = 'How would you like to receive your order?';
  final deliverButtonLabel = 'Deliver to me';
  final collectButtonLabel = 'I\'ll come and pick it up myself';
  final orderFailureTitle = 'Oops, something went wrong!';
  final orderFailureSubtitle =
      'An error occurred whilst processing your order, please try again';

  // Errors
  final cardHolderNameEmptyError = 'Please provide your name on card';
  final cardNumberEmptyError = 'Please provide your card number';
  final cardExpiryEmptyError = 'Please provide your card expiry date';
  final cardCvvEmptyError = 'Please provide your card CVV';
  final cardNumberInvalidError = 'Please provide a valid card number';
}

class Order {
  const Order();
  final pickupOrderTitle = 'You can come and pick up your order at';
  final storeTitle = 'Diamond Pharmacy';
  final orderNumberTitle = 'And your order number is';
  final proceedButtonTitle = 'Proceed';
  final mapsButtonTitle = 'Open in Maps';
  final deliveryTitle = 'Your delivery\'s progress';
  final goToHomeButtonLabel = 'Go to home';
}

class Preferences {
  const Preferences();

  final preferencesTitle = 'Preferences';

  // Top page Labels
  final editDetailsButtonLabel = 'Edit details';
  final darkModeLabel = 'Dark mode';
  final accountLabel = 'Account';
  final deliveryAddressLabel = 'Delivery address';
  final contactSupportLabel = 'Contact support';
  final faqLabel = 'FAQ';
  final settingsLabel = 'Settings';
  final signOutLabel = 'Sign out';

  final changePasswordLabel = 'Change password';
  final oldPasswordLabel = 'Old password';
  final newPasswordLabel = 'New password';
  final confirmPasswordLabel = 'Confirm new password';
}
