import 'dart:collection';

import 'package:flutter/material.dart';

class CutlureScreen extends StatefulWidget {
  const CutlureScreen({super.key});

  @override
  State<CutlureScreen> createState() => _CutlureScreenState();
}

class _CutlureScreenState extends State<CutlureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Blog Of th day",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.blue[900]!),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('images/culture.jpg'),
                SizedBox(height: 20),
                Text(
                    "Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or another type of compatible computer. Text messages may be sent over a cellular network or may also be sent via satellite or Internet connection.")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
