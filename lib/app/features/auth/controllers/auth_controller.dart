import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/validator/validator_helper.dart';

class AuthController extends GetxController {
  RxBool acceptTermsAndConditions = false.obs;

  // Form Keys
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  final forgetFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  // Controllers
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  void toggleAcceptTerms(bool value) {
    acceptTermsAndConditions.value = value;
  }

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

  String? validatePassword(String? value) {
    return FieldValidator([
      RequiredValidator(),
      PasswordValidator(),
    ]).validate(value ?? '');
  }

  String? validateConfirmPassword(String? value) {
    return FieldValidator([
      RequiredValidator(),
      ConfirmPasswordValidator(
        password: passwordController.text,
      ),
    ]).validate(value ?? '');
  }

  String? validateOtp(String? value) {
    return FieldValidator([
      RequiredValidator(),
      LengthValidator(min: 5, max: 5,errorMessage: "يجب أن يكون طول الكود 5 ارقام"),

    ]).validate(value ?? '');
  }

  // Signup Method
  void signup() {
    if (signupFormKey.currentState?.validate() ?? false) {
      print('تسجيل المستخدم: ${usernameController.text}');
      Get.toNamed(AppRoutes.otp);
    }
  }
  void checkOtp(){
    if(otpFormKey.currentState?.validate() ?? false){
      Get.toNamed(AppRoutes.resetPassword);
    }
  }
  void login() {
    if (loginFormKey.currentState?.validate() ?? false) {
      print('تسجيل الدخول بالبريد: ${emailController.text}');
      print('كلمة المرور: ${passwordController.text}');
      Get.toNamed(AppRoutes.navbar);
    }
  }

  Future<void> forgetPassword() async {
    if (forgetFormKey.currentState?.validate() ?? false) {
      Get.snackbar(
        "تم الإرسال",
        "تم إرسال رابط إعادة تعيين كلمة السر إلى بريدك الإلكتروني",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print('نسيان كلمة المرور: ${emailController.text}');
      Get.toNamed(AppRoutes.otp);
    }
  }

  void resetPassword() {
    if (resetFormKey.currentState?.validate() ?? false) {
      Get.snackbar(
        "تم بنجاح",
        "تمت إعادة تعيين كلمة المرور بنجاح",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.toNamed(AppRoutes.login);
    }
  }

  @override
  void onClose() {
    // usernameController.dispose();
    // fullNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    // otpController.dispose();
    super.onClose();
  }
}
