import 'package:flutter/material.dart';

class TigerScreen extends StatefulWidget {
  const TigerScreen({super.key});

  @override
  State<TigerScreen> createState() => _TigerScreenState();
}

class _TigerScreenState extends State<TigerScreen> {
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
                  Image.asset('images/Tiger.jpg'),
                  SizedBox(height: 20),
                  Text(
                      "Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or another type of compatible computer. Text messages may be sent over a cellular network or may also be sent via satellite or Internet connection."
                      "Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or another type of compatible computer. Text messages may be sent over a cellular network or may also be sent via satellite or Internet connection.")
                ],
              ),
            ],
          )),
    );
  }
}
