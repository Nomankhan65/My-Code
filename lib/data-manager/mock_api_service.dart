import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'mock.dart';
import 'otp_screen.dart';

import 'package:get/get.dart';
import 'mock_api_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var otpSent = false.obs;
  var otpTimer = 120.obs;

  Future<void> login(String phoneNumber, bool agreeTerms) async {
    isLoading.value = true;

    final response = await MockApiService.login(phoneNumber, agreeTerms);
    isLoading.value = false;

    if (response.status == "success") {
      otpSent.value = true;
      Get.snackbar("Success", response.message);
      Get.to(() => OtpScreen(phoneNumber: phoneNumber));
    } else {
      Get.snackbar("Error", response.message);
    }
  }

  Future<void> verifyOtp(String phoneNumber, String otp) async {
    isLoading.value = true;

    final response = await MockApiService.verifyOtp(phoneNumber, otp);
    isLoading.value = false;

    if (response.status == "success") {
      Get.snackbar("Success", response.message);
      // Navigate to the home screen
    } else {
      Get.snackbar("Error", response.message);
    }
  }

  Future<void> resendOtp(String phoneNumber) async {
    final response = await MockApiService.resendOtp(phoneNumber);

    if (response.status == "success") {
      otpTimer.value = response.otpExpiry ?? 120;
      otpSent.value = true;
      Get.snackbar("Success", response.message);
    } else {
      Get.snackbar("Error", response.message);
    }
  }
}
