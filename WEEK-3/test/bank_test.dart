import '../lib/service/bank_service.dart';

void main() {
  // Create a service
  BankService service = BankService();

  // Create a account
  service.createAccount(123);

  // Assess that the account is created
  print(service.account.length == 1);
  print(service.account.first.accountId == 123);
}
