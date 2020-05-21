import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProvinceList extends StatefulWidget {
  @override
  _ProvinceListState createState() => _ProvinceListState();
}

class _ProvinceListState extends State<ProvinceList> {
  String url = "http://192.168.254.40/api/province.php";
  String valProvince;
  List<dynamic> dataProvince = List();

  Future getCity() async {
    final response = await http.get(url); 
    var listData = jsonDecode(response.body); 
    setState(() {
      dataProvince = listData; 
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
              hint: Text("Select Province"),
              value: valProvince,
              items: dataProvince.map((item) {
                return DropdownMenuItem(
                  child: Text(item['province_name']),
                  value: item['province_name'],
                );
              }).toList(),
              onChanged: (value) {
               setState(() {
                 valProvince = value;
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