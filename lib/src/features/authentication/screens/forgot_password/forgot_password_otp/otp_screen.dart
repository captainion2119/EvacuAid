import "package:evacuaid/src/constants/image_strings.dart";
import "package:evacuaid/src/constants/sizes.dart";
import "package:evacuaid/src/constants/text_strings.dart";
import "package:flutter/material.dart";
import "package:flutter_otp_text_field/flutter_otp_text_field.dart";

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(EvacDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(EvacForgotPassImage), height: 300.0),
              Text(EvacOTPTitle, style: Theme.of(context).textTheme.headlineLarge!.merge(TextStyle(color: Colors.black))),
              const SizedBox(height: 40.0),
              Text("$EvacOTPMessage support@ltnoname.com", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: Colors.black)),),
              const SizedBox(height: 20.0),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code){print("OTP is $code");},
              ),
              const SizedBox(height: 20.0),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text(EvacNext)))
            ],
          )
        ),
      ),
    );
  }
}
