import "package:evacuaid/src/constants/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.transparent,
            onDestinationSelected: (int index){
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: EvacPrimaryColor,
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.storefront_outlined,color: Colors.white,), label: "Store", ),
              NavigationDestination(icon: Icon(Icons.cancel_outlined, color: Colors.white,), label: "Placeholer"),
              NavigationDestination(icon: Icon(Icons.inventory_2_outlined, color: Colors.white,), label: "Donate"),
              NavigationDestination(icon: Icon(Icons.campaign_outlined, color: Colors.white,), label: "Broadcast"),
            ],


          ),
        )
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
          'UI Test',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          )),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){},
        child:
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)
          ),
          alignment: Alignment.center,
          child: Icon(Icons.chevron_left_rounded, color: Colors.black, size: 20,),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            width: 37,
            child: Icon(Icons.person_outline_rounded, color: Colors.black, size: 20,),
          ),

        ),
      ],
    );
  }
}