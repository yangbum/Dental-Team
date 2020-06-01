import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
<<<<<<< HEAD
  
=======

>>>>>>> fe95dc0948d2f791df914fa88f57346eb40ec254
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text('Male'),
                  Radio(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (T) {
                      setState(() {
                        gender = T;
                      });
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (T) {
                      setState(() {
                        gender = T;
                      });
                    },
                  ),
                ],
              ),
            );
  }
}