import 'package:adcon/advform1.dart';
import 'package:adcon/cusadservice.dart';
import 'package:adcon/useradd.dart';
import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adcon/advform.dart';

import 'cusnavbar.dart';
import 'loading.dart';

import 'constants.dart';
// import 'main_cus_navbar.dart';
// import 'data_cushome.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';



class CusHome extends StatefulWidget {
  @override
  CusHomeState createState() => CusHomeState();
}

class CusHomeState extends State<CusHome> {
  @override
  var searchFlag = false;
  final  _initialization = Firebase.app();
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
  final _adref=FirebaseDatabase.instance.reference().child('ads');
  var user="null";
  List<adv> ads = [];
  List<adv> fads=[];
  @override
  void initState() {
    super.initState();
    dynamic result=  _auth.currentUser;
    var x=getUser(result.email);
    _dref.child(x).child('Username').once().then((value) {
      setState(() {
        user=value.value;
      });
    });
    var _aaref=_adref.orderByChild('uid').equalTo(x);
    _aaref.onChildAdded.listen(_adslist);
    _adref.onChildRemoved.listen(_adsremove);

  }
  _adslist(Event event){
    setState(() {
      ads.add(adv.fromSnapshot(event.snapshot));
      fads.add(adv.fromSnapshot(event.snapshot));

    });
  }
  _adsremove(Event event){
    setState(() {
      ads.removeWhere((element) => element.key==event.snapshot.key);
    });

  }
  //MAINCUSHOME01
  // List<CusHomeList> lis = []; //MAINCUSHOME10
  final urlImage =
      'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';

  final padding = EdgeInsets.symmetric(horizontal: 20);

  Widget build(BuildContext c) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: Material(
            color: kNavBarColor1,
            child: ListView(
              children: <Widget>[
                buildHeader(
                  urlImage: urlImage,
                  name: user,
                  type: "Customer",
                  // onClicked: () => Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => MyApp()),
                  // ),
                ),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      //CUSNAV02

                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: 'Logout',
                        icon: FontAwesomeIcons.doorOpen,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      const SizedBox(height: 45),
                      Divider(color: Colors.white70),
                      const SizedBox(height: 12),
                      buildMenuItem(
                        text: '© Adcons, 2021',
                        icon: Icons.copyright_outlined,
                        onClicked: () => selectedItem(context, 1),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          //MAINCUSHOME02
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage()));
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
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
                          image: AssetImage("assets/images/bg-cus.png"),
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
                                      //MAINCUSHOME03
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
                                                  "Check out the ads you've applied for, below.",
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

                            //MAINCUSHOME05
                            !searchFlag
                                ? Expanded(
                              child: new Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(15)),
                                child: GestureDetector(
                                  child: Text('🔍 Search..',style: TextStyle(

                                    color: Colors.grey,
                                    fontSize: 20
                                  ),),
                                  onTap: (){
                                    print("true");
                                    setState(() {
                                      searchFlag=true;
                                    });
                                  },
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
                                      fads=ads.where((obj)=>obj.aid.toLowerCase().contains(value.toLowerCase())||obj.cat.toLowerCase().contains(value.toLowerCase())).toList();
                                      searchFlag = true;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: "🔍 Search..",
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
                                        fads=List.from(ads);
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
                        CusHomeCard and is raising a lot of errors. Trying it also will not be useful as it is
                        raising conflicts with the custom widget CusHomeCard. */

                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fads.length,
                            itemBuilder: (context,index){
                              return CusHomeCard(

                                  line1: fads[index].aid,
                                  line2: fads[index].cat,
                                  press:(){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>cusadservice(fads[index])));
                                  }
                              );
                            }),
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

  Widget buildHeader({
    String urlImage,
    String name,
    String type,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    type,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
            fontSize: 14,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    // Navigator.of(context).pop();

    switch (index) {
      case 0:
        try {
          _auth.signOut();
        } on Exception catch (e) {
          // TODO
        }
        break;
      case 1:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => MyApp(),
      // ));
        break;
    }
  }
}


class CusHomeCard extends StatelessWidget {
  final String line1;
  final String line2;

  final Function press;

  const CusHomeCard({Key key, this.line1, this.line2, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: 370,
      height: 80,
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
              ],
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 26,
              ),
              onPressed: press),

          /*below code is from advhome, so commented it */

          // TextButton(
          //     child: Text('ACCEPT'),
          //     onPressed: () {},
          //     style: TextButton.styleFrom(
          //         textStyle: TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //             decorationColor: Colors.green))),
          // TextButton(
          //     child: Text('REJECT'),
          //     onPressed: () {},
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
// class cushome extends StatefulWidget {
//   @override
//   _cushomeState createState() => _cushomeState();
// }
//
// class _cushomeState extends State<cushome> {
//   final  _initialization = Firebase.app();
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
//   final _adref=FirebaseDatabase.instance.reference().child('ads');
//
//   List<adv> ads = [];
//   List<adv> fads=[];
//   var issearch=false;
//   @override
//   void initState() {
//     super.initState();
//     dynamic result=  _auth.currentUser;
//     var x=getUser(result.email);
//     var _aaref=_adref.orderByChild('uid').equalTo(x);
//     _aaref.onChildAdded.listen(_adslist);
//     _adref.onChildRemoved.listen(_adsremove);
//
//   }
//   _adslist(Event event){
//     setState(() {
//       ads.add(adv.fromSnapshot(event.snapshot));
//       fads.add(adv.fromSnapshot(event.snapshot));
//     });
//   }
//   _adsremove(Event event){
//      setState(() {
//        ads.removeWhere((element) => element.key==event.snapshot.key);
//      });
//
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('cusHome'),
//         actions: [
//               RaisedButton(
//                   child: Text('signout'),
//                   onPressed: (){
//                 try {
//                   _auth.signOut();
//                 } on Exception catch (e) {
//                   // TODO
//                 }
//               }),
//         ],
//
//
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             ListView(
//               shrinkWrap: true,
//               children: [
//                 ListTile(
//                   title: Text('Home'),
//                 ),
//                 ListTile(
//                   title: Text('Settings'),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//       body:  SingleChildScrollView(
//         child: Column(
//           children: [
//             new Row(
//               children: [
//                 !issearch?Text('all ads '):new Expanded(
//                   child: new TextField(
//                     onChanged: (value){
//                       setState(() {
//
//                         fads=ads.where((obj)=>obj.aid.toLowerCase().contains(value.toLowerCase())||obj.cat.toLowerCase().contains(value.toLowerCase())).toList();
//                       });
//                     },
//                     style: TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                     icon: Icon(
//                     Icons.search,
//                     color: Colors.black,
//                   ),
//                   hintText: "Search ads Here",
//                   hintStyle: TextStyle(color: Colors.black)),
//
//
//
//                   ),
//                 ),
//
//                 issearch?IconButton(icon: Icon(Icons.cancel), onPressed: (){
//
//                   setState(() {
//
//                     issearch=false;
//                     fads=List.from(ads);
//                   });
//                 }):IconButton(icon: Icon(Icons.search), onPressed: (){
//
//                   setState(() {
//
//                     issearch=true;
//                   });
//                 }),
//               ],
//             ),
//
//
//
//             ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: fads.length,
//                 itemBuilder: (context,index){
//                   return new ListTile(
//                     title: new Text('adname : ${fads[index].aid}  cat:${fads[index].cat}'),
//                     onTap: (){
//                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>cusadservice(fads[index])));
//                     },
//                     onLongPress: (){
//                       _adref.child(ads[index].key).remove();
//                     },
//                   );
//                 }),
//           ],
//         ),
//       ),
//
//       floatingActionButton:new FloatingActionButton(
//         onPressed:(){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> advfrom1()));
//
//         },
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ),
//     );
//   }
// }
//

