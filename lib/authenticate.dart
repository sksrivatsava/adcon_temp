import 'package:adcon/forgetpass.dart';
import 'package:adcon/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:adcon/userservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// class Authentication extends StatefulWidget {
//
//
//
//   @override
//   _AuthenticationState createState() => _AuthenticationState();
// }
//
// class _AuthenticationState extends State<Authentication> {
//   _AuthenticationState({this.app});
//   final FirebaseApp app;
//
//   var log=true;
//   var load=false;
//   var loadr=false;
//   final _formKey = GlobalKey<FormState>();
//   String email="";
//   String password="";
//   String type="cus";
//   String username="";
//   String error="";
//   String category="tv";
//   String rate1="";
//   String rate2="";
//   String rate3="";
//
//   final FirebaseAuth _auth= FirebaseAuth.instance;
//   final _dref=FirebaseDatabase.instance.reference().child('CustomUser');
//   final _advref=FirebaseDatabase.instance.reference().child('advertisers');
//   // final Future<FirebaseApp> _future = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:Text('Authentication'),
//           actions: <Widget>[
//
//             RaisedButton(
//                 child: Text( log?'register':'signin'),
//                 onPressed: (){
//                   setState(() {
//                     log=!log;
//                   });
//
//
//                 }),
//
//             // label:Text('')
//
//           ],
//
//
//         ),
//         body:log?signin():register()
//     );
//   }
//
//   Widget signin(){
//     return load?loading():SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child:Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 20.0),
//               TextFormField(
//                 validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                 onChanged: (val) {
//                   setState(() => email = val);
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'enter the email',
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 obscureText: true,
//                 validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                 onChanged: (val) {
//                   setState(() => password = val);
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'enter the password',
//                 ),
//               ),
//               TextButton(
//                 child: Text('Forget Password'),
//
//                 onPressed: (){
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetpass()));
//                 },),
//               SizedBox(height: 20.0),
//               RaisedButton(
//                   color: Colors.pink[400],
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     if(_formKey.currentState.validate()){
//                       setState(() {
//                         load=true;
//                       });
//                       try{
//
//                         dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//                         // if(result == null) {
//                         //   setState(() {
//                         //     error = 'Could not sign in with those credentials';
//                         //   });
//                         // }
//                         print(result.user.email);
//                         //  _dref.once('value',).then((result)=>print(result.val().type));
//                         Map<dynamic,dynamic> values;
//                         String u="";
//                         _dref.orderByChild('email').equalTo(result.user.email).once().then((res){
//                           print(res.value[getUser(result.user.email)]['type']);
//
//                         });
//
//                       }
//                       catch(err){
//                         setState(() {
//                           error=err.toString();
//                           load=false;
//                         });
//                       }
//                     }
//                   }
//               ),
//               SizedBox(height: 12.0),
//               Text(
//                 error,
//                 style: TextStyle(color: Colors.red, fontSize: 14.0),
//               ),
//
//
//             ],
//
//           ),
//
//
//         ),
//       ),
//     );
//   }
//
//   Widget register(){
//     return loadr?loading():SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(
//             key:_formKey,
//             child: Column(
//               children: <Widget>[
//                 // SizedBox(height: 20.0),
//                 TextFormField(
//                   validator: (val) => val.isEmpty ? 'Enter an Username' : null,
//                   onChanged: (val) {
//                     setState(() => username = val);
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'enter the Username',
//                   ),
//                 ),
//                 // SizedBox(height: 20.0),
//                 TextFormField(
//                   validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                   onChanged: (val) {
//                     setState(() => email = val);
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'enter the email',
//                   ),
//                 ),
//                 // SizedBox(height: 20.0),
//                 TextFormField(
//                   obscureText: true,
//                   validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                   onChanged: (val) {
//                     setState(() => password = val);
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'enter passwordd',
//                   ),
//                 ),
//                 // SizedBox(height: 20.0),
//           DropdownButton<String>(
//              value: type,
//             icon: const Icon(Icons.arrow_downward),
//             iconSize: 24,
//             elevation: 16,
//             style: const TextStyle(color: Colors.deepPurple),
//             underline: Container(
//               height: 2,
//               color: Colors.deepPurpleAccent,
//             ),
//             onChanged: (String newValue) {
//               setState(() {
//                type= newValue;
//               });
//             },
//             items: <String>['cus','adv']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//                 // SizedBox(height: 20.0),
//                type=='adv'?  (catad()):SizedBox(),
//                 type=="adv" && category=="tv"?tvad():((type=="adv")?remad():SizedBox()),
//                 RaisedButton(
//                     color: Colors.pink[400],
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () async {
//                       if(_formKey.currentState.validate()){
//                         setState(() {
//                           loadr=true;
//                         });
//                         try{
//                           dynamic result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//                           // if(result == null) {
//                           //   setState(() {
//                           //     error = 'Could not sign in with those credentials';
//                           //   });
//                           // }
//                           var x=getUser(email);
//                           var _ddref=_dref.child(x);
//                           _ddref.set({
//                             'Username':username,
//                             'email':email,
//                             'password':password,
//                             'type':type
//                           });
//                           if(type=='adv'){
//                            if(category=='tv'){
//                              var _aa=_advref.child(x);
//                              _aa.set({
//                                'username':username,
//                                'email':email,
//                                'type':type,
//                                'cat':category,
//                                'rate':[int.parse(rate1),int.parse(rate2),int.parse(rate3)]
//                              });
//                            }
//                            else{
//                              print('advgdyuk');
//                              var _aa=_advref.child(x);
//                              _aa.set({
//                                'username':username,
//                                'email':email,
//                                'type':type,
//                                'cat':category,
//                                'rate':int.parse(rate1)
//                              });
//                            }
//                           }
//                         }
//                         catch(err){
//                           setState(() {
//                             error=err.toString();
//                             loadr=false;
//
//                           });
//                         }
//                       }
//                     }
//                 ),
//                 SizedBox(height: 12.0),
//                 Text(
//                   error,
//                   style: TextStyle(color: Colors.red, fontSize: 14.0),
//                 ),
//
//               ],
//
//             )),
//
//       ),
//     );
//   }
//
//   Widget catad(){
//     return DropdownButton<String>(
//       value: category,
//       icon: const Icon(Icons.arrow_downward),
//       iconSize: 24,
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String newValue) {
//         setState(() {
//           category= newValue;
//         });
//       },
//       items: <String>['tv','instagram','youtube','news']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//
//
//   }
//   Widget tvad(){
//     return Column(
//       children: [
//         TextFormField(
//           // obscureText: true,
//           validator: (val) => val.isEmpty  ? 'Enter a price for high trp' : null,
//           onChanged: (val) {
//             setState(() => rate1 = val);
//           },
//           decoration: const InputDecoration(
//             labelText: 'enter a price for high trp',
//           ),
//         ),
//         TextFormField(
//           // obscureText: true,
//           validator: (val) => val.isEmpty  ? 'Enter a price for medium trp' : null,
//           onChanged: (val) {
//             setState(() => rate2 = val);
//           },
//           decoration: const InputDecoration(
//             labelText: 'enter a price for medium trp',
//           ),
//         ),
//         TextFormField(
//           // obscureText: true,
//           validator: (val) => val.isEmpty? 'Enter a price for low trp' : null,
//           onChanged: (val) {
//             setState(() => rate3 = val);
//           },
//           decoration: const InputDecoration(
//             labelText: 'enter a price for low trp',
//           ),
//         ),
//       ],
//     );
//   }
//   Widget remad(){
//     return TextFormField(
//       obscureText: true,
//       validator: (val) => val.isEmpty ? 'Enter a price ' : null,
//       onChanged: (val) {
//         setState(() => rate1 = val);
//       },
//       decoration: const InputDecoration(
//         labelText: 'enter a price',
//       ),
//     );
//   }
//
//
// }

// orderByChild('email').equalTo(result.user.email)
// then((DataSnapshot datas) => print(datas.value));

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'loading.dart';



class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var isLogin = true;

  var userTypeSelected = false;
  var advertiserSelected = false;
  String userType = "null";

  var advButtonColor = Colors.black;
  var cusButtonColor = Colors.black;

  String type = "cus";
  String error = "";
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String username = "";
  var loadr = false;
  String category = "tv";
  String rate1 = "";
  String rate2 = "";
  String rate3 = "";
  var load=false;
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref=FirebaseDatabase.instance.reference().child('CustomUser');
  final _advref=FirebaseDatabase.instance.reference().child('advertisers');

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: isLogin
            ? signin()
            : register()
    );
  }

  Widget signin(){

    return load?loading():Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            // Color(0xffBCD1E6),
            // Color(0xFFF3CEBB),
            Color(0xFFA6C3E0),
            Color(0xFFEBB9A0)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                    1,
                    Text(
                      "Login",
                      style:
                      TextStyle(color: Colors.white, fontSize: 40),
                    )),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                    1.3,
                    Text(
                      "Sign in to continue using the services of Adcons.",
                      style:
                      TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                Colors.grey[200]))),
                                    child: TextFormField(
                                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                          "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                Colors.grey[200]))),
                                    child: TextFormField(
                                      obscureText: true,
                                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.5,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetpass()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.6,
                        GestureDetector(
                          onTap: () async{
                            if(_formKey.currentState.validate()){
                              setState(() {
                                load=true;
                              });
                              try{

                                dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                // if(result == null) {
                                //   setState(() {
                                //     error = 'Could not sign in with those credentials';
                                //   });
                                // }
                                print(result.user.email);
                                //  _dref.once('value',).then((result)=>print(result.val().type));
                                Map<dynamic,dynamic> values;
                                String u="";
                                _dref.orderByChild('email').equalTo(result.user.email).once().then((res){
                                  print(res.value[getUser(result.user.email)]['type']);

                                });

                              }
                              catch(err){
                                setState(() {
                                  error=err.toString();
                                  load=false;
                                });
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            margin:
                            EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF5aa4ed)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.7,
                        GestureDetector(
                          onTap: () {
                            print("Tapped the sign up button.");
                            setState(() {
                              error="";
                              isLogin = false;
                            });
                          },
                          child: Text(
                            "New User? Tap to Sign Up.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                            color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget register(){
    return loadr?loading():FadeAnimation(
      1,

      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFFA6C3E0), Color(0xFFEBB9A0)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome to Adcons!",
                        style: TextStyle(
                            color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: RTFBoxDecoration(),
                              child: TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a valid username.'
                                    : null,
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                                decoration: RTFInputDecoration(
                                    'Pick a username.'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: RTFBoxDecoration(),
                              child: TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid e-mail, such as sk@microsoft.com.'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: RTFInputDecoration(
                                      'Enter your e-mail address.')),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: RTFBoxDecoration(),
                              child: TextFormField(
                                obscureText: true,
                                validator: (val) => val.length < 6
                                    ? 'Enter a password 6+ chars long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                decoration: RTFInputDecoration(
                                    'Choose a password.'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                      "Choose a User Category.",
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                SizedBox(width: 10),
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: type,
                                    icon: const Icon(
                                        Icons.arrow_downward),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.grey),
                                    underline: Container(
                                      height: 2,
                                      width: 1,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        type = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'cus',
                                      'adv'
                                    ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            type == 'adv'
                                ? (catad())
                                : SizedBox(),
                            type == "adv" && category == "tv"
                                ? tvad()
                                : ((type == "adv")
                                ? remad()
                                : SizedBox()),
                            SizedBox(height: 20.0),
                            RaisedButton(
                                color: Colors.pink[400],
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async{
                                  if (_formKey.currentState
                                      .validate()) {



                                    setState(() {
                                      loadr = true;
                                    });

                                    try{
                                      dynamic result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                      // if(result == null) {
                                      //   setState(() {
                                      //     error = 'Could not sign in with those credentials';
                                      //   });
                                      // }
                                      var x=getUser(email);
                                      var _ddref=_dref.child(x);
                                      _ddref.set({
                                        'Username':username,
                                        'email':email,
                                        'password':password,
                                        'type':type
                                      });
                                      if(type=='adv'){
                                        if(category=='tv'){
                                          var _aa=_advref.child(x);
                                          _aa.set({
                                            'username':username,
                                            'email':email,
                                            'type':type,
                                            'cat':category,
                                            'rate':[int.parse(rate1),int.parse(rate2),int.parse(rate3)]
                                          });
                                        }
                                        else{
                                          print('advgdyuk');
                                          var _aa=_advref.child(x);
                                          _aa.set({
                                            'username':username,
                                            'email':email,
                                            'type':type,
                                            'cat':category,
                                            'rate':int.parse(rate1)
                                          });
                                        }
                                      }
                                    }
                                    catch(err){
                                      setState(() {
                                        error=err.toString();
                                        loadr=false;

                                      });
                                    }
                                  }
                                }),
                            SizedBox(height: 12.0),
                            FadeAnimation(
                              1.7,
                              GestureDetector(
                                onTap: () {
                                  print("Tapped the sign up button.");
                                  setState(() {
                                    error="";
                                    isLogin = true;
                                  });
                                },
                                child: Text(
                                  "Existing User? Tap to Sign in.",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                  color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        )),
                  ),
                ), //container bracket HERE
              ),
            ), //container' bracket is now here
          ],
        ),
      ), //this is the container's bracket
    );
  }

  Widget catad() {
    return FadeAnimation(
      0.8,
      Row(
        children: <Widget>[
          Expanded(
              child: Text(
                "Choose your medium of advertising.",
                style: TextStyle(color: Colors.grey),
              )),
          Expanded(
            child: DropdownButton<String>(
              value: category,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  category = newValue;
                });
              },
              items: <String>['tv', 'instagram', 'youTube', 'news']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget tvad() {
    return FadeAnimation(
      1.5,
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: RTFBoxDecoration(),
            child: TextFormField(
              // obscureText: true,
                validator: (val) => val.isEmpty
                    ? 'Please enter a valid value for price.'
                    : null,
                onChanged: (val) {
                  setState(() => rate1 = val);
                },
                decoration: RTFInputDecoration('High TRP Pricing')),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: RTFBoxDecoration(),
            child: TextFormField(
              // obscureText: true,
                validator: (val) => val.isEmpty
                    ? 'Please enter a valid value for price.'
                    : null,
                onChanged: (val) {
                  setState(() => rate2 = val);
                },
                decoration: RTFInputDecoration('Medium TRP Pricing')),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: RTFBoxDecoration(),
            child: TextFormField(
              // obscureText: true,
                validator: (val) => val.isEmpty
                    ? 'Please enter a valid value for price.'
                    : null,
                onChanged: (val) {
                  setState(() => rate3 = val);
                },
                decoration: RTFInputDecoration('Low TRP Pricing')),
          ),
        ],
      ),
    );
  }

  Widget remad() {
    return FadeAnimation(
      0.8,
      Container(
        padding: EdgeInsets.all(10),
        decoration: RTFBoxDecoration(),
        child: TextFormField(
            obscureText: true,
            validator: (val) =>
            val.isEmpty ? 'Please enter a valid value for price.' : null,
            onChanged: (val) {
              setState(() => rate1 = val);
            },
            decoration: RTFInputDecoration('Enter your base price.')),
      ),
    );
  }

  InputDecoration RTFInputDecoration(String inhint) {
    return InputDecoration(
        hintText: inhint,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none);
  }

  BoxDecoration RTFBoxDecoration() {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200])));
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}