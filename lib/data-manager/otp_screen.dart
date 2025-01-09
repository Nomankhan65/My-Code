import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mock_api_service.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final LoginController controller = Get.find();
  final TextEditingController otpController = TextEditingController();

  OtpScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Check your SMS and enter the OTP"),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: "Enter OTP"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () => controller.verifyOtp(
                phoneNumber,
                otpController.text,
              ),
              child: Text("Login"),
            )),
            SizedBox(height: 20),
            Obx(() => Text(
              "Didn't receive OTP? Resend in ${controller.otpTimer.value} seconds",
            )),
            TextButton(
              onPressed: () {
                if (controller.otpTimer.value <= 0) {
                  controller.resendOtp(phoneNumber);
                }
              },
              child: Text("Resend OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
