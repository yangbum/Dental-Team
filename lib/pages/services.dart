import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Services')),
      body:Column(children: <Widget>[
        Text('Teeth Implant'),
        Text('Root Canal Tooth Filling'),
        Text('Extraction'),
        Text('Teeth Filling'),
      ],)
    );
  }
}