import 'package:flutter/material.dart';
import 'package:product/widgets/mybutton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/blog.jpg',
              height: 200,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Welcome to the world of blogs",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 40),
            MyButton(
                color: Colors.blue,
                title: 'SignIn',
                onpressed: () {
                  Navigator.pushNamed(context, '/signin');
                }),
            SizedBox(height: 20),
            MyButton(
                color: Colors.black,
                title: 'SignUp',
                onpressed: () {
                  Navigator.pushNamed(context, '/signup');
                })
          ],
        ),
      ),
    );
  }
}
