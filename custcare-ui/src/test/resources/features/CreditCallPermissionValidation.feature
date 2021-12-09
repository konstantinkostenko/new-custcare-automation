@React @CreditCall
Feature: Credit Call permission validation
  In order to test the Credit Call functionality in React application
  As a user I want to be able to do a credit call

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with testl8 credentials

  Scenario: C92864433 Credit is not available on Query page - no permission
    Given I delete from "partitioned_billtab" where "pin = 6597752476" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433342948,6597752476,14072,sysdate-1,20,10,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752476 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check that 3 dots are not displayed for $0.10 transaction in Account History page

    Scenario: C92864434 Credit is not available on Account history - no permission
    Given I delete from "partitioned_billtab" where "pin = 6597752476" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433342948,6597752476,14072,sysdate-1,20,10,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752476 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I check that 3 dots are not displayed for $0.10 transaction in Account History page
