import 'dart:io';
import 'dart:math';

// Declare class.
class ConsoleBank {
  // Declare the fileds.
  String acctName = "";
  int acctNum = 0;
  double acctBalance = 0.0;

  // three argument constructor.
  ConsoleBank(this.acctName, this.acctNum, this.acctBalance);

  // Declare getter and setter for account name.
  String get accountName => acctName;
  set accountName(String nm) => acctName = nm;

  // Declare getter and setter for account number
  int get accountNum => this.acctNum;
  set accountNum(int acctnum) => acctNum = acctnum;

  // Declare setter and getter for account balance.
  double get accountBalance => this.acctBalance;
  set accountBalance(double bal) => acctBalance = bal;

  // Declare deposit method.
  void deposit(double amt) {
    if( amt > 0 ) {
      acctBalance += amt;
      print( 'Money deposited successfully.' );
    }
  }

  // Declare withdraw method.
  double withdraw(double amt) {
    if( acctBalance < amt ) {
      print('Insufficient funds');
      return acctBalance;
    }
    else {
      print( 'Take your cash.' );
      return acctBalance -= amt;
    }
  }
}

// main method to test the class workings.
void main() {
  // Instanciate an object of the class Console bank.
  ConsoleBank cb = new ConsoleBank("", 0, 0);
  var rng = new Random(); // Declare a random generator.

  // Print welcome message followed by the menu.
  stdout.writeln('Welcome to the Cosole Bank\nWhat do you want to do please?');
  while(true) {
    stdout.writeln('\n1. Open an Account.\n2. Withdraw Money. \n3. Deposit an Amount.\n4. Get Account Balance.\n\nEnter an option to continue...');

    var menu = stdin.readLineSync();

    // Process Account Opening.
    if( menu == '1' ) {
      if(!(cb.accountName == "")){
        stdout.writeln('You already own an account. Try to deposit or withdraw.');
        continue;
      } else {
        stdout.write('\nEnter the Account Name: ');
        String aName = stdin.readLineSync().toString().trim();
        cb = new ConsoleBank( aName, (1000000000 + rng.nextInt(1000000000)), 0); 
        stdout.writeln('\nYour Account Number is ' + cb.accountNum.toString());
        stdout.write('\nPress any key to continue... ');
        stdin.readLineSync();
      }
    }else if( menu == '2' ) { // Process Withdrawal.
      stdout.write('\nEnter the amount you want to withdraw: ');
      var amt = stdin.readLineSync().toString();

      if(double.parse(amt) <= cb.accountBalance) {
        cb.withdraw( double.parse(amt) );
      }else {
        stdout.writeln('Insufficient funds.');
      }
      stdout.write('\nPress any key to continue... ');
      stdin.readLineSync();
    }else if( menu == '3' ) { // Process Deposit.
      stdout.write('\nEnter the amount you want to deposit: ');
      var amt = stdin.readLineSync().toString();

      cb.deposit( double.parse(amt) );
      stdout.write('\nPress any key to continue... ');
      stdin.readLineSync();
    }else if( menu == '4' ) { // Display account balance.
      stdout.writeln('Your current account balanace is ' + cb.accountBalance.toString());
      stdout.write('\nPress any key to continue... ');
      stdin.readLineSync();
    }
  }
} 

