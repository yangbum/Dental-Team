import 'dart:convert';

import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Position extends StatefulWidget {
  @override
  _PositionState createState() => _PositionState();
}

class _PositionState extends State<Position> {
<<<<<<< HEAD
  String url = "https://dentaldb.000webhostapp.com/API/position.php";
  List<dynamic> dataPosition = List();
=======
  String url = "https://dentaldb.000webhostapp.com/position.php";
 
  List<dynamic> dataProvince = List();
>>>>>>> fe95dc0948d2f791df914fa88f57346eb40ec254

  Future getPosition() async {
    final response = await http.get(url); 
    var listData = jsonDecode(response.body); 
    setState(() {
      dataPosition = listData; 
    });
    // print("data : $listData");
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              hint: Text("Select Position"),
              value: valPosition,
              items: dataPosition.map((item) {
                return DropdownMenuItem(
                  child: Text(item['ps_name']),
                  value: item['ps_name'],
                );
              }).toList(),
              onChanged: (value) {
               setState(() {
                 valPosition = value;
               });
              },
            ),
            // Text('Province you choose $valProvince',
            // style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold),
            // )
          ],
        ),
      );
  }
}