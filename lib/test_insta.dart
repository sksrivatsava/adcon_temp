import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter/material.dart';


Map InstaDetails = {};

void extractInstaDetail() async {
  FlutterInsta flutterInsta = FlutterInsta();
  await flutterInsta.getProfileData('npranav_2000');

  InstaDetails['username'] = flutterInsta.username;
  InstaDetails['followers'] = flutterInsta.username;
  InstaDetails['following'] = flutterInsta.following;
  InstaDetails['bio'] = flutterInsta.bio;
  InstaDetails['profileimage'] = flutterInsta.imgurl;

  print(InstaDetails['bio']);


}

void main() {
  runApp(MaterialApp(home: Nice()));
}

class Nice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(onTap: () {extractInstaDetail();}, child: Text("click here",style:TextStyle(fontSize:40))));
  }
}
