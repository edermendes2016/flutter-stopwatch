import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stopwatch/components/contact-page.dart';
import 'package:stopwatch/components/floating.dart';
import 'package:stopwatch/controllers/crud-controller.dart';
import 'package:stopwatch/models/contact.dart';
import 'package:stopwatch/components/body.dart';

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactModel _contactModel = ContactModel();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
    _contactModel.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEXT',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
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
        backgroundColor: Colors.grey[300],
        floatingActionButton: AppFloating(),
        body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          },
        ));
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: contacts[index].img != null
                        ? FileImage(File(contacts[index].img))
                        : AssetImage("lib/images/person.png")),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      contacts[index].adress ?? "",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
