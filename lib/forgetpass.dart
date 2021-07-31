import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'constants.dart';
// class forgetpass extends StatefulWidget {
//   @override
//   _forgetpassState createState() => _forgetpassState();
// }
//
// class _forgetpassState extends State<forgetpass> {
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   var email="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('resetting password'),
//       ),
//
//       body: Column(
//         children: [
//           Text('please provide your email for password resetting'),
//           TextField(onChanged: (value){
//            setState(() {
//
//              email=value;
//            });
//
//
//           },),
//
//           FlatButton(onPressed: (){
//
//             _auth.sendPasswordResetEmail(email: email);
//             Navigator.pop(context);
//
//           }, child: Text('send request')),
//
//         ],
//       ),
//     );
//   }
// }

class  forgetpass extends StatefulWidget {

  @override
  forgetpassState createState() => new forgetpassState();
}

class forgetpassState extends State<forgetpass> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  var email="";
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: kCategoryPageColor,
            onPressed: () async{
              _auth.sendPasswordResetEmail(email: email);
              Navigator.pop(context);
            },
            /* change this function definition to a function that navigates to the next page ( menu page with TV, Instagram, etc. )*/
            tooltip: 'Next',
            child: new Icon(Icons.arrow_right),
          ),
          appBar: AppBar(
            backgroundColor: kCategoryPageColor,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: (){
                  Navigator.pop(c);
                }),
            /*change the above function definition for the BACK functionality*/
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kCategoryPageColor,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "please provide your email for password resetting",
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        email=value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the email address",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}