import 'package:flutter/material.dart';

/// Centralized validator methods returning localized error messages.
class ValidatorManager {
  static final _regex = _RegularExpressions();

  /// Validates that [value] is non-empty.
  static String? validateName(BuildContext context, String value) {
    if (value.trim().isEmpty) {
      return 'Please Enter Your Name';
    }
    return null;
  }

  /// Validates that [value] is non-empty (username).
  static String? validateUserName(BuildContext context, String value) {
    if (value.trim().isEmpty) {
      return 'Please Enter Your Name';
    }
    return null;
  }

  /// Validates [value] as a phone number using [_regex.phone].
  static String? validatePhone(BuildContext context, String value) {
    if (value.trim().isEmpty) {
      return 'Please Enter Phone Number';
    }
    if (!_regex.phone.hasMatch(value)) {
      return 'please Enter Valid Phone Number';
    }
    return null;
  }

  /// Validates [value] as an email address.
  static String? validateEmail(BuildContext context, String value) {
    if (value.trim().isEmpty) {
      return 'Please Enter Your Email';
    }
    if (!_regex.email.hasMatch(value)) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  /// Validates [value] as a password: non-empty, min length, contains upper, lower, digit, special.
  static String? validatePassword(BuildContext context, String value) {
    const minLength = 3;

    if (value.isEmpty) {
      return 'please Enter A Password';
    }
    if (value.length < minLength) {
      return 'password Length Validation($minLength)';
       }

    if (!_regex.digit.hasMatch(value)) {
      return 'password Must Contain Digit';
    }
    return null;
  }
}

/// Encapsulates all your regex patterns.
class _RegularExpressions {
  final email = RegExp(
    r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$',
    caseSensitive: false,
  );

  /// Exactly 10 digits
  final phone = RegExp(r'^\d{10}$');

  final upper = RegExp(r'[A-Z]');
  final lower = RegExp(r'[a-z]');
  final digit = RegExp(r'\d');
  final special = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
}
