import "package:evacuaid/src/constants/sizes.dart";
import "package:evacuaid/src/constants/text_strings.dart";
import "package:evacuaid/src/features/authentication/screens/forgot_password/forgot_password_options/forgot_pass_modal_bottom_sheet.dart";
import "package:evacuaid/src/features/core/screens/dashboard/dashboard.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: EvacFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: EvacEmail,
                hintText: EvacEmail,
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: EvacFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: EvacPassword,
                hintText: EvacPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp)),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: EvacFormHeight - 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      ForgotPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(EvacForgotPassword))),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.to(() => Dashboard());
                  },
                  child: Text(EvacLogin.toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }
}