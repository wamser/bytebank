import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'database/dao/contact_dao.dart';
import 'models/contact.dart';

void main() {
  runApp(BytebankApp());

  /*final Contact newContact = Contact(1,'Tamiris Forster',52);
  final ContactDao _contactDao = ContactDao();
  _contactDao.edit(newContact);

   */

}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent[700]),
      ),
      home:Dashboard(),
    );
  }
}


