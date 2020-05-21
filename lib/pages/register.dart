import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {

  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController ward = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signUp() async{
    String url = "http://192.168.254.40/API/patient.php";
    http.post(url,body: {
      'first_name' : fname.text,
      'mid_name' : mname.text,
      'last_name' : lname.text,
      'gender' : gender.text,
      'dob' : dob.text,
      'province' : province.text,
      'city' : city.text,
      'ward' : ward.text,
      'street' : street.text,
      'telephone' : telephone.text,
      'mobile' : mobile.text,
      'email' : email.text,
      'password' : password.text
    });
    setState(() {
      fname.clear();
      mname.clear();
      lname.clear();
      gender.clear();
      dob.clear();
      province.clear();
      ward.clear();
      street.clear();
      telephone.clear();
      mobile.clear();
      email.clear();
      password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Page'),),
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
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: mname,
                    decoration: InputDecoration(
                      labelText: 'Mid name',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: lname,
                    decoration: InputDecoration(
                      labelText: 'Last name',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: gender,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),
                  TextFormField(
                    controller: dob,
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),
                  TextFormField(
                    controller: province,
                    decoration: InputDecoration(
                      labelText: 'Select Province',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),

                  TextFormField(
                    controller: ward,
                    decoration: InputDecoration(
                      labelText: 'Ward no.',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),
                  TextFormField(
                    controller: street,
                    decoration: InputDecoration(
                      labelText: 'Street',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),
                  TextFormField(
                    controller: telephone,
                    decoration: InputDecoration(
                      labelText: 'Telephone',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null, 
                  ),
                  TextFormField(
                    controller: mobile,
                    decoration: InputDecoration(
                      labelText: 'Mobile No.',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                      if(key.currentState.validate()){
                        signUp();
                      }
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                    },
                    child: Text('SignUp', style: TextStyle(color: Colors.white),),
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