import 'package:flutter/material.dart';

class FormValidate {
  static String? validateEmail(String? email) {
    if (email?.isEmpty ?? true) {
      return 'E-mail required';
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
      return 'Phone number required';
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

  static String? validatePassword(String? password) 
  {
    if (password?.isEmpty ?? true) {
      return 'Password required';
    }
    if (password!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    if (!hasLetter) {
      return 'Password must contain at least one letter';
    }

    final hasDigit = RegExp(r'\d').hasMatch(password);
    if (!hasDigit) {
      return 'Password must contain at least one number';
    }

    // final hasSpecialCharacter = RegExp(r'[@$!%*?&]').hasMatch(password);
    // if (!hasSpecialCharacter) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }
}
