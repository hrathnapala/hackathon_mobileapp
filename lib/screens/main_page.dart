import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/Dashboard.dart';
import 'package:hackathon_app/screens/DevicesList.dart';
import 'package:hackathon_app/screens/Profile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF200887), Colors.black]),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              key: _bottomNavigationKey,
              fixedColor: Colors.blue,
              iconSize: 35,
              currentIndex: _page,
              onTap: (index) {
                setState(() {
                  _page = index;
                  switch (_page) {
                    case 0:
                      currentScreen = Dashboard();
                      break;
                    case 1:
                      currentScreen = DevicesList();
                      break;
                    case 2:
                      currentScreen = Profile();
                      break;
                  }
                });
              },

              //0xFF200887
              selectedIconTheme: IconThemeData(color: Colors.blue),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    label: "Dashboard", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "List", icon: Icon(Icons.people)),
                BottomNavigationBarItem(
                    label: "Profile", icon: Icon(Icons.history)),
              ]),
        ),
      ),
      body: currentScreen,
    );
  }
}

Widget currentScreen = Dashboard();
