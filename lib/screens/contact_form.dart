import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  ContactForm(this.accountNumber, this.name, this.id, this.edit);

  final int accountNumber;
  final String name;
  final int id;
  final bool edit;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _contactDao = ContactDao.instance;

  @override
  Widget build(BuildContext context) {
    if (widget.edit) {
      _nameController.text = widget.name;
      _accountNumberController.text = widget.accountNumber.toString();
    }
    return Scaffold(
      appBar: AppBar(
          title: widget.edit ? Text('Edit Contact') : Text('New Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full name'),
                  style: TextStyle(
                    fontSize: 24.0,
                  )),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(labelText: 'Account number'),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    if (widget.edit) {
                      final String name = _nameController.text;
                      final int? accountNumber =
                          int.tryParse(_accountNumberController.text);

                      final Contact newContact =
                          Contact(widget.id, name, accountNumber!);

                      _contactDao
                          .edit(newContact)
                          .then((id) => Navigator.pop(context, newContact));
                    } else {
                      final String name = _nameController.text;
                      final int? accountNumber =
                          int.tryParse(_accountNumberController.text);

                      final Contact newContact =
                          Contact(0, name, accountNumber!);
                      _contactDao.save(newContact).then((id) => Navigator.pop(
                          context, Contact(id, name, accountNumber)));
                    }
                  },
                  color:Theme.of(context).buttonTheme.colorScheme?.primary,
                  child: widget.edit ? Text('Update') : Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
