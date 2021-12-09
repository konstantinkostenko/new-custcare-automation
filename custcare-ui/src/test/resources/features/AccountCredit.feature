@React @ReactAccountCredit
Feature: Account Credit
  I want to verify that Account Credit is working properly in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @closePopup
  Scenario: C91204802: Verify that Account Credit available
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
      And I click CANCEL button in Account Credit pop-up

  @closePopup
  Scenario: C91204806: Verify Account Credit with valid value
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=5000 for pin PIN=6597752301
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Balance transfer from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752301 is credited $5.00 displayed in Search Result page
      And I close alert message

  @closePopup
  Scenario: C91204807: Verify the required fields in the "Account Credit" form
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I click CREDIT ACCOUNT button in Account Credit pop-up
    Then "This field is required" alert message should be displayed for "Credit Amount" field
      And "This field is required" alert message should be displayed for "Reason" field
      And "Comment can not be empty" alert message should be displayed for "Comment" field
    Then I click CANCEL button in Account Credit pop-up

  @closePopup
  Scenario: C91517508: Verify that Account Credit with invalid value
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "5,56" date in CREDIT AMOUNT field in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
    Then Value of CREDIT AMOUNT equels to "556" displayed in Account Credit pop-up
    When I put "-5.00" date in CREDIT AMOUNT field in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
    Then Value of CREDIT AMOUNT equels to "1" displayed in Account Credit pop-up
      And I click CANCEL button in Account Credit pop-up

  @closePopup
  Scenario: C91517509: Verify that Increases account’s balance by credit amount
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Goodwill from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752301 is credited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance was increased after account credit in search results page

  @closePopup
  Scenario: C89679752: Recent comments after issue credit
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=5000 for pin PIN=6597752301
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Account 6597752239 is credited $ 5" date in COMMENT field in Account Credit pop-up
      And I choose IMTU not applied from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752301 is credited $5.00 displayed in Search Result page
      And I close alert message
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to Account 6597752239 is credited $ 5 in Search Result Page

  @closePopup
  Scenario: C91517800: Verify the maximum credit amount
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Manual recharge from Reason list in Account Credit pop-up
      And I put "26001" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The transaction amount 26001 must be less than or equal to the user limit of 26000 displayed in Search Result page
      And I close alert message

  @closePopup
  Scenario: C91535766 Verify the Reason drop-down list for Account Credit
    When I click on Query tab in React application
      And I set 6597752301 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I check that Balance not applied reason displayed in Reason list
      And I check that Business credit request reason displayed in Reason list
      And I check that Disconnected Call reason displayed in Reason list
      And I check that False Answer Supervision reason displayed in Reason list
      And I check that Goodwill reason displayed in Reason list
      And I check that IMTU not applied reason displayed in Reason list
      And I check that Manual recharge reason displayed in Reason list
      And I click CANCEL button in Account Credit pop-up
