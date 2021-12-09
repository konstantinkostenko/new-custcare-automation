@React @CreditCall
Feature: Credit Call
  In order to test the Credit Call functionality in React application
  As a user I want to be able to do a credit call

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @closePopup
  Scenario: C92864236 Credit a Call details - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752448" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433265557,6597752448,14072,sysdate-1,13,5,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752448 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.05 data
      And I click on Credit from 3 dots menu
    Then I should see Account equals 6597752448 in Account History page
      And I should see Duration equals 0:13 in Account History page
      And I should see Cost equals $0.05 in Account History page
      And I should see DNIS equals 7326405363 in Account History page
      And I should see ANI equals 8282724023 in Account History page
      And I should see Dialed Number equals 11532416640001 in Account History page
    Then I click on Cancel button in Credit Call pop-up

  Scenario: C92864238 Credit is not available from Query page - the call was made more than 48 hours ago
    When I click on Query tab in React application
      And I set 6597752451 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-16 date in START DATE field in React application
      And I put 2021-10-16 date in END DATE field in React application
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I check that 3 dots are not displayed for 10/16/2021 8:34:27 AM transaction in Account History page

  @closePopup
  Scenario: C92864240 Force credit from Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752456" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433273376,6597752456,14072,sysdate-1,13,5,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752456 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.05 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click 3 dots for transaction with $0.05 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The call was credited displayed in Search Result page
    Then I check that 3 dots are not displayed for $0.05 transaction in Account History page

  @closePopup
  Scenario: C92864376 Force credit details - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752474" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433342864,6597752474,14072,sysdate-1,13,15,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752474 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.15 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click 3 dots for transaction with $0.15 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I should see Account equals 6597752474 in Account History page
      And I should see Duration equals 0:13 in Account History page
      And I should see Cost equals $0.15 in Account History page
      And I should see DNIS equals 7326405363 in Account History page
      And I should see ANI equals 8282724023 in Account History page
      And I should see Dialed Number equals 11532416640001 in Account History page
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864377 Reason drop-down list for Force Credit - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752456" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433273376,6597752456,14072,sysdate-1,13,5,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752456 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.05 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click 3 dots for transaction with $0.05 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I check that False Answer Supervision reason displayed in Reason list
      And I check that Disconnected Call reason displayed in Reason list
      And I check that One Way Audio reason displayed in Reason list
      And I check that Static reason displayed in Reason list
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864378 Reason drop-down list for Credit a Call - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752459" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433273943,6597752459,14072,sysdate-1,13,1,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I check that False Answer Supervision reason displayed in Reason list
      And I check that Disconnected Call reason displayed in Reason list
      And I check that One Way Audio reason displayed in Reason list
      And I check that Static reason displayed in Reason list
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864379 Cancel button for Credit a Call - Query page
    When I click on Query tab in React application
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864380 Cancel button for Force Credit - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752460" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433273947,6597752460,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752460 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864381 Check required fields for Credit a Call pop-up - Query page
    When I click on Query tab in React application
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I click on Credit button in Credit Call pop-up
    Then "Reason should be selected" alert message should be displayed for "Reason" field
      And "Comment can not be empty" alert message should be displayed for "Comment" field
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864382 Check required fields for Force Credit pop-up - Query page
    Given I delete from "partitioned_billtab" where "pin = 6597752477" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345755,6597752477,14072,sysdate-1,13,5,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752477 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.05 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
    And I close alert message
      And I click 3 dots for transaction with $0.05 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I click on Credit button in Credit Call pop-up
    Then "Reason should be selected" alert message should be displayed for "Reason" field
      And "Comment can not be empty" alert message should be displayed for "Comment" field
      And I click on Cancel button in Credit Call pop-up

  Scenario: C92864383 Credit is not available from Query page - the call duration was for more than 30 seconds
    Given I update "partitioned_billtab" with data "BILLDATE = sysdate-1" where "pin = 6597752453 and COST = 10" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752453 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I click on SEARCH on Account History Page in React application
    Then I check that 3 dots are not displayed for $0.10 transaction in Account History page

  @closePopup
  Scenario: C92864410 Credit a Call details - Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752448" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433265557,6597752448,14072,sysdate-1,13,5,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752448 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.95 data
      And I click on Credit from 3 dots menu
    Then I should see Account equals 6597752448 in Account History page
      And I should see Duration equals 0:13 in Account History page
      And I should see Cost equals $0.05 in Account History page
      And I should see DNIS equals 7326405363 in Account History page
      And I should see ANI equals 8282724023 in Account History page
      And I should see Dialed Number equals 11532416640001 in Account History page
    Then I click on Cancel button in Credit Call pop-up

  Scenario: C92864412 Credit is not available from Account History - the call was made more than 48 hours ago
    Given I update "partitioned_billtab" with data "BILLDATE = sysdate-3, DURATION = '20'" where "pin = 6597752454" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752454 PIN in Query Search page in React application
      And I search for account in React application
    Then I check that 3 dots are not displayed for 0:20 transaction in Account History page

  @closePopup
  Scenario: C92864414 Force credit from Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752457" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433273798,6597752457,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752457 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The call was credited displayed in Search Result page
      And I check that 3 dots are not displayed for $0.02 transaction in Account History page

  @closePopup
  Scenario: C92864417 Force credit details - Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752478" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345784,6597752478,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752478 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
    And I close alert message
      And I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I should see Account equals 6597752478 in Account History page
      And I should see Duration equals 0:13 in Account History page
      And I should see Cost equals $0.02 in Account History page
      And I should see DNIS equals 7326405363 in Account History page
      And I should see ANI equals 8282724023 in Account History page
      And I should see Dialed Number equals 11532416640001 in Account History page
    Then I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864418 Reason drop-down list for Force Credit - Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752479" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345792,6597752479,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752479 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose Static from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
      And I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I check that False Answer Supervision reason displayed in Reason list
      And I check that Disconnected Call reason displayed in Reason list
      And I check that One Way Audio reason displayed in Reason list
      And I check that Static reason displayed in Reason list
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864419 Reason drop-down list for Credit a Call - Account History
    When I click on Query tab in React application
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I check that False Answer Supervision reason displayed in Reason list
      And I check that Disconnected Call reason displayed in Reason list
      And I check that One Way Audio reason displayed in Reason list
      And I check that Static reason displayed in Reason list
      And I click on Cancel button in Credit Call pop-up


  @closePopup
  Scenario: C92864420 Cancel button for Credit a Call - Account History
    When I click on Query tab in React application
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864421 Cancel button for Force Credit - Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752480" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345808,6597752480,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752480 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
      And I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
      And I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864422 Check required fields for Credit a Call pop-up - Account History
    When I click on Query tab in React application
      And I set 6597752459 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.01 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I click on Credit button in Credit Call pop-up
    Then "Reason should be selected" alert message should be displayed for "Reason" field
      And "Comment can not be empty" alert message should be displayed for "Comment" field
    Then I click on Cancel button in Credit Call pop-up

  @closePopup
  Scenario: C92864423 Check required fields for Force Credit pop-up - Account History
    Given I delete from "partitioned_billtab" where "pin = 6597752481" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345826,6597752481,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752481 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
      And I click 3 dots for transaction with $0.02 data
      And I click on Force credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I click on Credit button in Credit Call pop-up
    Then "Reason should be selected" alert message should be displayed for "Reason" field
      And "Comment can not be empty" alert message should be displayed for "Comment" field
    Then I click on Cancel button in Credit Call pop-up

  Scenario: C92864424 Credit is not available from Account History - the call duration was for more than 30 seconds
    When I click on Query tab in React application
      And I set 6597752453 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check that 3 dots are not displayed for 0:40 transaction in Account History page

  Scenario: C92870189 Call status - Credit denied
    Given I delete from "partitioned_billtab" where "pin = 6597752482" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433345832,6597752482,14072,sysdate-1,13,2,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752482 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.02 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
    When I click expand button for transaction with $0.02 data in Account History page
      And I should see Status equals Credit denied in Account History page

  @closePopup
  Scenario: C92870714 Credit record with 0 amount
    Given I delete from "partitioned_billtab" where "pin = 6597752455" in "DEBIT" database
    When I click on Query tab in React application
      And I insert into "partitioned_billtab" with values "4433272541,6597752455,14072,sysdate-1,20,10,7326405363,8282724023,011532416640001,00,'B:12=0',60,60,500,500,1,'0010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,0,0,'1:c=95:p=0',0,0,0,0,0,0,null,null,null,null,150,null,'10.227.0.16','6154298427fd',sysdate-1,2,'sipua_loadtest_1','sipcg_1',null,null" on "DEBIT" database
      And I set 6597752455 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I choose YESTERDAY date in calendar
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $0.10 data
      And I click on Credit from 3 dots menu
    Then I SHOULD see Credit Call pop-up in Account History page
    When I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "Test" date in COMMENT field in Account Credit pop-up
      And I click on Credit button in Credit Call pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The credit was declined displayed in Search Result page
      And I close alert message
      And I choose TODAY date in calendar
      And I click on SEARCH on Account History Page in React application
    When I click expand button for transaction with $0.00 data in Account History page
      And I should see Status equals not-debited in Account History page
