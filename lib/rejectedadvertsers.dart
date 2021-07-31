// import 'package:adcon/useradd.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class rejectedadvertsers extends StatefulWidget {
//   final adv ads;
//   rejectedadvertsers(this.ads);
//   @override
//   _rejectedadvertsersState createState() => _rejectedadvertsersState();
// }
//
// class _rejectedadvertsersState extends State<rejectedadvertsers> {
//   final _applyy = FirebaseDatabase.instance.reference().child('apply');
//   final _adv = FirebaseDatabase.instance.reference().child('advertisers');
//   List<dynamic> l = [];
//   List<dynamic> l2 = [];
//
//   void initState() {
//     super.initState();
//     print(widget.ads.key);
//     data();
//     // _apply1.onChildAdded.listen((event) {
//     //   setState(() {
//     //     l.add(new apply.fromSnapShot(event.snapshot));
//     //   });
//     // // });
//     // print("l${l}");
//     // if(l.isNotEmpty){
//     // l.forEach((element) async{
//     // dynamic result = await _adv.once().then((value) {
//     //
//     // setState(() {
//     // l2.add(value.value[element.advertiserid]['cat']);
//     // print("l2${l2}");
//     // });
//     // });
//     // });
//     // print(l);
//     // print("l2 out ${l2}");
//     // }
//
//   }
//
//   void data() {
//     var _apply1 = _applyy.orderByChild('key1')
//         .equalTo(widget.ads.key)
//         .onChildAdded
//         .listen((event) {
//       if (event.snapshot.value['Confirm'] == 'F' && event.snapshot.value['rejected']=='T') {
//         setState(() {
//           l.add(new apply.fromSnapShot(event.snapshot));
//           _adv.once().then((value) {
//             setState(() {
//               l2.add(value.value[event.snapshot.value['advertiserid']]['cat']);
//               print(l2);
//             });
//           });
//
//           // l.add(event.snapshot);
//
//
//           print(l);
//           print("l2 ${l2}");
//         });
//       }
//       print("outside of setstate ${l}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('rejectadv for ${widget.ads.aid}'),
//       ),
//       body: ListView.builder(
//           itemCount: l.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(
//                   'advertiser name ${l[index].advertiserid} cat name ${l2
//                       .isNotEmpty ? l2[index] : 'loading..'}'),
//             );
//           }
//       ),
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:adcon/useradd.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';



class rejectedadvertsers extends StatefulWidget {
  final adv ads;
  rejectedadvertsers(this.ads);
  @override
  _rejectedadvertsersState createState() => new _rejectedadvertsersState();
}

class _rejectedadvertsersState extends State<rejectedadvertsers> {
  final _applyy = FirebaseDatabase.instance.reference().child('apply');
  final _adv = FirebaseDatabase.instance.reference().child('advertisers');
  List<dynamic> l = [];
  List<dynamic> l2 = [];

  void initState() {
    super.initState();
    print(widget.ads.key);
    data();
    // _apply1.onChildAdded.listen((event) {
    //   setState(() {
    //     l.add(new apply.fromSnapShot(event.snapshot));
    //   });
    // // });
    // print("l${l}");
    // if(l.isNotEmpty){
    // l.forEach((element) async{
    // dynamic result = await _adv.once().then((value) {
    //
    // setState(() {
    // l2.add(value.value[element.advertiserid]['cat']);
    // print("l2${l2}");
    // });
    // });
    // });
    // print(l);
    // print("l2 out ${l2}");
    // }

  }

  void data() {
    var _apply1 = _applyy.orderByChild('key1')
        .equalTo(widget.ads.key)
        .onChildAdded
        .listen((event) {
      if (event.snapshot.value['Confirm'] == 'F' && event.snapshot.value['rejected']=='T') {
        setState(() {
          l.add(new apply.fromSnapShot(event.snapshot));
          _adv.once().then((value) {
            setState(() {
              l2.add(value.value[event.snapshot.value['advertiserid']]['cat']);
              print(l2);
            });
          });

          // l.add(event.snapshot);


          print(l);
          print("l2 ${l2}");
        });
      }
      print("outside of setstate ${l}");
    });
  }

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
            backgroundColor: kCategoryPageColor,
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
                        color: kCategoryPageColor,
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Rejected Applications",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black87, fontSize: 22),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  l.isNotEmpty && l2.isNotEmpty?ListView.builder(
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
                                    line1: l[index].advertiserid,
                                    line2: l2[index],
                                    press: () {


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

  final Function press;

  const TabCard({Key key, this.line1, this.line2, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: 370,
      height: 85,
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
              ],
            ),
          ),
          Spacer(),

          /*uncomment the below code for link submission in Confirmed Applications*/

          // TextButton(
          //     child: Text('SUBMIT DRAFT LINK'),
          //     onPressed: press,
          //     style: TextButton.styleFrom(
          //         textStyle: TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //             decorationColor: Colors.red)))
        ],
      ),
    );
  }
}