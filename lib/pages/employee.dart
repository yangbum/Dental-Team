import 'package:dental_home/component/gender.dart';
import 'package:dental_home/component/position.dart';
import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class EmployeRegister extends StatefulWidget {
  @override
  _EmployeRegisterState createState() => _EmployeRegisterState();
}

class _EmployeRegisterState extends State<EmployeRegister> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signUp() async {
    String url = "https://dentaldb.000webhostapp.com/API/employee.php";
    http.post(url, body : {
      'first_name' : fname.text,
      'mid_name' : mname.text,
      'last_name' : lname.text,
      'gender' : gender,
      'position' : valProvince,
      'address' : address.text,
      'mobile' : mobile.text,
      'email' : email.text,
      'password' : password.text,

    });
    setState(() {
      fname.clear();
      mname.clear();
      lname.clear();
      address.clear();
      mobile.clear();
      email.clear();
      password.clear();
    });
    print(gender);
    print(valProvince);
    print(mobile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Register Page'),
      ),
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
                      controller: fname,
                      decoration: InputDecoration(
                        labelText: 'First name',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: mname,
                      decoration: InputDecoration(
                        labelText: 'Mid name',
                      ),
                    ),
                    TextFormField(
                      controller: lname,
                      decoration: InputDecoration(
                        labelText: 'Last name',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    
                    //gender
                    Row(
                      children: <Widget>[
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 20),
                        ),
                        Gender(),
                      ],
                    ),
                   //position
                    Row(
                      children: <Widget>[
                        Text(
                          'Position',
                          style: TextStyle(fontSize: 20),
                        ),
                        Position(),
                      ],
                    ),

                    TextFormField(
                      controller: address,
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: mobile,
                      decoration: InputDecoration(
                        labelText: 'Mobile No.',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if (key.currentState.validate()) {
                          signUp();
                        }
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
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
