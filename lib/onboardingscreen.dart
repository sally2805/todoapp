import 'package:flutter/material.dart';
import 'package:todoapp/onboardingscreentwo.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
         
          children:[ 
            SizedBox(height: 60),
            Text('start organizing your task',
             style: TextStyle(fontSize: 30,
             fontWeight: FontWeight.bold,
             color: Colors.black),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset('assets/image/undraw_Calendar_re_ki49.png',height: 200,width: 200,
          fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text('Welcome to TODO', style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,),
          textAlign: TextAlign.left,
          ),
           SizedBox(height: 20),
          Text('your daily task organized,that keep you on track', style: TextStyle(fontSize: 10,color: Colors.black,),
          textAlign: TextAlign.left,
          ),
          SizedBox(height: 400),
          Center(
            child:ElevatedButton(child: Text('contaious'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2()), 
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
