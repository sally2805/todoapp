import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          Text('shehab elsherif'), // the username
          SizedBox(
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('15'),
              Text('15'),
              Text('15'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('total tasks'),
              Text('tasks done '),
              Text('tasks left'),
            ],
          ),
          Align(alignment: Alignment.centerLeft, child: Text('account')),
          GestureDetector(
            onTap: () {
              /* 
              navigate to a screen to change username 
               */
            },
            child: ListTile(
              title: Text('change account name'),
              leading: Icon(Icons.people),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              /* 
              navigate to a screen to change password 
               */
            },
            child: ListTile(
              title: Text('change password'),
              leading: Icon(Icons.key),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          GestureDetector(
            onTap: () {
              /* 
              to log out 
               */
            },
            child: ListTile(
              title: Text('logout'),
              leading: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
