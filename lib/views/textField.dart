import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: TextField(
        decoration: InputDecoration(
            labelText: "Novo texto", labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
