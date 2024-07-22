import 'package:evacuaid/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:evacuaid/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: EvacTheme.lightTheme,
      darkTheme: EvacTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      home: SplashScreen(),
    );
  }
}

class AppHome extends StatelessWidget{
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EvacuAid")),
      body: const Center(child: Text("Home Page")),
    );
  }
}