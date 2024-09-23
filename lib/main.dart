import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Bloc_todo/bloc.dart';
import 'package:todoapp/Data%20Base_todo/dbhelper.dart';
import 'package:todoapp/UI/pages_App/entry_point.dart';

import 'UI/onboardingscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DatabaseHelper db = DatabaseHelper.init();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(db),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      MyApp A = MyApp();
      
      if (A.db.queryUser() == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => Screen1()));
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => EntryPoint()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('assets/image/todologo.jpeg'),
        ),
      ),
    );
  }
}
