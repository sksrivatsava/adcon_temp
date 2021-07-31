import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

// class content extends StatefulWidget {
//   final ads;
//   final adv;
//   content(this.ads,this.adv);
//   @override
//   _contentState createState() => _contentState();
// }
//
// class _contentState extends State<content> {
//   final _applyy = FirebaseDatabase.instance.reference().child('apply');
//   var link="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text('provide link for ${widget.adv}'),
//
//       ),
//       body: Column(
//         children: [
//           Expanded(child: TextField(
//             onChanged: (value){
//               setState(() {
//                 link=value;
//               });
//             },
//             style: TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 hintText: "Enter the link",
//                 hintStyle: TextStyle(color: Colors.black)),
//           )),
//           RaisedButton(
//               child: Text('submit'),
//               onPressed: (){
//                 _applyy.child(widget.ads.key+"@"+widget.adv).update({
//
//                   'link':link,
//                 });
//                 Navigator.pop(context,"back");
//
//           })
//         ],
//       ),
//     );
//   }
// }

class content extends StatefulWidget {
  final ads;
  final adv;
  content(this.ads,this.adv);

  @override
  contentState createState() => new contentState();
}

class contentState extends State<content> {
  final _applyy = FirebaseDatabase.instance.reference().child('apply');
 var link="";
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: kCategoryPageColor,
            onPressed: () {
    _applyy.child(widget.ads.key+"@"+widget.adv).update({

                  'link':link,
                });
                Navigator.pop(context,"back");
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
                        "provide link for ${widget.adv}.",
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
                        link=value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "enter the link",
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
