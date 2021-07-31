import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'advertiserconfirmedads.dart';
import 'advertisercontent.dart';
import 'constants.dart';

String getAdvName() {
  /*define function here using Firebase or anything necessary
  to get the name of the user*/

  //CUSNAV01
  return 'adv_001';
}

class AdvNavDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final FirebaseAuth _auth= FirebaseAuth.instance;
  var user;
  AdvNavDrawer(this.user);
  @override
  Widget build(BuildContext context) {
    final name = user;
    final type = 'Advertiser';
    final urlImage =
        'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';

    return Drawer(
      child: Material(
        color: kNavBarColor,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              type: type,
              // onClicked: () => Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => MyApp()),
              // ),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Your Confirmed ads',
                    icon: FontAwesomeIcons.clipboardCheck,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Your Content',
                    icon: FontAwesomeIcons.link,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: FontAwesomeIcons.doorOpen,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 80),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: '© Adcons, 2021',
                    icon: Icons.copyright_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
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


    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>advertiserconfiremdads()));
        break;
      case 1:

        Navigator.push(context, MaterialPageRoute(builder: (context)=>advertisercontent()));
        break;
      case 2:
        try {
                  _auth.signOut();
                } on Exception catch (e) {
                  // TODO
                }
        break;
    }
  }
}