import 'package:flutter/material.dart';

Widget drawer(String text){
 return Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage(
                    'https://www.gstatic.com/tv/thumb/persons/670130/670130_v9_ba.jpg',
                    scale: 25),
              ),
              Text('User Name',textScaleFactor: 1.5,),
              Text('User email',textScaleFactor: 1.5,),
              Divider(
                height: 5,
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.add_box,size: 40,),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Services',textScaleFactor: 1.25,)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.add_comment,size: 40,),
                    SizedBox(
                      width: 30,
                    ),
                    Text(text,textScaleFactor: 1.25,)
                  ],
                ),
              ),
              Divider(
                height: 5,
                color: Colors.grey,
              ),

               Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.comment,size: 40,),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Your Suggestion',textScaleFactor: 1.25,)
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.info,size: 40,),
                    SizedBox(
                      width: 30,
                    ),
                    Text('About us',textScaleFactor: 1.25,)
                  ],
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(15),
                child: RaisedButton(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.exit_to_app,color: Colors.white,size: 25,),
                      SizedBox(width: 25,),
                      Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                  onPressed: (){}),
              ),
            ],
          ),
        ),
      );
}