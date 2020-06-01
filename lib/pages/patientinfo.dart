import 'package:dental_home/component/drawer.dart';
// import 'package:dental_home/widget/apreq.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
class PatientProfile extends StatefulWidget {
  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  int selectIndex = 0;

  final tabs = [
    Center(child: Text('Appointment Request'),),
    Center(child: Text('Presciption or Suggestion'),),
    Center(child: Text('Appointment Confirm'),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, 'Appointment Request'),
      appBar: AppBar(
        title: Center(child: Text('User Profile')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: 
            tabs[selectIndex],
            )
          ],
        ),
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       appointReq('Appointment Request','    Lorem Ipsum Is Simply Dummy Text Of The Printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
      //       appointReq('Appointment confirm','    Lorem Ipsum Is Simply Dummy Text Of The Printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
      //       appointReq('Presciption','    Lorem Ipsum Is Simply Dummy Text Of The Printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
      //     ],
      //   ),
      // ),

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white24,
          // selectedItemBorderColor: Colors.purpleAccent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.blue,
        ),
        selectedIndex: selectIndex,
        onSelectTab: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.add_comment,
            label: 'Request',
          ),
          
          FFNavigationBarItem(
            iconData: Icons.beenhere,
            label: 'Confirmation',
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment,
            label: 'Presciption',
          ),
        ],
      ),
      
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   items: [
      //       BottomNavigationBarItem(
      //       icon: Icon(Icons.add_comment),
      //       title: Text('Request'),
      //       backgroundColor: Colors.red
      //       ),
      //       BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment),
      //       title: Text('Presciption'),
      //       backgroundColor: Colors.yellow
      //       ),
      //       BottomNavigationBarItem(
      //       icon: Icon(Icons.beenhere),
      //       title: Text('Confirm'),
      //       backgroundColor: Colors.blue
      //       ),
      //   ],
      //   onTap: (index){
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   ),
    );
  }
}
