import 'package:dental_home/pages/employe_log.dart';
import 'package:dental_home/pages/patient_log.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
=======
import 'patient.dart';
import 'viewservice.dart';


>>>>>>> fe95dc0948d2f791df914fa88f57346eb40ec254
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
<<<<<<< HEAD
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.blue]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildWelcome(),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                  child: Text('Patient',textScaleFactor: 1.25,),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> PatientLog()));
                  },
                ),
                Text('||',textScaleFactor: 2,),
                RaisedButton(
                  child: Text('Doctor',textScaleFactor: 1.25,),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=>EmployeeLog()));
                  },
                ),
                  ],
                ),
              )
            ],
          ),
        ),
=======
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
>>>>>>> fe95dc0948d2f791df914fa88f57346eb40ec254
      ),
    );
  }

  Container buildWelcome() {
    return Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontSize: 45),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Our',
                    ),
                    TextSpan(
                        text: ' Dental Home',
                        style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            );
  }
}
