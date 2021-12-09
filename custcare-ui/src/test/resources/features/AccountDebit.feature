@React @ReactAccountDebit
Feature: Account Debit
  I want to verify that Account Debit is working properly in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @closePopup
  Scenario: C90989587: Debit an account fields validation
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=5000 for pin PIN=6597752239
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I click DEBIT ACCOUNT button in Account Debit pop-up
    Then "This field is required" alert should be displayed in Account Debit pop-up
      And "Comment can not be empty" alert should be displayed in Account Debit pop-up
    Then I click CANCEL button in Account Debit pop-up

  @closePopup
  Scenario: C90989589: Debit an account Not possible without an amount
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Test" date in COMMENT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then "This field is required" alert should be displayed in Account Debit pop-up
      And I click CANCEL button in Account Debit pop-up

  @closePopup
  Scenario: C90989590: Debit an account:amount validation
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "sfr" date in DEBIT AMOUNT field in Account Debit pop-up
      And I put "Test" date in COMMENT field in Account Debit pop-up
    Then Value of DEBIT AMOUNT equels to "" displayed in Account Debit pop-up
      And I click CANCEL button in Account Debit pop-up

  @closePopup
  Scenario: C90989591: Debit an account:trim fields
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Test" date in COMMENT field in Account Debit pop-up
      And I put "    45" date in DEBIT AMOUNT field in Account Debit pop-up
    Then Value of DEBIT AMOUNT equels to "45" displayed in Account Debit pop-up
      And I click CANCEL button in Account Debit pop-up

  @closePopup
  Scenario: C90989592: Debit an account:success debit change Current balance and cash
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Test" date in COMMENT field in Account Debit pop-up
      And I put "5" date in DEBIT AMOUNT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752239 is debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance was decreased after account debit in search results page

  @closePopup
  Scenario: C90989596: Debit an account:Cannot Debit amount greater than current balance
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Test" date in COMMENT field in Account Debit pop-up
      And I put "5000" date in DEBIT AMOUNT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Debit amount exceeds current balance displayed in Search Result page
      And I close alert message
    Then I verifies that NOTIFICATION MESSAGE equals to The transaction amount 5000 must be less than or equal to the system limit of 999.00 displayed in Search Result page
      And I close alert message

  @closePopup
  Scenario: C90989598: Debit an account:Comments section reflect account debited
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Account 6597752239 is debited $ 5" date in COMMENT field in Account Debit pop-up
      And I put "5" date in DEBIT AMOUNT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752239 is debited $5.00 displayed in Search Result page
      And I close alert message
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to Account 6597752239 is debited $ 5 in Search Result Page

  @closePopup
  Scenario: C90989599: Debit an account:Cannot debit with invalid format amount
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "5,56" date in DEBIT AMOUNT field in Account Debit pop-up
      And I put "Test" date in COMMENT field in Account Debit pop-up
    Then Value of DEBIT AMOUNT equels to "556" displayed in Account Debit pop-up
    When I put "-5.00" date in DEBIT AMOUNT field in Account Debit pop-up
      And I put "Test" date in COMMENT field in Account Debit pop-up
    Then Value of DEBIT AMOUNT equels to "1" displayed in Account Debit pop-up
      And I click CANCEL button in Account Debit pop-up

  Scenario: C89679754: Recent comments after issue debit
    When I click on Query tab in React application
      And I set 6597752239 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Debit comment" date in COMMENT field in Account Debit pop-up
      And I put "5" date in DEBIT AMOUNT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752239 is debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance was decreased after account debit in search results page
    When I click COMMENTS BLOCK button in Search Result Page
      And I verify that new added comment equals to Debit comment in Search Result Page
