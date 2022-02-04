import 'package:bytebank/controller/contact_store.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {


  final ContactDao db = ContactDao.instance;

  @observable
  int newContactId = 0;

  @action
  void setNewContactId(int value) => newContactId = value;

  @observable
  String newContactName = "";

  @action
  void setNewContactName(String value) => newContactName = value;

  @observable
  int newAccountNumber = 0;

  @action
  void setNewAccountNumber(int value) => newAccountNumber = value;

  ObservableList<ContactStore> contactList = ObservableList<ContactStore>();

  @action
  Future<void> getList() async {
    final allNotes = await db.findAll();
    contactList.addAll(allNotes.reversed);
  }

  @action
  Future<void> addContact() async{
    contactList.insert(0, ContactStore(Contact(newContactId, newContactName, newAccountNumber)));
    newContactId=0;
    newContactName="";
    newAccountNumber=0;
  }
  @action
  Future<void> delContact() async{
    await db.delete(Contact(newContactId,newContactName, newAccountNumber ));
    contactList.removeWhere((item) => item.contact.id == newContactId);

    newContactName="";
    newAccountNumber=0;
  }

}
