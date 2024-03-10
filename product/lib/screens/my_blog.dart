import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product/screens/user_data_screen.dart';
import 'package:product/widgets/my_text_field.dart';

class UserInputScreen extends StatefulWidget {
  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _imageFile;
  bool showSpiner = false;
  void _saveUserData() async {
    String description = descriptionController.text;

    // Enregistrer l'image dans Firebase Storage
    if (_imageFile != null) {
      // Upload de l'image dans Firebase Storage
      var storageReference = FirebaseFirestore.instance
          .collection('users')
          .doc()
          .collection('images')
          .doc();

      await storageReference.set({'image_url': _imageFile!.path});
    }

    // Enregistrer les données dans Cloud Firestore
    FirebaseFirestore.instance.collection('users').add({
      'description': description,
    });

    // Naviguer vers l'écran d'affichage des données
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDataScreen(imageFile: _imageFile),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Information',
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              My2TextField(
                  textEditingController: descriptionController,
                  labelText: 'Descriver votre image'),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSpiner = true;
                    });
                    _pickImage();
                    setState(() {
                      showSpiner = false;
                    });
                  },
                  child: Text('Pick Image'),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: _imageFile != null
                    ? Image.file(_imageFile!)
                    : Text('No image selected'),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSpiner = true;
                    });
                    _saveUserData();
                    setState(() {
                      showSpiner = false;
                    });
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
