class BankAccount {
  final int accountId;
  double balance;

  new({required this.accountId, this.balance = 0});

  // BankAccount withBalance ({required double newBalance}) {
  //   return BankAccount(accountId: accountId, balance: newBalance);
  // }

}