import 'package:flutter/material.dart';

class My2TextField extends StatelessWidget {
  const My2TextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });
  final String labelText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
