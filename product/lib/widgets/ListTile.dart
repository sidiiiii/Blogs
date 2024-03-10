import 'package:flutter/material.dart';

Widget customListTile({
  required String title,
  required String subtitle,
  required String imagePath,
}) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(subtitle),
    leading: Image.asset(imagePath),
  );
}
