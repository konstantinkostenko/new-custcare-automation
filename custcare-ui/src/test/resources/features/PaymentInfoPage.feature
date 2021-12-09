@React @ReactPaymentInfoPage
Feature: Payment Info page
  I want to verify that contents in Payment Info page is displayed properly in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @quitWebDriver
  Scenario: C90139108: Dashboard in Payment Info page
    When I click on Query tab in React application
      And I set 89400001 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I should see Company equals IDT in Payment Info page
      And I should see Card Name equals VoiceWeb Testing in Payment Info page
      And I should see Class Id equals 9494 in Payment Info page
      And I should see Control Number equals 89400001 in Payment Info page
      And I should see PIN equals 83789400001 in Payment Info page
      And I should see Balance equals 818692Min in Payment Info page
      And I should see Currency equals MIN (Min) in Payment Info page
      And I should see Status equals Active in Payment Info page
      And I should see Activation equals 10/31/2002 11:35 in Payment Info page
      And I should see First Call Made equals 12/09/2004 14:25 in Payment Info page
      And I should see Last Use equals 08/12/2009 15:37 in Payment Info page
      And I should see Last Service Charge equals 11/09/2004 14:30 in Payment Info page

  Scenario: C90140131: User is able to save/update Payment info with VISA
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = Visa in Payment Info Page
      And I set 4111111111111111 value in CARD NUMBER field in Payment Info page in React application
      And I choose 2029 expiration year in Payment Info page in React application
      And I choose Dec expiration month in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
    And I click USE CUSTOMER INFO button in Payment Info Page
    And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | Visa             |
        | CARD NUMBER      | 41XXXXXXXXXX1111 |
        | EXPIRATION MONTH | 12               |
        | EXPIRATION YEAR  | 2029             |
        | CVV              | [blank]          |
        | FIRST NAME       | Test             |
        | LAST NAME        | Test             |
        | STREET1          | New Jersey 444   |
        | STREET2          | [blank]          |
        | CITY             | New              |
        | ZIP              | 11111            |
        | COUNTRY          | United States    |
        | STATE            | New Jersey       |

  Scenario: C90140135: User is able to save/update Payment info with MasterCard
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = MasterCard in Payment Info Page
      And I set 5105105105105100 value in CARD NUMBER field in Payment Info page in React application
      And I choose Nov expiration month in Payment Info page in React application
      And I choose 2023 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | MasterCard       |
      | CARD NUMBER      | 51XXXXXXXXXX5100 |
      | EXPIRATION MONTH | 11               |
      | EXPIRATION YEAR  | 2023             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          | [blank]          |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90140159: User is able to save/update Payment info with American Express
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = American Express in Payment Info Page
      And I set 378282246310005 value in CARD NUMBER field in Payment Info page in React application
      And I choose May expiration month in Payment Info page in React application
      And I choose 2024 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
     And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | American Express |
      | CARD NUMBER      | 37XXXXXXXXX0005  |
      | EXPIRATION MONTH | 05               |
      | EXPIRATION YEAR  | 2024             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          |[blank]           |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90143413: User is able to save/update Payment info with Discover
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = Discover in Payment Info Page
      And I set 6011111111111117 value in CARD NUMBER field in Payment Info page in React application
      And I choose Jun expiration month in Payment Info page in React application
      And I choose 2025 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | Discover         |
      | CARD NUMBER      | 60XXXXXXXXXX1117 |
      | EXPIRATION MONTH | 06               |
      | EXPIRATION YEAR  | 2025             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          | [blank]          |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90143414: User is able to save/update Payment info with Diner Club
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = Diners Club in Payment Info Page
      And I set 3056930902590434 value in CARD NUMBER field in Payment Info page in React application
      And I choose Jul expiration month in Payment Info page in React application
      And I choose 2026 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | Diners Club      |
      | CARD NUMBER      | 30XXXXXXXXXX0434 |
      | EXPIRATION MONTH | 07               |
      | EXPIRATION YEAR  | 2026             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          | [blank]          |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90143415: User is able to save/update Payment info with JCB
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          | [blank]          |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90158937: Remove Account Info button clears the Payment info data
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | Test             |
      | LAST NAME        | Test             |
      | STREET1          | New Jersey 444   |
      | STREET2          | [blank]          |
      | CITY             | New              |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |
      And I click REMOVE ACCOUNT INFO button in Payment Info Page
    When I click on Query tab in React application
      And I set 7287703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | Select Payment Type   |
      | CARD NUMBER      | [blank]               |
      | EXPIRATION MONTH | [blank]               |
      | EXPIRATION YEAR  | [blank]               |
      | CVV              | [blank]               |
      | FIRST NAME       | [blank]               |
      | LAST NAME        | [blank]               |
      | STREET1          | [blank]               |
      | STREET2          | [blank]               |
      | CITY             | [blank]               |
      | ZIP              | [blank]               |
      | COUNTRY          | Select Country        |
      | STATE            | Select State/Province |

  Scenario: C90231620: Payment Information is prepopulated: Customer info and Payment info are empty
    When I click on Query tab in React application
      And I set 6597750002 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | Select Payment Type   |
        | CARD NUMBER      | [blank]               |
        | EXPIRATION MONTH | [blank]               |
        | EXPIRATION YEAR  | [blank]               |
        | CVV              | [blank]               |
        | FIRST NAME       | [blank]               |
        | LAST NAME        | [blank]               |
        | STREET1          | [blank]               |
        | STREET2          | [blank]               |
        | CITY             | [blank]               |
        | ZIP              | [blank]               |
        | COUNTRY          | Select Country        |
        | STATE            | Select State/Province |
    When I click USE CUSTOMER INFO button in Payment Info Page
      And Customer info is empty alert message displays in Payment Info page

  Scenario: C90231658: Payment Information is prepopulated: Customer info and Payment info are prepopulated
    When I click on Query tab in React application
      And I set 1297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | Visa                |
        | CARD NUMBER      | 41XXXXXXXXXX1111    |
        | EXPIRATION MONTH | 06                  |
        | EXPIRATION YEAR  | 2032                |
        | CVV              | [blank]             |
        | FIRST NAME       | Payment             |
        | LAST NAME        | Info                |
        | STREET1          | Hawthorne Boulevard |
        | STREET2          | [blank]             |
        | CITY             | Torrance            |
        | ZIP              | 22222               |
        | COUNTRY          | United States       |
        | STATE            | California          |
    When I click USE CUSTOMER INFO button in Payment Info Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | Visa             |
      | CARD NUMBER      | 41XXXXXXXXXX1111 |
      | EXPIRATION MONTH | 06               |
      | EXPIRATION YEAR  | 2032             |
      | CVV              | [blank]          |
      | FIRST NAME       | Customer         |
      | LAST NAME        | Info             |
      | STREET1          | Newark Avenue    |
      | STREET2          | Street 2         |
      | CITY             | Jersey City      |
      | ZIP              | 11111            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90231659: Payment Information is prepopulated: Customer info is empty and Payment info is prepopulated
    When I click on Query tab in React application
      And I set 9297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | Visa              |
      | CARD NUMBER      | 41XXXXXXXXXX1111  |
      | EXPIRATION MONTH | 03                |
      | EXPIRATION YEAR  | 2028              |
      | CVV              | [blank]           |
      | FIRST NAME       | Payment           |
      | LAST NAME        | Info              |
      | STREET1          | New Jersey 33     |
      | STREET2          | Street 2          |
      | CITY             | Hamilton Township |
      | ZIP              | 33333             |
      | COUNTRY          | United States     |
      | STATE            | New Jersey        |
    When I click USE CUSTOMER INFO button in Payment Info Page
      And Customer info is empty alert message displays in Payment Info page

  Scenario: C90232696: Payment Information is prepopulated: Customer info is saved and Payment info is empty
    When I click on Query tab in React application
      And I set 0297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | Select Payment Type   |
        | CARD NUMBER      | [blank]               |
        | EXPIRATION MONTH | [blank]               |
        | EXPIRATION YEAR  | [blank]               |
        | CVV              | [blank]               |
        | FIRST NAME       | [blank]               |
        | LAST NAME        | [blank]               |
        | STREET1          | [blank]               |
        | STREET2          | [blank]               |
        | CITY             | [blank]               |
        | ZIP              | [blank]               |
        | COUNTRY          | Select Country        |
        | STATE            | Select State/Province |
    When I click USE CUSTOMER INFO button in Payment Info Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | Select Payment Type                      |
        | CARD NUMBER      | [blank]                                  |
        | EXPIRATION MONTH | [blank]                                  |
        | EXPIRATION YEAR  | [blank]                                  |
        | CVV              | [blank]                                  |
        | FIRST NAME       | Simpleppfirst                            |
        | LAST NAME        | Simplepplast                             |
        | STREET1          | ECPAddress1                              |
        | STREET2          | ECPAddress2                              |
        | CITY             | SimplePPCityxxxxxxxxxxxxxxxxxxxxxxxxxxxz |
        | ZIP              | 08854                                    |
        | COUNTRY          | United States                            |
        | STATE            | California                               |

  Scenario: C90356632: Add Auto Recharge: Enable with "Min Days"
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I set 50 value in RECHARGE AMOUNT FIELD field in Payment Info page in React application
      And Set MIDCALL RECHARGE checkbox = true in Payment Info page
      And I set 10 value in MIN DAYS BETWEEN RECHARGES field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
        | AUTO RECHARGE              | true |
        | TRIGGER THRESHOLD          | 3.00 |
        | RECHARGE AMOUNT            | 50   |
        | MIDCALL RECHARGE           | true |
        | MIN DAYS BETWEEN RECHARGES | 10   |

  Scenario: C90356744: Add Auto Recharge: Disable with "Min Days"
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = false in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
        | AUTO RECHARGE              | false |
        | TRIGGER THRESHOLD          | 3.00  |
        | RECHARGE AMOUNT            | 50    |
        | MIDCALL RECHARGE           | true  |
        | MIN DAYS BETWEEN RECHARGES | 10    |

  Scenario: C90356938: Add Auto Recharge: Enable with blank "Min Days"
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I set 50 value in RECHARGE AMOUNT FIELD field in Payment Info page in React application
      And Set MIDCALL RECHARGE checkbox = false in Payment Info page
      And I set  value in MIN DAYS BETWEEN RECHARGES field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
        | AUTO RECHARGE              | true    |
        | TRIGGER THRESHOLD          | 3.00    |
        | RECHARGE AMOUNT            | 50      |
        | MIDCALL RECHARGE           | false   |
        | MIN DAYS BETWEEN RECHARGES | [blank] |

  Scenario: C90356939: Add Auto Recharge: Disable with "Min Days"
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I set 50 value in RECHARGE AMOUNT FIELD field in Payment Info page in React application
      And Set MIDCALL RECHARGE checkbox = false in Payment Info page
      And I set  value in MIN DAYS BETWEEN RECHARGES field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
      | AUTO RECHARGE              | true    |
      | TRIGGER THRESHOLD          | 3.00    |
      | RECHARGE AMOUNT            | 50      |
      | MIDCALL RECHARGE           | false   |
      | MIN DAYS BETWEEN RECHARGES | [blank] |
      And Set AUTO RECHARGE checkbox = false in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
      |AUTO RECHARGE              | false   |
      |TRIGGER THRESHOLD          | 3.00    |
      |RECHARGE AMOUNT            | 50      |
      |MIDCALL RECHARGE           | false   |
      |MIN DAYS BETWEEN RECHARGES | [blank] |

  Scenario: C90356941: Add Midcall Recharge
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I set 50 value in RECHARGE AMOUNT FIELD field in Payment Info page in React application
      And Set MIDCALL RECHARGE checkbox = true in Payment Info page
      And I set 10 value in MIN DAYS BETWEEN RECHARGES field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
      | AUTO RECHARGE              | true |
      | TRIGGER THRESHOLD          | 3.00 |
      | RECHARGE AMOUNT            | 50   |
      | MIDCALL RECHARGE           | true |
      | MIN DAYS BETWEEN RECHARGES | 10   |

  Scenario: C90356942: Remove Midcall Recharge
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I set 50 value in RECHARGE AMOUNT FIELD field in Payment Info page in React application
      And Set MIDCALL RECHARGE checkbox = true in Payment Info page
      And I set 10 value in MIN DAYS BETWEEN RECHARGES field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
      | AUTO RECHARGE              | true  |
      | TRIGGER THRESHOLD          | 3.00  |
      | RECHARGE AMOUNT            | 50    |
      | MIDCALL RECHARGE           | true  |
      | MIN DAYS BETWEEN RECHARGES | 10    |
      And Set MIDCALL RECHARGE checkbox = false in Payment Info page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597752175 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And  I compare Auto Recharge info in Payment Info page:
        | AUTO RECHARGE              | true  |
        | TRIGGER THRESHOLD          | 3.00  |
        | RECHARGE AMOUNT            | 50    |
        | MIDCALL RECHARGE           | false |
        | MIN DAYS BETWEEN RECHARGES | 10    |

  Scenario: C90357250: Class with rechg_policy having no min/max and no buy_denom_id
    When I click on Query tab in React application
      And I set 83724012001 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page

  Scenario: C90357251: Unable to change Payment Info if Class Migration in Progress
    When I click on Query tab in React application
      And I set 0412170000 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click USE CUSTOMER INFO button in Payment Info Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And I choose 12345 from Recharge Policy list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'CLASS IS BEING MIGRATED. TRY AGAIN LATER.' message displayed in Payment Info page

  Scenario: C90412782: Auto-complete address information for credit card entry
    When I click on Query tab in React application
      And I set 6597750110 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I set First Test value in FIRST NAME field in Payment Info page in React application
      And I set Last Test value in LAST NAME field in Payment Info page in React application
      And I set Newbury Street value in STREET1 field in Payment Info page in React application
      And I select Boston, MA, USA option from autocomplete list in Payment Info page
      And I set 15849 value in ZIP field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597750110 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | Newbury Street   |
      | STREET2          | [blank]          |
      | CITY             | Boston           |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | Massachusetts    |

  Scenario: C90412783: Auto-complete address information with a non-existing Address
    When I click on Query tab in React application
      And I set 6597750743 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click REMOVE ACCOUNT INFO button in Payment Info Page
      And I set 9999999е value in STREET1 field in Payment Info page in React application
    Then I should not see autocomplete list for Street1 in Payment Info page

  Scenario: C90412784: Add billing address with Street1 and Street2
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And I click USE CUSTOMER INFO button in Payment Info Page
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I set First Test value in FIRST NAME field in Payment Info page in React application
      And I set Last Test value in LAST NAME field in Payment Info page in React application
      And I set Old Address value in STREET1 field in Payment Info page in React application
      And I set Street 2 value in STREET2 field in Payment Info page in React application
      And I set Boston Heights value in CITY field in Payment Info page in React application
      And I set 15849 value in ZIP field in Payment Info page in React application
      And I choose United States from COUNTRY list in Payment Info page in React application
      And I choose New Jersey from STATE list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | Old Address      |
      | STREET2          | Street 2         |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90412785: Update billing address with Street1 and Street2
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I set First Test value in FIRST NAME field in Payment Info page in React application
      And I set Last Test value in LAST NAME field in Payment Info page in React application
      And I set Old Address value in STREET1 field in Payment Info page in React application
      And I set Street 2 value in STREET2 field in Payment Info page in React application
      And I set Boston Heights value in CITY field in Payment Info page in React application
      And I set 15849 value in ZIP field in Payment Info page in React application
      And I choose United States from COUNTRY list in Payment Info page in React application
      And I choose New Jersey from STATE list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
        | PAYMENT TYPE     | JCB              |
        | CARD NUMBER      | 35XXXXXXXXXX0000 |
        | EXPIRATION MONTH | 08               |
        | EXPIRATION YEAR  | 2027             |
        | CVV              | [blank]          |
        | FIRST NAME       | First Test       |
        | LAST NAME        | Last Test        |
        | STREET1          | Old Address      |
        | STREET2          | Street 2         |
        | CITY             | Boston Heights   |
        | ZIP              | 15849            |
        | COUNTRY          | United States    |
        | STATE            | New Jersey       |
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I set New Address value in STREET1 field in Payment Info page in React application
      And I set New Street 2 value in STREET2 field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | New Address      |
      | STREET2          | New Street 2     |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90412786: Update billing address with Street1
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I set First Test value in FIRST NAME field in Payment Info page in React application
      And I set Last Test value in LAST NAME field in Payment Info page in React application
      And I set Old Address value in STREET1 field in Payment Info page in React application
      And I set Street 2 value in STREET2 field in Payment Info page in React application
      And I set Boston Heights value in CITY field in Payment Info page in React application
      And I set 15849 value in ZIP field in Payment Info page in React application
      And I choose United States from COUNTRY list in Payment Info page in React application
      And I choose New Jersey from STATE list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | Old Address      |
      | STREET2          | Street 2         |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I set New Address value in STREET1 field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | New Address      |
      | STREET2          | Street 2         |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90412787: Update billing address with Street2
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I select Payment Type = JCB in Payment Info Page
      And I set 3530111333300000 value in CARD NUMBER field in Payment Info page in React application
      And I choose Aug expiration month in Payment Info page in React application
      And I choose 2027 expiration year in Payment Info page in React application
      And I set 123 value in CVV field in Payment Info page in React application
      And Set ALLOW MULTIPLE USE checkbox = true in Payment Info page
      And I set First Test value in FIRST NAME field in Payment Info page in React application
      And I set Last Test value in LAST NAME field in Payment Info page in React application
      And I set Old Address value in STREET1 field in Payment Info page in React application
      And I set Street 2 value in STREET2 field in Payment Info page in React application
      And I set Boston Heights value in CITY field in Payment Info page in React application
      And I set 15849 value in ZIP field in Payment Info page in React application
      And I choose United States from COUNTRY list in Payment Info page in React application
      And I choose New Jersey from STATE list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | Old Address      |
      | STREET2          | Street 2         |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I set New Street 2 value in STREET2 field in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 1111190003 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I compare Credit/Debit Card info in Payment Info page:
      | PAYMENT TYPE     | JCB              |
      | CARD NUMBER      | 35XXXXXXXXXX0000 |
      | EXPIRATION MONTH | 08               |
      | EXPIRATION YEAR  | 2027             |
      | CVV              | [blank]          |
      | FIRST NAME       | First Test       |
      | LAST NAME        | Last Test        |
      | STREET1          | Old Address      |
      | STREET2          | New Street 2     |
      | CITY             | Boston Heights   |
      | ZIP              | 15849            |
      | COUNTRY          | United States    |
      | STATE            | New Jersey       |

  Scenario: C90310364: Change recharge policy
    When I click on Query tab in React application
      And I set 6597751681 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And I choose BossRevMaxPlus from RECHARGE POLICY list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page
    When I click on Query tab in React application
      And I set 6597751681 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And I compare Recharge Limits info in Payment Info page:
      | CURRENT RECHARGES       | [blank]                |
      | MAX NUMBER RECHARGES    | 10000 per 1 day(s)     |
      | CURRENT RECHARGE AMOUNT | [blank]                |
      | MAX RECHARGE AMOUNT     | 999999.99 per 1 day(s) |
    Then I choose BossRevSuperPlus from RECHARGE POLICY list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'YOUR DATA WAS SUCCESSFULLY SAVED' message displayed in Payment Info page

  Scenario: C90375091: Validation message when Amount is empty
    When I click on Query tab in React application
      And I set 1111190023 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And Set AUTO RECHARGE checkbox = true in Payment Info page
      And I choose BossRevMaxPlus from RECHARGE POLICY list in Payment Info page in React application
      And I click SAVE button in Payment Info Page
    Then 'PLEASE INPUT AMOUNT' message displayed in Payment Info page

  Scenario: C90455209: Select a policy with unlimited option
    When I click on Query tab in React application
      And I set 6597751681 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click RECHARGE SETTINGS button in Payment Info Page
      And I choose AutomationBossRev Retailer from RECHARGE POLICY list in Payment Info page in React application
      And I compare Recharge Limits info in Payment Info page:
      | CURRENT RECHARGES       | [blank]   |
      | MAX NUMBER RECHARGES    | Unlimited |
      | CURRENT RECHARGE AMOUNT | [blank]   |
      | MAX RECHARGE AMOUNT     | Unlimited |

  Scenario: C91653719: Credit Risk pane on Payment info page
    When I click on Query tab in React application
      And I set 941172001 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Unverified in Credit Risk pane
      And I should see Risk Modified Date equals 07/22/2021 04:18 in Payment Info page
      And I should see Creation IP equals - in Payment Info page
      And I should see Escrowed Amount equals $27.50 in Payment Info page
      And I should see Balance Allowance equals $2.50 in Payment Info page
      And I should see Initial Balance equals $5.00 in Payment Info page
      And I should see Balance Loss equals $0.00 in Payment Info page
