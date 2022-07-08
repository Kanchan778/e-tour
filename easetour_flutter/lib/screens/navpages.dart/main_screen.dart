import 'package:easetour_flutter/screens/navpages.dart/bar_item_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/booking_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/home_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/my_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/near_me_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/scan_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/search_screen.dart';
import 'package:easetour_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    HomeScreen(),
    SearchScreen(),
    //BookingScreen(),
    ScanScreen(),
    //NearMeScreen(),
    BarItemScreen(),
    MyScreen(),
  ];

  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          // backgroundColor: logoColor.withOpacity(0.2),
          onTap: onTap,
          currentIndex: currentindex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: navColor,
          unselectedItemColor: navColor.withOpacity(0.3),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.search)),
            //BottomNavigationBarItem(label: "Booking", icon: Icon(Icons.local_taxi)),
            BottomNavigationBarItem(
                label: "Scan", icon: Icon(Icons.qr_code_scanner_rounded)),
            //BottomNavigationBarItem(label: "Location", icon: Icon(Icons.near_me)),
            BottomNavigationBarItem(label: "Apps", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
