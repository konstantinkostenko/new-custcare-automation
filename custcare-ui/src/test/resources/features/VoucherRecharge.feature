@React @ReactVoucherRecharge
Feature: Voucher Recharge
  I want to verify that voucher recharge is working properly

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @regression @closePopup
  Scenario: C90864371 Valid Voucher Recharge
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=500 for pin PIN=5297703533
    When I click on Query tab in React application
      And I set 6597751686 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 5297703533 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
      And I close alert message
    Then I check that current balance was increased after recharge for 5.00 in search results page

  @regression @closePopup
  Scenario: C90864372 Invalid Recharges: no balance
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=0 for pin PIN=1111190019
    When I click on Query tab in React application
      And I set 1111190020 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 1111190019 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
    Then I will see Cannot xfer balance, no balance message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression @closePopup
  Scenario: C90864373 Invalid Recharges: donor pin not in xfer group
    When I click on Query tab in React application
      And I set 1111190020 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 3003003434 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
    Then I will see Cannot xfer balance due to donor pin not in xfer group message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression @closePopup
  Scenario: C90888916 Invalid Recharges: xfer retailer pin initiated from consumer.
    When I click on Query tab in React application
      And I set 1111190020 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 5558923595 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
    Then I will see Cannot xfer retailer pin initiated from consumer message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression @closePopup
  Scenario: C90864374 Invalid Recharges: invalid currency
    When I click on Query tab in React application
      And I set 83789400203 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 83789400001 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
    Then I will see Cannot xfer balance, invalid currency message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression @closePopup
  Scenario: C90864375 Invalid Recharges: Account can not be the same number
    When I click on Query tab in React application
      And I set 1111190020 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 1111190020 pin number in From Account field of voucher Recharge pop up
    And I click TRANSFER button on Voucher Recharge pop-up
    And I click YES button on Voucher Recharge pop-up
    Then I will see Activation code should not be equal to the Account number. message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression @closePopup
  Scenario: C90864377 Invalid Recharges: pin not active
    When I click on Query tab in React application
      And I set 1111190020 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I check current balance in Search Results page
      And I click Recharge link in Search Result Page
      And I click on Voucher
    When I set 9919817711 pin number in From Account field of voucher Recharge pop up
      And I click TRANSFER button on Voucher Recharge pop-up
      And I click YES button on Voucher Recharge pop-up
    Then I will see Cannot xfer balance, from/to pin not active message in voucher window
    Then I click CANCEL button on Voucher Recharge pop-up

  @regression
  Scenario: C90864378 Voucher Recharge is disabled when enrolled in a Destination Special Calling Plan
    When I click on Query tab in React application
      And I set 8241664001 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click Recharge link in Search Result Page
    Then I should not see Voucher option in Recharge menu
