import 'package:flutter/material.dart';

class FormValidate {
  static String? validateEmail(String? email) {
    if (email?.isEmpty ?? true) {
      return 'Email required';
    }
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email id';
    }
    return null;
  }

  static String? validatePhoneNo(String? phone) {
    if (phone?.isEmpty ?? true) {
      return 'Phone no required';
    }
    RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    final isPhoneValid = phoneRegex.hasMatch(phone ?? '');
    if (!isPhoneValid) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Name required';
    }
    final namePattern =
        RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*(?:-[a-zA-Z]+)*(?:\[a-zA-Z]+)*$');
    if (!namePattern.hasMatch(name ?? '')) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Password required';
    }
    final passwordPattern = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordPattern.hasMatch(password ?? '')) {
      return 'Password must contain at least 8 characters including one letter and one number';
    }
    return null;
  }
}
