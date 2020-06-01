import 'dart:convert';

import 'package:dental_home/pages/patient.dart';
import 'package:dental_home/pages/patientinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PatientLog extends StatefulWidget {
  @override
  _PatientLogState createState() => _PatientLogState();
}

class _PatientLogState extends State<PatientLog> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  String message = '';

  Future logIn() async{
    String url = "https://dentaldb.000webhostapp.com/API/patientlogin.php";
    var response = await http.post(url,body: {
      'email' : email.text,
      'password' : password.text,
    });

    var dataUsers = json.decode(response.body);

    if(dataUsers.length == 1){
      //goto homepage
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PatientProfile()));
    }else{
      //show invalid message
      setState(() {
        message = 'Invalid user name or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LogIn Page'),),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  Text(message,style: TextStyle(color: Colors.red),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                      if(key.currentState.validate()){
                        logIn();
                      }
                    },
                    child: Text('LogIn', style: TextStyle(color: Colors.white),),
                    ),
                    OutlineButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PatientRegister()));
                      },
                      child: Text('Register'),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}