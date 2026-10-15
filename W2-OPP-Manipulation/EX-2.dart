class BankAccount {
  final int _accountId;
  final String _owner;
  double _balance = 0;

  BankAccount(this._accountId, this._owner);

  int get id => _accountId;
  String get owner => _owner;

  double balance() {
    return _balance;
  }

  void credit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance - amount < 0) {          
      throw Exception('Balance is not enough');        
    }
    _balance -= amount;
  }
}

class Bank {
  final String _name;
  final List<BankAccount> _bankAcc = [];

  Bank({required String name}) : _name = name;

  String get name => _name;

  BankAccount createAccount(int accountId, String accountOwner) {
    bool exists = _bankAcc.any((a) => a._accountId == accountId);

    if (exists){
      throw Exception('This account was already exist.');
    }
    
    var account = BankAccount(accountId, accountOwner);
    _bankAcc.add(account);
    return account;
  }
}

void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
