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

  BankAccount? _findByAccountId(int accountId) {
    return _accounts.where((a) => a.accountId == accountId).firstOrNull;
  }
}
