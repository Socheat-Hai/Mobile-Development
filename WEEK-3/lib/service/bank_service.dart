import '../model/bank_account.dart';

class BankService {
  final List<BankAccount> _accounts = [];

  List<BankAccount> get account => List.unmodifiable(_accounts);

  BankAccount createAccount(int accountId) {
    BankAccount? existingAccount = _findByAccountId(accountId);
    if (existingAccount != null) {
      throw Exception('This account already exist.');
    }

    var newAccount = BankAccount(accountId: accountId);
    _accounts.add(newAccount);

    return newAccount;
  }
  
  void creditAccount({required accountId, required double amount}) {

    // check the account exist
    BankAccount? account = _findByAccountId(accountId);
    if (account == null){
      throw Exception("This account alreay exist");
    }

    // if so, credit the account
    account.balance = amount;


  }

  BankAccount? _findByAccountId(int accountId) {
    return _accounts.where((a) => a.accountId == accountId).firstOrNull;
  }
}
