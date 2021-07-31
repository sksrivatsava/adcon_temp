// import 'package:adcon/useradd.dart';
// import 'package:adcon/userservice.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class advertisercontent extends StatefulWidget {
//   @override
//   _advertisercontent createState() => _advertisercontent();
// }
//
// class _advertisercontent extends State<advertisercontent> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
//   final _apply=FirebaseDatabase.instance.reference().child('apply');
//   final _ads=FirebaseDatabase.instance.reference().child('ads');
//   List<dynamic> l=[];
//   List<dynamic> l2=[];
//   List<dynamic> l3=[];
//   void initState(){
//     super.initState();
//     var x=getUser(_auth.currentUser.email);
//     _apply.orderByChild('advertiserid').equalTo(x).onChildAdded.listen((event) {
//
//       if(event.snapshot.value['Confirm']=='T' && event.snapshot.value['rejected']=='F' && event.snapshot.value['link']!=null) {
//         setState(() {
//           l.add(new apply.fromSnapShot(event.snapshot));
//           _ads.once().then((value) {
//             setState(() {
//               print(value);
//               l2.add(value.value[event.snapshot.value['key1']]['aid']);
//               l3.add(value.value[event.snapshot.value['key1']]['uid']);
//
//
//               print(l2);
//             });
//           });
//         });
//       }
//       _apply.orderByChild('advertiserid').equalTo(x).onChildChanged.listen((event) {
//         setState(() {
//           int i=l.indexWhere((element)=>element.key==event.snapshot.key);
//           l.removeAt(i);
//           l2.removeAt(i);
//           l3.removeAt(i);
//         });
//
//       });
//
//
//
//     });
//
//
//
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('confirmed ads'),
//       ),
//
//       body: ListView.builder(
//           itemCount: l.length,
//           itemBuilder: (context,index){
//             return Card(
//               child: Column(
//                 children: [
//                   Text('adname ${l2[index]} username ${l3[index]}'),
//                   Text('rate given ${l[index].rate}'),
//                   Text('link ${l[index].link}' )
//                   // RaisedButton(
//                   //     child: Text('confirm the ad'),
//                   //     onPressed: (){
//                   //
//                   //       _apply.child(l[index].key).update({
//                   //         'Confirm':'T'
//                   //       });
//                   //     })
//                 ],
//               ),
//
//             );
//
//           }),
//     );
//   }
// }

import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';

import 'package:adcon/useradd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';



class advertisercontent extends StatefulWidget {

  @override
  _advertisercontentState createState() => new _advertisercontentState();
}

class _advertisercontentState extends State<advertisercontent> {


  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
  final _apply=FirebaseDatabase.instance.reference().child('apply');
  final _ads=FirebaseDatabase.instance.reference().child('ads');
  List<dynamic> l=[];
  List<dynamic> l2=[];
  List<dynamic> l3=[];
  void initState(){
    super.initState();
    var x=getUser(_auth.currentUser.email);
    _apply.orderByChild('advertiserid').equalTo(x).onChildAdded.listen((event) {

      if(event.snapshot.value['Confirm']=='T' && event.snapshot.value['rejected']=='F' && event.snapshot.value['link']!=null) {
        setState(() {
          l.add(new apply.fromSnapShot(event.snapshot));
          _ads.once().then((value) {
            setState(() {
              print(value);
              l2.add(value.value[event.snapshot.value['key1']]['aid']);
              l3.add(value.value[event.snapshot.value['key1']]['uid']);


              print(l2);
            });
          });
        });
      }
      _apply.orderByChild('advertiserid').equalTo(x).onChildChanged.listen((event) {
        setState(() {
          int i=l.indexWhere((element)=>element.key==event.snapshot.key);
          l.removeAt(i);
          l2.removeAt(i);
          l3.removeAt(i);
        });

      });



    });




  }
  @override
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(

          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          // floatingActionButton: new FloatingActionButton(
          //   backgroundColor: kCategoryPageColor,
          //   onPressed: () {
          //     Navigator.push(c, MaterialPageRoute(builder: (context) => TabPage()));
          //   },
          //   tooltip: 'Next',
          //   child: new Icon(Icons.arrow_right),
          // ),
          appBar: AppBar(
            backgroundColor: kNavBarColor,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: () {

                  Navigator.pop(c);

                }),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kNavBarColor,
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Your Content",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black87, fontSize: 22),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  l.isNotEmpty && l2.isNotEmpty && l3.isNotEmpty?ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: l.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: new Padding(
                                padding: EdgeInsets.fromLTRB(10, 0.5, 10, 0.5),
                                child: new TabCard(
                                    line1: l2[index],
                                    line2: l3[index],
                                    line3:l[index].rate.toString(),
                                    line4:l[index].link,
                                    press: () async{

                                      if (await canLaunch(l[index].link)) {
                                      await launch(l[index].link);
                                      } else {
                                      throw 'Could not launch ${l[index].link}';
                                      }
                                    }),
                              ),
                            ),
                          ],
                        );
                      }):SizedBox(),
                ],
              ),
            ),
          ),
        ));
  }
}

class TabCard extends StatelessWidget {
  final String line1;
  final String line2;
  final String line3;
  final String line4;

  final Function press;

  const TabCard({Key key, this.line1, this.line2,this.line3,this.line4, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: 370,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "$line1\n",
                    style: TextStyle(
                        fontSize: 15,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "$line2\n",
                    style: TextStyle(color: kLightBlackColor)),
                TextSpan(
                    text: "$line3\n",
                    style: TextStyle(color: kLightBlackColor)),
                TextSpan(
                    text: "$line4\n",
                    style: TextStyle(color: kLightBlackColor)),


              ],
            ),
          ),
          Spacer(),


          /*uncomment the below code for link submission in Confirmed Applications*/

          TextButton(
              child: Text('open Link'),
              onPressed: press,
              style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.red)))
        ],
      ),
    );
  }
}
