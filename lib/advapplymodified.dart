import 'package:flutter/material.dart';
import 'constants.dart';



class ApplyPage extends StatelessWidget {
  final flag;
  Function press;

  //flag = 1 apply again
  //flag = 2 confirmed
  //flag = 3 applied
  //flag = 4 apply

  ApplyPage(this.flag, this.press);

  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: kCategoryPageColor,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () => {Navigator.pop(c)}),
        /*change the above function definition for the BACK functionality*/
      ),
      body: Container(
        child: flag==1? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ApplyTop("Your previous application with this advertiser has been rejected. Would you like to apply again?"),
            SizedBox(height: 20),
            ApplyButton("Apply Again",press),
          ],
        ):flag==2? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ApplyTop("Hurray! Your application has been confirmed!\nPlease visit the Confirmed Applications Tab to submit your ad's draft link."),
            SizedBox(height: 20),

          ],
        ):flag==3? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ApplyTop("You have already applied to this advertiser!"),
            SizedBox(height: 20),

          ],
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ApplyTop("Would you like to apply to this advertiser?"),
            SizedBox(height: 20),
            ApplyButton("Submit Application",press),
          ],
        )
      ),
    ));
  }
}

class ApplyTop extends StatelessWidget {
  String ApplyString = "null";

  ApplyTop(String ApplyString) {
    this.ApplyString = ApplyString;
  }

  Widget build(BuildContext c) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kCategoryPageColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ApplyString,
            style: TextStyle(color: Colors.black87, fontSize: 25),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class ApplyButton extends StatelessWidget {
  final ButtonString;
  Function press;

  ApplyButton(this.ButtonString, this.press);

  Widget build(BuildContext c) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 243, 243, 1),
          borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Color(0xFF5aa4ed)),
          child: Center(
            child: Text(
              ButtonString,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
