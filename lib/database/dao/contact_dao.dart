import 'package:bytebank/controller/contact_store.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName ( '
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ' //PRIMARY KEY AUTOINCREMENT NOT NULL
      '$_name TEXT, '
      '$_accountNumber INTEGER )';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';



  ContactDao._privateConstructor();
  static final ContactDao instance = ContactDao._privateConstructor();

  Future<int> save(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<int> delete(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.delete(
      _tableName,
      where:'$_id = ? ',
      whereArgs: [contact.id],
    );
  }

  Future<int> edit(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _tableName,
      contactMap,
      where:'$_id = ? ',
      whereArgs: [contact.id],
    );
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<ContactStore>> findAll() async {
    final Database db = await getDataBase();

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    List<ContactStore> contactList = [];
    for (Map m in maps) {
      ContactStore contact = ContactStore(Contact.fromMap(m));
      contactList.add(contact);
    }

    return contactList;
  }

  Future<List<Contact>> findUnique( String id) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.rawQuery("SELECT $_id,$_name,$_accountNumber FROM $_tableName WHERE $_id =?",[id]);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
