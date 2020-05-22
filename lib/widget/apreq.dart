import 'package:flutter/material.dart';

Widget appointReq(String text1,String text) {
  return Card(
    elevation: 2,
    child: Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.deepPurple,
      ),
      // height: 200,
      width: double.infinity,
      child: ExpansionTile(
        title: Text(
        text1,
        style: TextStyle(color: Colors.white),
        ),
       children: <Widget>[
         Text(text,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.justify,
      ),
       ],
      )
    ),
  );
}
