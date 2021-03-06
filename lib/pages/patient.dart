import 'package:dental_home/component/city.dart';
import 'package:dental_home/component/gender.dart';
import 'package:dental_home/component/province.dart';
import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientRegister extends StatefulWidget {
  @override
  _PatientRegisterState createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController ward = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Future signUp() async {
    String url = "https://dentaldb.000webhostapp.com/API/patient.php";
    http.post(url, body: {
      'first_name': fname.text,
      'mid_name': mname.text,
      'last_name': lname.text,
      'gender' : gender,
      // 'dob': dateTime.toString(),
      'province' : valProvince,
      'city' : valCity,
      'ward': ward.text,
      'street': street.text,
      'telephone': telephone.text,
      'mobile': mobile.text,
      'email': email.text,
      'password': password.text
    });

    print(gender);
    print(valCity);
    print(valProvince);
    
    setState(() {
      fname.clear();
      mname.clear();
      lname.clear();
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
      appBar: AppBar(
        title: Text('Patient Register Page'),
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
                      // validator: (value) =>
                      //     value.isEmpty ? 'this field can not be empty' : null,

                    ),
                    TextFormField(
                      controller: lname,
                      decoration: InputDecoration(
                        labelText: 'Last name',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 20),
                        ),
                        Gender(),
                      ],
                    ),

                    // Row(
                    //   children: <Widget>[
                    //     Text(
                    //       'Date of Birth',
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //     SizedBox(width: 20,),
                    //     DatePicker(),
                    //   ],
                    // ),

                    Row(
                      children: <Widget>[
                        Text(
                          'Province',
                          style: TextStyle(fontSize: 20),
                        ),
                        ProvinceList(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'City',
                          style: TextStyle(fontSize: 20),
                        ),
                        CityList(),
                      ],
                    ),

                    TextFormField(
                      controller: ward,
                      decoration: InputDecoration(
                        labelText: 'Ward no.',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: street,
                      decoration: InputDecoration(
                        labelText: 'Street',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'this field can not be empty' : null,
                    ),
                    TextFormField(
                      controller: telephone,
                      decoration: InputDecoration(
                        labelText: 'Telephone',
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
