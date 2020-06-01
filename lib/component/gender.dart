import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';


class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  
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