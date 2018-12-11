import 'package:flutter/material.dart';
import 'package:stopwatch/views/button.dart';
import 'package:stopwatch/views/textField.dart';

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return new Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
          child: Row(
            children: <Widget>[
              AppTextField(),
              AppButton()
            ],
          ),
        )
      ],
    );
  }
}
