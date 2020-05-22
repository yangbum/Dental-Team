import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointRequest extends StatefulWidget {
  @override
  _AppointRequestState createState() => _AppointRequestState();
}

class _AppointRequestState extends State<AppointRequest> {

  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController problem = TextEditingController();
  TextEditingController fee = TextEditingController();
  

  Future appointReq() async{
    String url = "https://dentaldb.000webhostapp.com/appointReq.php";
    http.post(url,body: {
      'problem' : problem.text,
      'fee' : fee.text,
      
    });
    setState(() {
      problem.clear();
      fee.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointment Request Form'),),
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
                    controller: problem,
                    decoration: InputDecoration(
                      labelText: 'Write your Problem',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: fee,
                    decoration: InputDecoration(
                      labelText: 'Pay Fee',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  
                  RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                      if(key.currentState.validate()){
                        appointReq();
                      }
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                    },
                    child: Text('Submit', style: TextStyle(color: Colors.white),),
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