import 'package:flutter/material.dart';
import 'package:todoapp/onboardingscreenthree.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
         
          children:[ 
            SizedBox(height: 60),
            Text('customizing & organizing your task',
             style: TextStyle(fontSize: 30,
             fontWeight: FontWeight.bold,
             color: Colors.black),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset('assets/image/undraw_completed_tasks_vs6q.png',height: 200,width: 200,
          fit: BoxFit.cover,
          ),
          
           SizedBox(height: 20),
          Text('add your task and daily tasks', style: TextStyle(fontSize: 10,color: Colors.black,),
          textAlign: TextAlign.left,
          ),
          SizedBox(height: 400),
          Center(
            child:ElevatedButton(child: Text('contaious'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>screen3()), 
                );
              },
            )
          )
           ],
           ),
        ),
        
    );
  }
}

