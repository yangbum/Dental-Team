import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceView extends StatefulWidget {
  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  
  var data;
  var loading = true;

  Future getService() async{
    String url = 'https://dentaldb.000webhostapp.com/viewservice.php';
    var responce = await http.get(url);
    var serviceData = json.decode(responce.body);
    setState(() {
      data = serviceData;
    });
    loading= false;
  }

  @override
  void initState() { 
    super.initState();
    getService();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Available Services')),
      ),
      body: loading == true ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder:(context, index){
            var callData = data[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(callData['name']),
                    Text('Rs.' + callData['price']),
                    Text(callData['description']),
                  ],
                ),
              ),
            );
          }
          ),
      ),
          
    );
  }
}
