class BankAccount {
    // TODO
    final int accountId;
    final String accountOwener;
    double _balance=0;
    
    BankAccount(this.accountId, this.accountOwener);
    double get balance=> _balance;
    void credit(double amount){
      if (amount<=0){
        throw ArgumentError('Amount to credit must be greater than zero');

      }
      _balance +=amount;
    }
    void withdraw(double amount){
      if (amount<=0){
        throw ArgumentError('Amount to withdraw must be greater than zero');
      }
      if (amount>_balance){
        throw Exception('Insufficient balance for withdrawal!');
      }
      _balance -=amount;
    }
}

class Bank {
    // TODO
    final String name;
    final List<BankAccount>_accounts=[];
    Bank({required this.name});
    BankAccount createAccount(int accountId, String accountOwener){
      for (final account in _accounts){
        if (account.accountId == accountId){
          throw Exception('Account with Id $accountId alreay exists!');
        }
      }
      final account = BankAccount(accountId, accountOwener);
      _accounts.add(account);
      return account;
    }
}
 
void main() {

  final Bank myBank = Bank(name: "CADT Bank");
  final  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');


  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

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
