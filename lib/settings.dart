import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        centerTitle: true,
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
          // divider to make this widget ----------------------------
          Divider(
            thickness: 2,
            endIndent: 50,
            indent: 50,
            color: Colors.black,
          ),

          ListTile(
            title: Text('appearence'),
            leading: Icon(Icons.design_services),
            trailing: Switch(
                value: isSwitched,
                onChanged: (val) {
                  setState(() {
                    isSwitched = val;
                  });
                }),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('notification'),
            leading: Icon(Icons.notifications),
            trailing: Switch(
                value: isSwitched,
                onChanged: (val) {
                  setState(() {
                    isSwitched = val;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
