import 'package:dental_home/component/drawer.dart';
// import 'package:dental_home/widget/apreq.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class EmployeProfile extends StatefulWidget {
  @override
  _EmployeProfileState createState() => _EmployeProfileState();
}

class _EmployeProfileState extends State<EmployeProfile> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

   final tabs = [
    Center(child: Text('Appointment Request', style: TextStyle(color: Colors.white, fontSize: 25),),),
    Center(child: Text('Presciption or Suggestion', style: TextStyle(color: Colors.white, fontSize: 25),),),
    Center(child: Text('Appointment Confirm', style: TextStyle(color: Colors.white,fontSize: 25),),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer('Presciption'),
      appBar: AppBar(
        title: Center(child: Text('User Profile')),
      ),
      body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                Container(
                  child: tabs[_page],
                ),
                // Text('Appointment Request' + _page.toString(), textScaleFactor: 1.5,),
                // Text('Appointment Request' + _page.toString(), textScaleFactor: 1.5,),
                // Text('Appointment Request' + _page.toString(), textScaleFactor: 1.5,),
                // RaisedButton(
                //   child: Text('Go To First Page'),
                //   onPressed: () {
                //     final CurvedNavigationBarState navBarState =
                //         _bottomNavigationKey.currentState;
                //     navBarState.setPage(0);
                //   },
                // )
              ],
            ),
          ),
        ),
      // 

      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add_comment, size: 30),
            Icon(Icons.assignment, size: 30),
            Icon(Icons.beenhere, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.green,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 100),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
    );
  }
}
