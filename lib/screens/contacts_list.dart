import 'package:bytebank/controller/list_store.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  ListStore _listStore = ListStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Observer(
          builder: (_) => ListView.separated(
                itemCount: _listStore.contactList.length,
                itemBuilder: (_, index) {
                  var contact = _listStore.contactList[index];
                  return Observer(
                    builder: (_) {
                      return Card(
                        child: ListTile(
                          title: Observer(
                            builder: (_) {
                              return Text(contact.contact.name);
                            },
                          ),
                          subtitle:
                              Text(contact.contact.accountNumber.toString(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  )),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    final result =
                                        await Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => ContactForm(
                                              contact.contact.accountNumber,
                                              contact.contact.name,
                                              contact.contact.id,
                                              true)),
                                    );

                                    if (result != null) {
                                      _listStore.contactList.clear();
                                      _listStore.getList();
                                    }
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    _listStore.newAccountNumber =
                                        contact.contact.accountNumber;
                                    _listStore.newContactName =
                                        contact.contact.name;
                                    _listStore.newContactId =
                                        contact.contact.id;
                                    _listStore.delContact();
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
              )),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ContactForm(0, "", 0, false)),
            );

            if (result == null) {
              print('vazio');
            } else {
              _listStore.newAccountNumber = result.accountNumber;
              _listStore.newContactName = result.name;
              _listStore.newContactId = result.id;
              _listStore.addContact();
            }
          },
          backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
          child: Icon(
            Icons.add,
          )),
    );
  }

  @override
  void initState() {
    _listStore.getList();
  }
}
