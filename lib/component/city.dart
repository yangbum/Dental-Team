import 'dart:convert';

import 'package:dental_home/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
<<<<<<< HEAD
  String url = "https://dentaldb.000webhostapp.com/API/city.php";

=======
  String url = "https://dentaldb.000webhostapp.com/city.php";
 
>>>>>>> fe95dc0948d2f791df914fa88f57346eb40ec254
  List<dynamic> dataCity = List();

  Future getCity() async {
    final response = await http.get(url); 
    var listData = jsonDecode(response.body); 
    setState(() {
      dataCity = listData; 
    });
    // print("data : $listData");
  }

  @override
  void initState() {
    super.initState();
    getCity();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              hint: Text("Select City"),
              value: valCity,
              items: dataCity.map((item) {
                return DropdownMenuItem(
                  child: Text(item['ct_name']),
                  value: item['ct_name'],
                );
              }).toList(),
              onChanged: (value) {
               setState(() {
                 valCity = value;
               });
              },
            ),
          ],
        ),
      );
  }
}