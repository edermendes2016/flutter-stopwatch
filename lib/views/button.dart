import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        child: new Text("Adicionar"), color: Colors.deepPurple[300], textColor: Colors.black, onPressed: () {});
  }
}
