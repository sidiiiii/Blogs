import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product/screens/blogs.dart';
import 'package:product/widgets/my_text_field.dart';
import 'package:product/widgets/mybutton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  signIn(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Blogs()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Mauvais mot de passe fourni pour cet utilisateur.'),
      ));
    }
  }

  bool showSpiner = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: ListView(
          children: [
            Padding(
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
                  My2TextField(
                      textEditingController: email, labelText: 'Email'),
                  SizedBox(height: 20),
                  My2TextField(
                      textEditingController: password, labelText: 'Password'),
                  SizedBox(height: 20),
                  MyButton(
                      color: Colors.blue,
                      title: 'SignIn',
                      onpressed: () {
                        setState(() {
                          showSpiner = true;
                        });
                        signIn(email.text, password.text, context);
                        setState(() {
                          showSpiner = false;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
