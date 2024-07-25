import "package:evacuaid/src/features/authentication/screens/on_boarding/on_boarding_screen.dart";
import "package:evacuaid/src/features/authentication/screens/welcome/welcome_screen.dart";
import "package:evacuaid/src/features/onboardflow/screens/register/register_screen.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class CongratsSplashScreenController extends GetxController{
  static CongratsSplashScreenController get find => Get.find();

  RxBool animate = false.obs;


  Future startAnimation() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnBoarding') ?? false;

    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 3000));
    if (hasSeenOnboarding) {
      // Navigate to your main app screen
      Get.to(() => RegisterPage());
    } else {
      Get.to(() => RegisterPage());
    }
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}