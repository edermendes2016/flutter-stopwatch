import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stopwatch/components/floating.dart';
import 'package:stopwatch/models/contact.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _contactEdition = false;
  Contact _editContact;

  //Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _adressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editContact = Contact();
    } else {
      _editContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editContact.name;
      _emailController.text = _editContact.email;
      _adressController.text = _editContact.adress;
      _phoneController.text = _editContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(_editContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: AppFloating(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editContact.img != null
                              ? FileImage(File(_editContact.img))
                              : AssetImage("lib/images/person.png")))),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _contactEdition = true;
                setState(() {
                  _editContact.name = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "E-Mail"),
              onChanged: (text) {
                _contactEdition = true;
                _editContact.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Endereço"),
              onChanged: (text) {
                _contactEdition = true;
                _editContact.adress = text;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                _contactEdition = true;
                _editContact.phone = text;
              },
              keyboardType: TextInputType.phone,
            )
          ],
        ),
      ),
    );
  }
}
