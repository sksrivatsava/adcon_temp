import 'package:adcon/advhome.dart';
import 'package:adcon/cushome.dart';
import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adcon/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home:MyApp()
  ));
}

class MyApp extends StatefulWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Firebase.initializeApp();

  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
  var log;
  var z;
  Future isUserLoggedIn() async {
    var user = await _auth.currentUser;

    //print(user);
    setState(() {
      log=user;
    });
  }
  @override
  Widget build(BuildContext context) {
    isUserLoggedIn();

    if(log!=null){
      var x=log.email;
      var y=getUser(x);

      _dref.orderByChild('email').equalTo(x).once().then((res){
        // print(res.value[y]['type']);
        setState(() {
          z=res.value[y]['type'];
        });


      });
      if(z=='adv'){
        return AdvHome();
      }
      else{
        return CusHome();
      }

    }
    else{
      return LoginPage();
    }




  }
}