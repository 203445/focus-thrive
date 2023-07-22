import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customButton(
    String buttonText, VoidCallback onPressed, BuildContext context) {
  return SizedBox(
    width: 250,
    height: MediaQuery.of(context).size.height * 0.08,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        backgroundColor: const Color.fromRGBO(11, 117, 133, 1),
        elevation: 9,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 22, color: Color(0xFFF1F1F1)),
        ),
      ),
    ),
  );
}
