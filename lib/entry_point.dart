import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/home.dart';
import 'package:todoapp/notification.dart';
import 'package:todoapp/profile.dart';
import 'package:todoapp/settings.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int index = 0;
  List<Widget> bottomScreenList = [
    Homescreen(),
    NotificationScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];
  List<IconData> bottomIconList = [
    Icons.home,
    Icons.notifications,
    Icons.settings,
    Icons.people,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        /* 
          here will be to add the task logic 
           */
        setState(() {
          log('button pressed');
        });
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomIconList,
        activeIndex: index,
        gapLocation: GapLocation.center,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        splashColor: Colors.blueAccent,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (tap) {
          setState(() {
            index = tap;
          });
        },
      ),
      body: bottomScreenList[index],
    );
  }
}
