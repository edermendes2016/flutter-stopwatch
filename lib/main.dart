import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stopwatch/views/body.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEXT',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'i')),
          backgroundColor: Colors.deepPurple[300],
          actions: <Widget>[
            IconButton(
              iconSize: 22.0,
              onPressed: () {},
              color: Colors.black,
              icon: Icon(Icons.filter_list),
            )
          ],
          centerTitle: true,
        ),
        body: AppBody());
  }
}
