import "package:evacuaid/src/constants/colors.dart";
import "package:evacuaid/src/constants/sizes.dart";
import "package:evacuaid/src/constants/text_strings.dart";
import "package:flutter/material.dart";

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: EvacFormHeight - 10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(EvacFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(EvacEmail),
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(EvacPhoneNumber),
                prefixIcon: Icon(Icons.phone_rounded),
              ),
              style: const TextStyle(color: EvacSecondaryColor),
            ),
            const SizedBox(height: EvacFormHeight - 20),
            TextFormField(
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
                  onPressed: () {}, child: Text(EvacSignup.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}