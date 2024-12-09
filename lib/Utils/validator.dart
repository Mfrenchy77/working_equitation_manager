import 'package:flutter/material.dart';

class Validator {
  /// Validates and formats a phone number.
  ///
  /// Ensures the number contains exactly 10 digits (excluding symbols or spaces).
  /// Removes any extra symbols like `-`, `(`, `)` or spaces.
  /// Returns the formatted phone number if valid, or null if invalid.
  static String? validatePhoneNumber(String input) {
    debugPrint('Input: $input');

    // Remove all non-digit characters
    String digitsOnly = input.replaceAll(RegExp(r'\D'), '');
    debugPrint('Digits only: $digitsOnly');

    // Check if the resulting string has exactly 10 digits
    if (digitsOnly.length == 10) {
      //add a parenthesis around the area code and a dash between the next 3 digits
      return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
    }

    // Return null if the phone number is invalid
    return null;
  }

  /// Validates an email address.
  ///
  /// Returns true if the email is in a valid format, false otherwise.
  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  /// Validates a numeric string.
  ///
  /// Ensures the string is a valid number and optionally checks if it falls
  /// within a specified range.
  static bool validateNumeric(String input, {int? min, int? max}) {
    final int? number = int.tryParse(input);

    if (number == null) return false;

    if (min != null && number < min) return false;

    if (max != null && number > max) return false;

    return true;
  }

  /// Validates a non-empty string.
  ///
  /// Returns true if the string is not empty or null.
  static bool validateNonEmpty(String? input) {
    return input != null && input.trim().isNotEmpty;
  }

  /// Trims and removes multiple spaces from a string.
  ///
  /// Returns the cleaned-up string.
  static String cleanString(String input) {
    return input.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
