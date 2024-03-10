import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/screens/my_blog.dart';

class UserDataScreen extends StatelessWidget {
  final File? imageFile;

  const UserDataScreen({Key? key, this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyBlog',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageFile != null
                ? Image.file(imageFile!)
                : Text('No image selected'),
            SizedBox(height: 20.0),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                var userData = snapshot.data!.docs.last;
                return ListTile(
                  title: Text(
                      // userData['firstName'] + ' ' +
                      userData['description']),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'User Input Example',
    home: UserInputScreen(),
  ));
}
