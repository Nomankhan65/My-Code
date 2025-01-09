import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mock_api_service.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController phoneController = TextEditingController();
  final RxBool agreeTerms = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone Number"),
              keyboardType: TextInputType.phone,
            ),
            Obx(() => Row(
                  children: [
                    Checkbox(
                      value: agreeTerms.value,
                      onChanged: (value) => agreeTerms.value = value!,
                    ),
                    Text("Agree with Terms and Conditions"),
                  ],
                )),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => controller.login(
                      phoneController.text,
                      agreeTerms.value,
                    ),
                    child: Text("Continue"),
                  )),
          ],
        ),
      ),
    );
  }
}
