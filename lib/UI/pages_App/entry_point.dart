import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui.dart';
import 'home.dart';
import 'notification.dart';
import 'profile.dart';
import 'settings.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTodoDialog();
            },
          );

        setState(() {
          log('button pressed');
        });
      },child: Text('$index'),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomIconList,
        activeIndex: index,
        backgroundColor:Colors.blue ,
        gapLocation: GapLocation.center,
        height: 100,
        activeColor: Colors.white,
        inactiveColor: Colors.black,
        splashColor: Colors.blueAccent,
        notchSmoothness: NotchSmoothness.smoothEdge,
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
