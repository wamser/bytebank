// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  final _$newContactIdAtom = Atom(name: '_ListStore.newContactId');

  @override
  int get newContactId {
    _$newContactIdAtom.reportRead();
    return super.newContactId;
  }

  @override
  set newContactId(int value) {
    _$newContactIdAtom.reportWrite(value, super.newContactId, () {
      super.newContactId = value;
    });
  }

  final _$newContactNameAtom = Atom(name: '_ListStore.newContactName');

  @override
  String get newContactName {
    _$newContactNameAtom.reportRead();
    return super.newContactName;
  }

  @override
  set newContactName(String value) {
    _$newContactNameAtom.reportWrite(value, super.newContactName, () {
      super.newContactName = value;
    });
  }

  final _$newAccountNumberAtom = Atom(name: '_ListStore.newAccountNumber');

  @override
  int get newAccountNumber {
    _$newAccountNumberAtom.reportRead();
    return super.newAccountNumber;
  }

  @override
  set newAccountNumber(int value) {
    _$newAccountNumberAtom.reportWrite(value, super.newAccountNumber, () {
      super.newAccountNumber = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_ListStore.getList');

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$addContactAsyncAction = AsyncAction('_ListStore.addContact');

  @override
  Future<void> addContact() {
    return _$addContactAsyncAction.run(() => super.addContact());
  }

  final _$delContactAsyncAction = AsyncAction('_ListStore.delContact');

  @override
  Future<void> delContact() {
    return _$delContactAsyncAction.run(() => super.delContact());
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewContactId(int value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewContactId');
    try {
      return super.setNewContactId(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewContactName(String value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewContactName');
    try {
      return super.setNewContactName(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewAccountNumber(int value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewAccountNumber');
    try {
      return super.setNewAccountNumber(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newContactId: ${newContactId},
newContactName: ${newContactName},
newAccountNumber: ${newAccountNumber}
    ''';
  }
}
