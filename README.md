# Bank tech test

This is a practice attempt at a tech test. 

I followed the TDD approach to fulfill the following criteria:
```
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
### Installing

```
git clone https://github.com/cbp10/bank_tech_test.git
cd bank_tech_test
bundle
```
Tests can be run using RSpec in the project directory
```
rspec
```

Users can make deposits, withdrawals and print their statement.
Users can interact with this via a REPL, e.g. irb, as follows:
```
2.5.1 :001 > require './lib/account'
 => true 
2.5.1 :002 > a = Account.new
 => #<Account:0x00007fa1c99f7ed8 @balance=0, @statement=[], @printer=StatementPrinter> 
2.5.1 :003 > a.deposit(100, "12/12/2012")
 => ["12/12/2012 || 100.00 || || 100.00"] 
2.5.1 :004 > a.withdrawal(50, "13/12/2012")
 => ["12/12/2012 || 100.00 || || 100.00", "13/12/2012 || || 50.00 || 50.00"] 
2.5.1 :005 > a.print_statement
date || credit || debit || balance
13/12/2012 || || 50.00 || 50.00
12/12/2012 || 100.00 || || 100.00
```
Note - Transactions should be added in date order to keep the balance accurate, and clients have an unlimited overdraft!

