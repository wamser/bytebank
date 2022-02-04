// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactStore on _ContactStoreBase, Store {
  final _$ContactNameAtom = Atom(name: '_ContactStoreBase.ContactName');

  @override
  String get ContactName {
    _$ContactNameAtom.reportRead();
    return super.ContactName;
  }

  @override
  set ContactName(String value) {
    _$ContactNameAtom.reportWrite(value, super.ContactName, () {
      super.ContactName = value;
    });
  }

  final _$AccountNumberAtom = Atom(name: '_ContactStoreBase.AccountNumber');

  @override
  int get AccountNumber {
    _$AccountNumberAtom.reportRead();
    return super.AccountNumber;
  }

  @override
  set AccountNumber(int value) {
    _$AccountNumberAtom.reportWrite(value, super.AccountNumber, () {
      super.AccountNumber = value;
    });
  }

  final _$updateContactAsyncAction =
      AsyncAction('_ContactStoreBase.updateContact');

  @override
  Future<void> updateContact(String name, int account) {
    return _$updateContactAsyncAction
        .run(() => super.updateContact(name, account));
  }

  @override
  String toString() {
    return '''
ContactName: ${ContactName},
AccountNumber: ${AccountNumber}
    ''';
  }
}
