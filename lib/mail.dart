import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

mailmail(String n, String cat, int rate,String email,String adname) async {
  // String username = 'sksrivatsava@gmail.com';
  // String password = '';
  // print(email);
  // final smtpServer = gmail(username, password);
  // final equivalentMessage = Message()
  //   ..from = Address(username, 'appmail-redpositive')
  //   ..recipients.add(Address(email))
  // //..ccRecipients.addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
  // //..bccRecipients.add('bccAddress@example.com')
  //   ..subject = 'Advertisement Request  - ${DateTime.now()}'
  // //..text = 'This is the plain text.\nThis is line 2 of the text part.'
  //   ..html = "<h1 align='center'>Ads Details Request</h1>\n\n<table border='1px solid black'><tr><td><b>Name</b></td><td>$n</td></tr><tr><td><b>adname</b></td><td>$adname</td></tr><tr><td><b>rate</b></td><td>$rate</td></tr><tr><td><b>cat</b></td><td>$cat</td></tr></table>";
  //
  // final sendReport2 = await send(equivalentMessage, smtpServer);
  // var connection = PersistentConnection(smtpServer);
  // await connection.close();

}