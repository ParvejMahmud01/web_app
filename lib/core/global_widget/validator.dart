class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter first name';
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter last name';
    }
    return null;
  }

  /// Validator for new password field
  static String? newPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  /// Validator for confirm password field
  static String? confirmPassword(String? value, String newPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
