class User {
  static String token = '';
  static int assigneeId = 0;
  static String firstName = '';
  static String lastName = '';
  static String email = '';
  static String username = '';
  static List<dynamic> roles = [];

  static String getProfileLetters() {
    List firstLetter = firstName.split('');
    List secondLetter = lastName.split('');
    String profileLetters = firstLetter[0] + secondLetter[0];
    return profileLetters;
  }
}
