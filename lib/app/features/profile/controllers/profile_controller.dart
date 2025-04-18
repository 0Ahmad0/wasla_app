import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/validator/validator_helper.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Validation Methods
  String? validateUsername(String? value) {
    return FieldValidator([
      RequiredValidator(),
      UsernameValidator(),
    ]).validate(value ?? '');
  }

  String? validateFullName(String? value) {
    return FieldValidator([
      RequiredValidator(),
    ]).validate(value ?? '');
  }

  String? validateEmail(String? value) {
    return FieldValidator([
      RequiredValidator(),
      EmailValidator(),
    ]).validate(value ?? '');
  }

  String? validatePhone(String? value) {
    return FieldValidator([
      RequiredValidator(),
      PhoneNumberValidator(),
    ]).validate(value ?? '');
  }

  void editProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      print('تسجيل المستخدم: ${usernameController.text}');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

}