class Contact {
   int id =0;
   String name='';
    int accountNumber=0;

  Contact(this.id, this.name, this.accountNumber);

   void setContactName(String value) => this.name = value;

   void setAccountNumber(int value) => this.accountNumber = value;

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }

   Contact.fromMap(Map map) {
     id = map['id'];
     name = map['name'];
     accountNumber = map['account_number'];
   }
}
