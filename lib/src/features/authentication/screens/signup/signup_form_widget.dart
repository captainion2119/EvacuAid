import "package:evacuaid/src/constants/colors.dart";
import "package:evacuaid/src/constants/sizes.dart";
import "package:evacuaid/src/constants/text_strings.dart";
import "package:evacuaid/src/features/authentication/controllers/signup_controller.dart";
import "package:evacuaid/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: EvacFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(EvacFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(EvacEmail),
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                label: Text(EvacPhoneNumber),
                prefixIcon: Icon(Icons.phone_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(EvacPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      // controller.registerUser(controller.email.text.trim(),  controller.password.text.trim());
                      SignupController.instance.phoneAuthentication(controller.phoneNumber.text.trim());
                      Get.to(() => const OtpScreen());
                    }

                  }, child: Text(EvacSignup.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}