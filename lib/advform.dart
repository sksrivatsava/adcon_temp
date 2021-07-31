// import 'package:adcon/userservice.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// class advform extends StatefulWidget {
//   final String cat;
//   advform(this.cat);
//   @override
//   _advformState createState() => _advformState();
// }
//
// class _advformState extends State<advform> {
//
//   final _formKey = GlobalKey<FormState>();
//   String adtype="";
//   List<dynamic> apply;
//   List<dynamic> recieve;
//
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   final _dref=FirebaseDatabase.instance.reference().child('CustomUser');
//   final _adref=FirebaseDatabase.instance.reference().child('ads');
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('your category ${widget.cat}'),
//       ),
//       body:Container(
//
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(height: 20.0,),
//                 TextFormField(
//                   validator: (val) => val.isEmpty ? 'Enter an adname' : null,
//                   onChanged: (val) {
//                     setState(() => adtype = val);
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'enter the adname',
//                   ),
//                 ),
//                 RaisedButton(
//                     color: Colors.pink[400],
//                     child: Text(
//                       'Submit',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () async{
//                       if(_formKey.currentState.validate()){
//                         try {
//                           dynamic result =await _auth.currentUser;
//                           var uid=getUser(result.email);
//
//                           _adref.push().set({
//
//                             'uid':uid,
//                             'aid':adtype,
//                             'apply':[],
//                             'receive':[],
//                             'link':'',
//                             'cat':widget.cat
//
//                           });
//                         } on Exception catch (e) {
//                           print(e);
//                         }
//                         Navigator.pop(context,"back");
//
//
//                       }
//
//
//                     })
//               ],
//             )
//         ),
//
//       )
//     );
//   }
// }
import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'constants.dart';



class DescriptionPage extends StatefulWidget {
  final String cat;
  DescriptionPage(this.cat);
  @override
  DescriptionPageState createState() => new DescriptionPageState();
}

class DescriptionPageState extends State<DescriptionPage> {
  String adtype="";
  List<dynamic> apply;
  List<dynamic> recieve;

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref=FirebaseDatabase.instance.reference().child('CustomUser');
  final _adref=FirebaseDatabase.instance.reference().child('ads');
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: kCategoryPageColor,
            onPressed: () async{
              if(adtype!=""){
                try {
                  dynamic result =await _auth.currentUser;
                  var uid=getUser(result.email);

                  _adref.push().set({

                    'uid':uid,
                    'aid':adtype,
                    'apply':[],
                    'receive':[],
                    'link':'',
                    'cat':widget.cat

                  });
                } on Exception catch (e) {
                  print(e);
                }
                Navigator.pop(context,"back");
              }
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
                        "Enter the name of the product/service you'd like to advertise.",
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
                        adtype=value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your product's name here",
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