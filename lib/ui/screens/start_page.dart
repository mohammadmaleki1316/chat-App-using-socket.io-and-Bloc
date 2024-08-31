import 'package:chatwithsocketio/ui/screens/LogIn_Screen.dart';
import 'package:chatwithsocketio/ui/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/1111.png',color: Colors.blueGrey,
                fit:BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
              child: const Text('LogIn',style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen(),));
              },
              child: const Text('SignIn',style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
