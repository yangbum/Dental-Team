import 'package:flutter/material.dart';

import 'patient.dart';
import 'viewservice.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceView()));
            },
            child: Text("Services"),
          ),

           RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientRegister()));
            },
            child: Text("Patient Form"),
          )
        ],
      ),
    );
  }
}