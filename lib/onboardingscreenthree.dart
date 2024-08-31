import 'package:flutter/material.dart';
import 'package:todoapp/signup.dart';

class screen3 extends StatefulWidget {
  const screen3({super.key});

  @override
  State<screen3> createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
         
          children:[ 
            SizedBox(height: 60),
            Text('ready to get starting?',
             style: TextStyle(fontSize: 30,
             fontWeight: FontWeight.bold,
             color: Colors.black),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset('assets/image/undraw_Powerful_re_frhr.png',height: 200,width: 200,
          fit: BoxFit.cover,
          ),
          
           SizedBox(height: 20),
          Text('ready to put your tasks', style: TextStyle(fontSize: 10,color: Colors.black,),
          textAlign: TextAlign.left,
          ),
          SizedBox(height: 400),
          Center(
            child:ElevatedButton(child: Text('contaious'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()), 
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
  
