import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ServiceAdd extends StatefulWidget {
  @override
  _ServiceAddState createState() => _ServiceAddState();
}

class _ServiceAddState extends State<ServiceAdd> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  Future addService() async{
    String url = "https://dentaldb.000webhostapp.com/service.php";
    http.post(url,body: {
      'name' : name.text,
      'price' : price.text,
      'description' : description.text
    });
    setState(() {
      name.clear();
      price.clear();
      description.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Services'),),
      body: SingleChildScrollView(
        child: Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Service Name',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
            ),
            TextFormField(
              controller: price,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
              
            ),
            TextFormField(
              controller: description,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
              
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: (){
                if(key.currentState.validate()){
                  addService();
                  Toast.show("Record is saved", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                }
                Navigator.pop(context);
              },
              
              child: Text('Add', style: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}