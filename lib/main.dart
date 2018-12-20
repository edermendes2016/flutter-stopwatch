import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Stopwatch",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(),
      home: new Scaffold(
        body: new Center(
          child: Column(
            children: <Widget>[
              new RandomContainer(
                width: double.infinity,
                height: 150.0,
              ), new RandomContainer(
                width: double.infinity,
                child: new Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: new AspectRatio(
                    aspectRatio: 1.0,
                    child: new RandomContainer(
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
