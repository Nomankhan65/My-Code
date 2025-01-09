import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/loginresponse.dart';

class MockApiService {
  static Future<Map<String, dynamic>> loadMockData() async {
    final String response = await rootBundle.loadString('assets/login.json');
    return json.decode(response);
  }

  static Future<LoginResponse> login(String phoneNumber, bool agreeTerms) async {
    final mockData = await loadMockData();

    if (phoneNumber.isNotEmpty && agreeTerms) {
      return LoginResponse.fromJson(mockData['login']['success']);
    } else {
      return LoginResponse.fromJson(mockData['login']['error']);
    }
  }

  static Future<LoginResponse> verifyOtp(String phoneNumber, String otp) async {
    final mockData = await loadMockData();

    if (otp == "1234") {
      return LoginResponse.fromJson(mockData['verifyOtp']['success']);
    } else {
      return LoginResponse.fromJson(mockData['verifyOtp']['error']);
    }
  }

  static Future<LoginResponse> resendOtp(String phoneNumber) async {
    final mockData = await loadMockData();

    if (phoneNumber.isNotEmpty) {
      return LoginResponse.fromJson(mockData['resendOtp']['success']);
    } else {
      return LoginResponse.fromJson(mockData['resendOtp']['error']);
    }
  }
}
