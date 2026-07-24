class AppValidators {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isValidUsername(String username) {
    return username.length >= 3 && username.length <= 20;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (!isValidPassword(password)) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }
    if (!isValidUsername(username)) {
      return 'Username must be 3-20 characters';
    }
    return null;
  }
}
