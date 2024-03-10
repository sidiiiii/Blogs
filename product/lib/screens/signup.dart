import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product/screens/blogs.dart';
import 'package:product/widgets/my_text_field.dart';
import 'package:product/widgets/mybutton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  signUp(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Blogs()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Mot de passe faible, rendez-le plus fort'),
      ));
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showSpiner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: 20),
                  My2TextField(
                      textEditingController: email, labelText: 'Email'),
                  SizedBox(height: 20),
                  My2TextField(
                      textEditingController: password, labelText: 'Password'),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  MyButton(
                      color: Colors.black,
                      title: 'SignUp',
                      onpressed: () {
                        setState(() {
                          showSpiner = true;
                        });
                        signUp(email.text, password.text, context);
                        setState(() {
                          showSpiner = false;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
