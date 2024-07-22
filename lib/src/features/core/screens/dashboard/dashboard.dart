import "package:evacuaid/src/constants/colors.dart";
import "package:evacuaid/src/features/core/screens/dashboard/widgets/map_widget.dart";
import "package:flutter/material.dart";

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
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: MapSample()),
            Align(
              alignment: Alignment.bottomCenter,
              child: NavigationBar(
                backgroundColor: Colors.black,
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: FloatingActionButton.large(
                  onPressed: (){},
                  backgroundColor: Colors.red,
                  child: Icon(Icons.warning_amber_rounded, size:60),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )

                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
          'EvacuAid',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          )),
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){},
        child:
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.red,
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
                color: Colors.red,
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
