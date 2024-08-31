import 'package:flutter/material.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: Icon(Icons.home),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.notifications),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.settings),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: Icon(Icons.people),
            ),
          ],
        ),
      )),
    );
  }
}
