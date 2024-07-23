import "package:evacuaid/src/constants/colors.dart";
import "package:evacuaid/src/features/authentication/screens/splash_screen/splash_screen.dart";
import "package:evacuaid/src/features/core/screens/dashboard/widgets/map_widget.dart";
import "package:evacuaid/src/features/core/screens/dashboard/widgets/radio_widget.dart";
import "package:evacuaid/src/features/core/screens/profile/profile_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentPageIndex = 0;
  final List<Widget> _screens = [
    MapSample(),
    Placeholder(),
    Placeholder(),
    RadioPlayer(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar(),
          backgroundColor: Colors.white,
          body: _screens[_currentPageIndex], // Display current screen based on index
        bottomNavigationBar: dashNavBar(), // Navigation bar for switching screens
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom:60),
          child: FloatingActionButton.large(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: Icon(Icons.warning_amber_rounded, size: 60),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  NavigationBar dashNavBar() {
    return NavigationBar(
                backgroundColor: Colors.black,
                onDestinationSelected: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                indicatorColor: EvacPrimaryColor,
                selectedIndex: _currentPageIndex,
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: "Store",
                  ),
                  NavigationDestination(
                      icon: Icon(
                        Icons.storefront_outlined,
                        color: Colors.white,
                      ),
                      label: "Placeholer"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.inventory_2_outlined,
                        color: Colors.white,
                      ),
                      label: "Donate"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.campaign_outlined,
                        color: Colors.white,
                      ),
                      label: "Broadcast"),
                ],
              );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('EvacuAid',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          )),
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(Icons.chevron_left_rounded, size:20),
            color: Colors.black,
            onPressed: () {
              SharedPreferences.getInstance().then((prefs) => prefs.setBool("hasSeenOnBoarding", false));
              Get.to(() => SplashScreen());
            },
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            width: 37,
            child: IconButton(
              icon: Icon(Icons.person_outline_rounded, size: 20,),
              color: Colors.black,
              onPressed: () {
                Get.to(()=> ProfileScreen());
              },
            ),
          ),
        ),
      ],
    );
  }
}
