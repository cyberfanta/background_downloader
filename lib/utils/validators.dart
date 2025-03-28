import 'package:flutter/services.dart';

bool isValidEmail(String input) {
  final RegExp regex = RegExp(
    r'^[a-zA-Z0-9.a-zA-Z0-9_%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,40}$',
  );

  return regex.hasMatch(input);
}

bool isValidPassword(String input) {
  final RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[$@!%*?&_.]).{6,}$',
  );

  return regex.hasMatch(input);
}

bool isValidUSPhoneNumber(String input) {
  final RegExp regex = RegExp(
    r'^1?-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$',
  );

  return regex.hasMatch(input);
}

bool isValidVenezuelanPhoneNumber(String input) {
  final RegExp regex = RegExp(
    r'^(?:\+58|0058|0)?(41[246]|42[46])(?<number>[0-9]{7})$',
  );

  return regex.hasMatch(input);
}

bool isNumber(String input) {
  final RegExp regex = RegExp(r'^\d+$');

  return regex.hasMatch(input);
}

List<FilteringTextInputFormatter> onlyAllowLetters = [
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
];

List<FilteringTextInputFormatter> onlyAllowNumbers = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];
