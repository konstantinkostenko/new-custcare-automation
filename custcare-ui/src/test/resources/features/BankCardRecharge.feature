@React @ReactBankCardRecharge
Feature: Verify that Bank Card recharge working properly

  Background: Login to custcare portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @regression @closePopup
    Scenario: C91682736 Recharge Bank Card: Valid Amount to recharge of a drop down list
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752330
    When I click on Query tab in React application
      And I set 6597752330 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Bank Card
      And I click RECHARGE button in Payment Info Page
      And I choose 50.00 from TRANSACTION AMOUNT LIST list in Payment Info page in React application
      And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success        |
      | Amount: $50.00 |
    Then I click on Query tab in React application
      And I set 6597752330 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check that current balance was increased after recharge for 55 in search results page

  @regression @closePopup
  Scenario: C91682737 Recharge Bank Card: Valid Amount to recharge of a specified range field
  Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752375
  When I click on Query tab in React application
    And I set 6597752375 PIN in Query Search page in React application
    And I search for account in React application
  Then I see Search Result in Search Result page
  When I check current balance in Search Results page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    And I click RECHARGE button in Payment Info Page
    And I set 10 value in TRANSACTION AMOUNT field in Payment Info page in React application
    And I click APPLY button in Payment Info Page
  Then the following messages are displayed in Payment Info page
     | Success        |
     | Amount: $10.00 |
    Then I click on Query tab in React application
    And I set 6597752375 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I check that current balance was increased after recharge for 11 in search results page

  @regression @closePopup
  Scenario: C91682738 Recharge Bank Card: Valid Amount to recharge of a fixed amount field
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752336
    When I click on Query tab in React application
    And I set 6597752336 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    And I click RECHARGE button in Payment Info Page
    Then I should see TRANSACTION AMOUNT equals 10.00 in Recharge section
    And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success            |
      | Amount: $10.00     |
      | Promo Award: $1.00 |
    Then I click on Query tab in React application
    And I set 6597752336 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I check that current balance was increased after recharge for 11 in search results page

  @regression @closePopup
  Scenario: C91732281 Recharge Bank Card: Is able to recharge from Payment info page
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752300
    When I click on Query tab in React application
    And I set 6597752300 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I check current balance in Search Results page
    When I click PAYMENT INFO button in Search Result Page
    And I click RECHARGE button in Payment Info Page
    And I set 10 value in TRANSACTION AMOUNT field in Payment Info page in React application
    And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success        |
      | Amount: $10.00 |
    Then I click on Query tab in React application
    And I set 6597752300 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I check that current balance was increased after recharge for 11 in search results page

  @regression @closePopup
  Scenario: C91732689 Invalid Recharge Bank Card: is not able to recharge if the amount limit is exceed
    When I click on Query tab in React application
      And I set 6597752335 PIN in Query Search page in React application
      And I search for account in React application
      Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Bank Card
      And I click RECHARGE button in Payment Info Page
      And I set 10 value in TRANSACTION AMOUNT field in Payment Info page in React application
      And I click APPLY button in Payment Info Page
    Then 'FAILURE' message displayed in Payment Info page

  @regression @closePopup
  Scenario: C91732691 Invalid Recharge Bank Card: is not able to recharge if the account is Suspended or Deactivate
    Given I update balance in table PARTITIONED_PINTAB with values STATE='D' for pin PIN=7167610249
    When I click on Query tab in React application
    And I set 7167610249 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    Then 'Unable to recharge' message displayed in Recharge section

  @regression @closePopup
  Scenario: C91771670 Unable to Recharge account if Class Migration is in Progress
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=10 for pin PIN=6597752332
    When I click on Query tab in React application
    And I set 6597752332 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    And I click RECHARGE button in Payment Info Page
    And I set 50 value in TRANSACTION AMOUNT field in Payment Info page in React application
    And I click APPLY button in Payment Info Page
    Then 'CLASS IS BEING MIGRATED. TRY AGAIN LATER.' message displayed in Payment Info page

  @regression @closePopup
  Scenario: C91771671  Recharge button is disabled if the Account have a Bank account info instead of bank card info
    When I click on Query tab in React application
    And I set 1114924366 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    Then 'Unable to recharge' message displayed in Recharge section

  @regression @closePopup
  Scenario: C91979246 Recharge Escrow Case: Is not able to do a rechage when the Credit Risk is Unverified
    When I click on Query tab in React application
    And I set 1209241620 PIN in Query Search page in React application
    And I search for account in React application
    Then I see Search Result in Search Result page
    And I click Recharge link in Search Result Page
    And I click on Bank Card
    And I click APPLY button in Payment Info Page
    Then 'FAILURE' message displayed in Payment Info page