import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:mobx/mobx.dart';

part 'contact_store.g.dart';

class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {

  Contact contact;


  _ContactStoreBase(this.contact);

  final ContactDao db = ContactDao.instance;

  @observable
  String ContactName = "";

  @observable
  int AccountNumber = 0;

  @action
  Future<void> updateContact(String name , int account) async {
    contact.name=name;
    contact.accountNumber=account;
  }
}
