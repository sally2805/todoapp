import 'package:flutter/material.dart';
import 'entry_point.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen();
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final CC = GlobalKey<FormState>();
  Icon ICON_Pass = const Icon(Icons.visibility_off);
  bool isPasswordHidden = true;

  void supmit() {
    if (CC.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sucses')));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EntryPoint()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: CC,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                    Text(
                      '  Hi! Let\'s create your account',
                      style: TextStyle(
                        fontSize: 15,
                        
                      ),
                    )
                  ],
                ),
                SizedBox(height: 80),
                const Text(
                  'Email or Username',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter UserName or Email";
                    } else {
                      if (value.contains(".com") && !value.contains("@")) {
                        return "Enter Valid Email";
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  obscureText: isPasswordHidden,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: ICON_Pass,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                          ICON_Pass = isPasswordHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.remove_red_eye);
                        });
                      },
                    ),
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    } else {
                      bool isPassVaild = RegExp(r'[A-Za-z1-9]').hasMatch(value!) &&
                          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value!);
                      if (value.length <8) {
                        return "Please Enter 8 characters";
                      } else if (!isPassVaild) {
                        return "Please Enter Valid Pass";
                      }
                    }
                  },
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ● Password must have 8 characters',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        ' ● Numbers & Special characters',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(15)),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: TextButton(
                      onPressed: supmit,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
