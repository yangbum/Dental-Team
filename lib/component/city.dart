import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  String url = "http://192.168.254.40/api/city.php";
  String valCity;
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