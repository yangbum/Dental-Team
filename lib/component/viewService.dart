import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceView extends StatefulWidget {
  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  String url = "https://dentaldb.000webhostapp.com/API/viewservice.php";
  
  List<dynamic> dataProvince = List();

  Future getProvince() async {
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
    getProvince();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataProvince.length,
              itemBuilder: (context, index){
                var callData = dataProvince[index];
                return ListTile(
                  title: Text(callData['name']),
                  subtitle: Image.network(callData['photo']),
                );
              })
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