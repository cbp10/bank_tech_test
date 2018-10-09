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
$ git clone https://github.com/cbp10/bank_tech_test.git
$ cd bank_tech_test
$ bundle
```
Tests can be run using RSpec in the project directory
```
$ rspec
```

Users can make deposits, withdrawals and print their statement. Amounts being deposited or withdrawn must be a numerical value, and withdrawals can only be made if there is enough money in the account.


Users can interact with this via a REPL, e.g. irb, as follows:
```
2.5.1 :001 > require './lib/account'
 => true 
2.5.1 :002 > a = Account.new
 => #<Account:0x00007f8e3a14f3c8 @balance=0, @statement=[], @printer=StatementPrinter> 
2.5.1 :003 > a.deposit(1000)
 => [{:amount=>1000, :balance=>1000, :credit=>true, :date=>2018-10-09 12:41:43 +0100}] 
2.5.1 :004 > a.withdrawal(500)
 => [{:amount=>1000, :balance=>1000, :credit=>true, :date=>2018-10-09 12:41:43 +0100}, {:amount=>500, :balance=>500, :credit=>false, :date=>2018-10-09 12:41:55 +0100}] 
2.5.1 :005 > a.deposit("cash")
Traceback (most recent call last):
        3: from /Users/rashikapatel/.rvm/rubies/ruby-2.5.1/bin/irb:11:in `<main>'
        2: from (irb):5
        1: from /Users/rashikapatel/Documents/Projects/weekly/bank_tech_test/lib/account.rb:12:in `deposit'
RuntimeError (Cannot make deposit: Value not recognised)
2.5.1 :006 > a.print_statement
date || credit || debit || balance
09/10/2018 || || 500.00 || 500.00
09/10/2018 || 1000.00 || || 1000.00
```
