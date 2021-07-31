import 'package:adcon/advertisercontent.dart';
import 'package:adcon/useradd.dart';
import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:adcon/advertiserconfirmedads.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'advhomedrawer.dart';
import 'constants.dart';
// class advhome extends StatefulWidget {
//   @override
//   _advhomeState createState() => _advhomeState();
// }

// class _advhomeState extends State<advhome> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
//   final _apply=FirebaseDatabase.instance.reference().child('apply');
//   final _ads=FirebaseDatabase.instance.reference().child('ads');
//   List<dynamic> l=[];
//   List<dynamic> l2=[];
//   List<dynamic> fl4=[];
//   List<dynamic> l4=[];
//   var sea=false;
//
//   void initState(){
//     super.initState();
//     var x=getUser(_auth.currentUser.email);
// _apply.orderByChild('advertiserid').equalTo(x).onChildAdded.listen((event) {
//
//     if(event.snapshot.value['Confirm']=='F' && event.snapshot.value['rejected']=='F') {
//       setState(() {
//         // l.add(new apply.fromSnapShot(event.snapshot));
//         _ads.once().then((value) {
//           setState(() {
//             print(value);
//             // l2.add(value.value[event.snapshot.value['key1']]['aid']);
//             // l3.add(value.value[event.snapshot.value['key1']]['uid']);
//             var keyo=event.snapshot.key;
//             var addnameo=value.value[event.snapshot.value['key1']]['aid'];
//             var usernameo=value.value[event.snapshot.value['key1']]['uid'];
//             var rateo=event.snapshot.value['rate'];
//             var cato=value.value[event.snapshot.value['key1']]['cat'];
//             l4.add(new applycard(keyo, addnameo, usernameo, rateo,cato));
//             fl4.add(new applycard(keyo, addnameo, usernameo, rateo,cato));
//
//             // print(l4);
//           });
//         });
//       });
//     }
//     _apply.orderByChild('advertiserid').equalTo(x).onChildChanged.listen((event) {
//         setState(() {
//           try {
//             int i=l4.indexWhere((element)=>element.key==event.snapshot.key);
//
//             l4.removeAt(i);
//             fl4=List.from(l4);
//           } on Exception catch (e) {
//             // TODO
//           }
//         });
//
//     });
//
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
//         title: Text('ADVHome'),
//         actions: [
//           RaisedButton(
//               child: Text('signout'),
//               onPressed: (){
//                 try {
//                   _auth.signOut();
//                 } on Exception catch (e) {
//                   // TODO
//                 }
//               }),
//         ],
//
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('your confirmed ads'),
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>advertiserconfiremdads()));
//               },
//             ),
//             ListTile(
//               title: Text('your content'),
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>advertisercontent()));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               IconButton(icon: Icon(FontAwesomeIcons.sortAmountUpAlt), onPressed: (){
//
//                 setState(() {
//                   fl4.sort((a,b)=>a.rate.compareTo(b.rate));
//                 });
//               }),
//               IconButton(icon: Icon(FontAwesomeIcons.sortAmountUp), onPressed: (){
//
//                 setState(() {
//                   fl4.sort((b,a)=>a.rate.compareTo(b.rate));
//                 });
//               }),
//               !sea?Text('all ads here '):new Expanded(
//                 child: new TextField(
//                   onChanged: (value){
//                     setState(() {
//
//                       fl4=l4.where((obj)=>obj.addname.toLowerCase().contains(value.toLowerCase())||obj.username.toLowerCase().contains(value.toLowerCase())||obj.cat.toLowerCase().contains(value.toLowerCase())).toList();
//                     });
//                   },
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.black,
//                       ),
//                       hintText: "Search advertisers Here",
//                       hintStyle: TextStyle(color: Colors.black)),
//
//
//
//                 ),
//               ),
//
//               sea?IconButton(icon: Icon(Icons.cancel), onPressed: (){
//
//                 setState(() {
//
//                   sea=false;
//                   fl4=List.from(l4);
//                 });
//               }):IconButton(icon: Icon(Icons.search), onPressed: (){
//
//                 setState(() {
//
//                   sea=true;
//                 });
//               }),
//
//             ],
//           ),
//           new Expanded(
//             child: ListView.builder(
//                 itemCount: fl4.length,
//                 itemBuilder: (context,index){
//                   return Card(
//                     child: Column(
//                       children: [
//                         Text('adname ${fl4[index].addname} username ${fl4[index].username}'),
//                         Text('rate given ${fl4[index].rate}'),
//                         Text('category ${fl4[index].cat}'),
//                         Column(
//                           children: [
//                             RaisedButton(
//                                 child: Text('confirm the ad'),
//                                 onPressed: (){
//
//                                   _apply.child(fl4[index].key).update({
//                                     'Confirm':'T',
//                                     'rejected':'F'
//                                   });
//                             }),
//
//                             RaisedButton(
//                                 child: Text('reject this ad'),
//                                 onPressed: (){
//
//                                   _apply.child(fl4[index].key).update({
//                                     'Confirm':'F',
//                                     'rejected':'T'
//
//                                   });
//
//                                 })
//                           ],
//                         ),
//                       ],
//                     ),
//
//                   );
//
//
//                 }),
//           ),
//         ],
//       ),
//
//     );
//   }
// }

class AdvHome extends StatefulWidget {
  @override
  AdvHomeState createState() => AdvHomeState();
}

class AdvHomeState extends State<AdvHome> {
  @override
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
  final _apply=FirebaseDatabase.instance.reference().child('apply');
  final _ads=FirebaseDatabase.instance.reference().child('ads');
  List<dynamic> l=[];
  List<dynamic> l2=[];
  List<dynamic> fl4=[];
  List<dynamic> l4=[];
  var searchFlag=false;
  var user="null";
  void initState(){
    super.initState();
    var x=getUser(_auth.currentUser.email);
    _dref.child(x).child('Username').once().then((value) {
      setState(() {
        user=value.value;
      });
    });
    _apply.orderByChild('advertiserid').equalTo(x).onChildAdded.listen((event) {

      if(event.snapshot.value['Confirm']=='F' && event.snapshot.value['rejected']=='F') {
        setState(() {
          // l.add(new apply.fromSnapShot(event.snapshot));
          _ads.once().then((value) {
            setState(() {
              print(value);
              // l2.add(value.value[event.snapshot.value['key1']]['aid']);
              // l3.add(value.value[event.snapshot.value['key1']]['uid']);
              var keyo=event.snapshot.key;
              var addnameo=value.value[event.snapshot.value['key1']]['aid'];
              var usernameo=value.value[event.snapshot.value['key1']]['uid'];
              var rateo=event.snapshot.value['rate'];
              var cato=value.value[event.snapshot.value['key1']]['cat'];
              l4.add(new applycard(keyo, addnameo, usernameo, rateo,cato));
              fl4.add(new applycard(keyo, addnameo, usernameo, rateo,cato));

              // print(l4);
            });
          });
        });
      }
      _apply.orderByChild('advertiserid').equalTo(x).onChildChanged.listen((event) {
        setState(() {
          try {
            int i=l4.indexWhere((element)=>element.key==event.snapshot.key);

            l4.removeAt(i);
            fl4=List.from(l4);
          } on Exception catch (e) {
            // TODO
          }
        });

      });




    });




  }

  Widget build(BuildContext c) {
    return MaterialApp(
      home: Scaffold(
         drawer: AdvNavDrawer(user),
        // floatingActionButton: new FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         c, MaterialPageRoute(builder: (context) => AdvHome()));
        //   },
        //   tooltip: 'Increment',
        //   child: new Icon(Icons.add),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg-adv.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 75),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Welcome,",
                                      style: Theme.of(c)
                                          .textTheme
                                          .display1
                                          .copyWith(fontSize: 28),
                                    ),
                                    Text(
                                      user,
                                      style: Theme.of(c)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                  "Check out your ad applications below.",
                                                  style:
                                                  TextStyle(fontSize: 18)),
                                            ],
                                          ),
                                        ),
                                        // Column(
                                        //   children: <Widget>[
                                        //     IconButton(
                                        //       icon: Icon(Icons.favorite_border),
                                        //       onPressed: () {},
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset("assets/images/homeimage.png",
                                  height: 160),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 280),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: new IconButton(
                                    icon:
                                    Icon(FontAwesomeIcons.sortAmountUpAlt),
                                    onPressed: () {
                                      setState(() {
                                        fl4.sort((a,b)=>a.rate.compareTo(b.rate));
                                      });

                                    })),
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: new IconButton(
                                    icon: Icon(FontAwesomeIcons.sortAmountUp),
                                    onPressed: () {

                                      setState(() {
                                        fl4.sort((b,a)=>a.rate.compareTo(b.rate));
                                      });
                                    })),
                            !searchFlag
                                ? Expanded(
                              child: new Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(15)),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {

                                      searchFlag = true;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: "Search..",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                                : Expanded(
                              child: new Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(15)),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      // fl4=l4.where((obj)=>obj.addname.toLowerCase().contains(value.toLowerCase())||obj.username.toLowerCase().contains(value.toLowerCase())||obj.cat.toLowerCase)
                                      searchFlag = true;
                                      fl4=l4.where((obj)=>obj.addname.toLowerCase().contains(value.toLowerCase())||obj.username.toLowerCase().contains(value.toLowerCase())||obj.cat.toLowerCase().contains(value.toLowerCase())).toList();

                                    });
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: "Search..",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            searchFlag
                                ? Padding(
                                padding:
                                EdgeInsets.only(left: 10, right: 10),
                                child: new IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        fl4=List.from(l4);
                                        searchFlag = false;
                                      });
                                    }))
                                : Padding(
                              padding:
                              EdgeInsets.only(left: 10, right: 10),
                            ),
                          ],
                        ),

                        /* I used the below code because ListView.builder is not working with the custom widget
                        AdvHomeCard and is raising a lot of errors. Trying it also will not be useful as it is
                        raising conflicts with the custom widget AdvHomeCard. */
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fl4.length,
                            itemBuilder: (context,index){
                              // return Card(
                              //   child: Column(
                              //     children: [
                              //       Text('adname ${fl4[index].addname} username ${fl4[index].username}'),
                              //       Text('rate given ${fl4[index].rate}'),
                              //       Text('category ${fl4[index].cat}'),
                              //       Column(
                              //         children: [
                              //           RaisedButton(
                              //               child: Text('confirm the ad'),
                              //               onPressed: (){
                              //
                              //                 _apply.child(fl4[index].key).update({
                              //                   'Confirm':'T',
                              //                   'rejected':'F'
                              //                 });
                              //               }),
                              //
                              //           RaisedButton(
                              //               child: Text('reject this ad'),
                              //               onPressed: (){
                              //
                              //                 _apply.child(fl4[index].key).update({
                              //                   'Confirm':'F',
                              //                   'rejected':'T'
                              //
                              //                 });
                              //
                              //               })
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              //
                              // );
                              return AdvHomeCard(

                                line1: fl4[index].addname,
                                line2: fl4[index].username,
                                line3: fl4[index].rate.toString(),
                                line4: fl4[index].cat,
                                press1: (){
                                  _apply.child(fl4[index].key).update({
                                    'Confirm':'T',
                                    'rejected':'F'
                                  });
                                },
                                press2: (){
                                  _apply.child(fl4[index].key).update({
                                    'Confirm':'F',
                                    'rejected':'T'

                                  });
                                },
                              );


                            }),

                        // for (var item in lis)
                        //   AdvHomeCard(
                        //       line1: '${item.cusCompName}\n${item.cusCompCat}',
                        //       line2: '${item.cusUserName}\n${item.price}',
                        //       press: () {}),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdvHomeCard extends StatelessWidget {
  final String line1;
  final String line2;
  final String line3;
  final String line4;

  final Function press1;
  final Function press2;

  const AdvHomeCard({Key key, this.line1, this.line2,this.line3,this.line4,this.press1,this.press2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: 370,
      height: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
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
          // IconButton(
          //     icon: Icon(
          //       Icons.arrow_forward,
          //       size: 26,
          //     ),
          //     onPressed: press),

          /*above code is from cushome, so commented it */

          TextButton(
              child: Text('ACCEPT'),
              onPressed: press1,
              style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.green))),
          TextButton(
              child: Text('REJECT'),
              onPressed: press2,
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
