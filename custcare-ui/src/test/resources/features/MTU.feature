@React @MtuQuery
Feature: MTU Query Feature
  In order to test the MTU query functionality in React application
  As a user I want to verify that MTU query is working properly

  Background: Login to custcare portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  Scenario: C89219332: MTU search with empty fields. Error message validation
    When I click on MTU on Mtu Page in React application
      And I click on SEARCH on Mtu Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Can't fetch data, try again or contact support displayed in Search Result page
      And I close alert message

  Scenario: C89219340: MTU search by PHONE with no transactions found
    When I click on Query tab in React application
      And I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2020-12-07 date in START DATE field in React application
      And I put 2020-12-07 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9734386154" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I verify that No Data message displays if no transactions found on Mtu Transactions Page

  Scenario: C89219341: MTU search by USERNAME with no transactions found
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2020-12-07 date in START DATE field in React application
      And I put 2020-12-07 date in END DATE field in React application
      And I fill USERNAME field with "username@test.com" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I verify that No Data message displays if no transactions found on Mtu Transactions Page

  Scenario: C89219342: MTU search by USERNAME with blank space
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with " manoj.joshi+rc01@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then "Enter the correct email" message displayed in User Name field in MTU page
    When I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with "manoj.joshi+rc01@idt.net " value in React application
      And I click on SEARCH on Mtu Page in React application
    Then "Enter the correct email" message displayed in User Name field in MTU page
    When I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with " manoj.joshi+rc01@idt.net " value in React application
      And I click on SEARCH on Mtu Page in React application
    Then "Enter the correct email" message displayed in User Name field in MTU page

  Scenario: C89362955: MTU search by PHONE by one day
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9084846763" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |

  Scenario: C89219352: MTU search by USERNAME by one day
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with "manoj.joshi+rc01@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |

  Scenario: C89362954: MTU search by PHONE by date range
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9084846763" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |

  Scenario: C89219366: MTU search by USERNAME by date range
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill USERNAME field with "manoj.joshi+rc01@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |

  Scenario: C89233031: Transactions search by Mobile Operator
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with "denis.shkliannik@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country    | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 11:09 AM | IMTU    | Guatemala  | Tigo            | 19088000883 | 50241008193       | $14.00 | Redeemed |
      | 8/6/2021 11:08 AM | IMTU    | DO         | Claro           | 19088000883 | 50241008193       | $6.00  | Fail     |
      | 8/6/2021 11:07 AM | IMTU    | AR         | Movistar        | 19088000883 | 50241008193       | $14.00 | Fail     |
      | 8/6/2021 9:54 AM  | IMTU    | BO         | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 9:02 AM  | IMTU    | ElSalvador | Digicel         | 19088000883 | 50241008193       | $2.00  | Fail     |
      | 8/6/2021 8:46 AM  | IMTU    | Colombia   | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
    When I click MOBILE OPERATOR SEARCH button on Mtu Transactions Page
      And I put Movistar date in MOBILE OPERATOR SEARCH FIELD in MTU Transactions page in React application
      And I click SEARCH MOBILE OPERATOR button on Mtu Transactions Page
      And I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 11:07 AM | IMTU    | AR      | Movistar        | 19088000883 | 50241008193       | $14.00 | Fail     |
    When I click MOBILE OPERATOR SEARCH button on Mtu Transactions Page
      And I click RESET button on Mtu Transactions Page
    Then I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country    | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 11:09 AM | IMTU    | Guatemala  | Tigo            | 19088000883 | 50241008193       | $14.00 | Redeemed |
      | 8/6/2021 11:08 AM | IMTU    | DO         | Claro           | 19088000883 | 50241008193       | $6.00  | Fail     |
      | 8/6/2021 11:07 AM | IMTU    | AR         | Movistar        | 19088000883 | 50241008193       | $14.00 | Fail     |
      | 8/6/2021 9:54 AM  | IMTU    | BO         | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 9:02 AM  | IMTU    | ElSalvador | Digicel         | 19088000883 | 50241008193       | $2.00  | Fail     |
      | 8/6/2021 8:46 AM  | IMTU    | Colombia   | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |

  Scenario: C89233032: Pagination validation in Transactions page
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-06 date in END DATE field in React application
      And I fill USERNAME field with "denis.shkliannik@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country    | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 11:09 AM | IMTU    | Guatemala  | Tigo            | 19088000883 | 50241008193       | $14.00 | Redeemed |
      | 8/6/2021 11:08 AM | IMTU    | DO         | Claro           | 19088000883 | 50241008193       | $6.00  | Fail     |
      | 8/6/2021 11:07 AM | IMTU    | AR         | Movistar        | 19088000883 | 50241008193       | $14.00 | Fail     |
      | 8/6/2021 9:54 AM  | IMTU    | BO         | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 9:02 AM  | IMTU    | ElSalvador | Digicel         | 19088000883 | 50241008193       | $2.00  | Fail     |
      | 8/6/2021 8:46 AM  | IMTU    | Colombia   | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
    When I click NEXT PAGE button on Mtu Transactions Page
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 8:44 AM | IMTU    | BO        | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 8:43 AM | IMTU    | BO        | Tigo            | 19088000883 | 50241008193       | $7.00  | Fail     |
      | 8/6/2021 8:42 AM | IMTU    | Guatemala | Claro           | 19088000883 | 50241008193       | $6.00  | Redeemed |
      | 8/6/2021 8:38 AM | IMTU    | BO        | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 3:34 AM | IMTU    | Guatemala | Claro           | 19088000883 | 50241008193       | $5.00  | Redeemed |
    When I click PREVIOUS PAGE button on Mtu Transactions Page
    Then I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country    | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/6/2021 11:09 AM | IMTU    | Guatemala  | Tigo            | 19088000883 | 50241008193       | $14.00 | Redeemed |
      | 8/6/2021 11:08 AM | IMTU    | DO         | Claro           | 19088000883 | 50241008193       | $6.00  | Fail     |
      | 8/6/2021 11:07 AM | IMTU    | AR         | Movistar        | 19088000883 | 50241008193       | $14.00 | Fail     |
      | 8/6/2021 9:54 AM  | IMTU    | BO         | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |
      | 8/6/2021 9:02 AM  | IMTU    | ElSalvador | Digicel         | 19088000883 | 50241008193       | $2.00  | Fail     |
      | 8/6/2021 8:46 AM  | IMTU    | Colombia   | Tigo            | 19088000883 | 50241008193       | $1.00  | Fail     |

  Scenario: C89233515: Transactions search by Destination Phone #
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-06 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill USERNAME field with "manoj.joshi+rc01@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |
    When I click DESTINATION PHONE SEARCH button on Mtu Transactions Page
      And I put 233242834366 date in DESTINATION PHONE SEARCH FIELD in MTU Transactions page in React application
      And I click SEARCH DESTINATION PHONE button on Mtu Transactions Page
      And I compare transactions in MTU transactions page in React application:
        | Date	           | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
        | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
    When I click DESTINATION PHONE SEARCH button on Mtu Transactions Page
      And I click RESET button on Mtu Transactions Page
    When I click DESTINATION PHONE SEARCH button on Mtu Transactions Page
      And I put 50241008192 date in DESTINATION PHONE SEARCH FIELD in MTU Transactions page in React application
      And I click SEARCH DESTINATION PHONE button on Mtu Transactions Page
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
      | 8/6/2021 9:34 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $5.00  | Redeemed |

  Scenario: C89746791: MTU Search: Use default search range of 14 days
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays LAST 14 DAYS date
    When I choose TODAY date in calendar
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays TODAY date
    When I choose YESTERDAY date in calendar
    Then I verify that END DATE field displays YESTERDAY date
      And I verify that START DATE field displays YESTERDAY date
    When I choose LAST 7 DAYS date in calendar
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays LAST 7 DAYS date
    When I choose LAST 14 DAYS date in calendar
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays LAST 14 DAYS date
    When I choose LAST 30 DAYS date in calendar
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays LAST 30 DAYS date
    When I choose LAST 90 DAYS date in calendar
    Then I verify that END DATE field displays TODAY date
      And I verify that START DATE field displays LAST 90 DAYS date

  Scenario: C92190416 Verify that the "User Number" field is disabled if the "Phone number" field is filled in MTU search page.
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2020-12-08 date in START DATE field in React application
      And I put 2020-12-08 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9734386154" value in React application
    Then I verify that USERNAME is in read only

  Scenario: C92190417 Verify that the "Phone number" field is disabled if the "User name" field is filled in MTU search page.
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2020-12-08 date in START DATE field in React application
      And I put 2020-12-08 date in END DATE field in React application
      And I fill USERNAME field with "test" value in React application
    Then I verify that PHONE NUMBER is in read only

  Scenario: C92128700: Search for DTC transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9084846763" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |

  Scenario: C92415237: Search for CallingApp transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "19739797521" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date             | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:39 AM | IMTU    | GH        | MTN             | 19739797521 | 233240183507      | $10.00 | Redeemed |
      | 8/9/2021 6:36 AM | IMTU    | GH        | MTN             | 19739797521 | 233240023222      | $10.00 | Redeemed |
      | 8/9/2021 6:34 AM | IMTU    | GH        | MTN             | 19739797521 | 233240049482      | $7.00  | Redeemed |
      | 8/9/2021 6:25 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:24 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:22 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |

  Scenario: C92416291: Search for MoneyApp transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-05 date in START DATE field in React application
      And I put 2021-08-05 date in END DATE field in React application
      And I fill PHONE NUMBER field with "16465161351" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |

  Scenario: C92128703: See additional "DTC Info" details of DTC transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9084846763" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
    When I click expand button for transaction with 8/9/2021 6:53 AM Date
    Then I should see Credit Card Authorized Status equals Delayed Capture in MTU page
      And I should see Transaction Type equals Real time recharge in MTU page
      And I should see Product Type equals IMTU in MTU page
      And I should see Credit Card Type equals Visa in MTU page
      And I should see Purchase Amount equals $10.00 in MTU page
      And I should see Transaction Status equals Approved in MTU page
      And I should see Transaction Date equals 8/9/2021 6:53 AM in MTU page
      And I should see Credit Card Number equals 40XXXXXXXXXX1129 in MTU page
      And I should see Authorization Code equals 123457 in MTU page
      And I should see Reference ID equals D502455940 in MTU page
      And I should see Response Code equals 0 in MTU page
      And I should see First Purchase Source equals Customer in MTU page
      And I should see Second Purchase Source equals Boss Portal in MTU page
      And I should see Third Purchase Source equals US in MTU page

  Scenario: C92129766: See additional "MTU Details" tab of DTC transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "9084846763" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	         | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:53 AM | IMTU    | GH        | MTN             | 19084846763 | 233242834366      | $10.00 | Redeemed |
      | 8/9/2021 5:14 AM | IMTU    | Guatemala | Claro           | 19084846763 | 50241008192       | $7.00  | Redeemed |
    When I click expand button for transaction with 8/9/2021 6:53 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 45783 in MTU page
      And I should see External Reference ID equals 301850656919 in MTU page
      And I should see Sender Phone equals 19084846763 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals $7.85 in MTU page

  Scenario: C92432460: See additional "DTC Info" details of CallingApp transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "19739797521" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date             | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:39 AM | IMTU    | GH        | MTN             | 19739797521 | 233240183507      | $10.00 | Redeemed |
      | 8/9/2021 6:36 AM | IMTU    | GH        | MTN             | 19739797521 | 233240023222      | $10.00 | Redeemed |
      | 8/9/2021 6:34 AM | IMTU    | GH        | MTN             | 19739797521 | 233240049482      | $7.00  | Redeemed |
      | 8/9/2021 6:25 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:24 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:22 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
    When I click expand button for transaction with 8/9/2021 6:39 AM Date
    Then I should see Credit Card Authorized Status equals Delayed Capture in MTU page
      And I should see Transaction Type equals Real time recharge in MTU page
      And I should see Product Type equals IMTU in MTU page
      And I should see Credit Card Type equals Visa in MTU page
      And I should see Purchase Amount equals $10.00 in MTU page
      And I should see Transaction Status equals Approved in MTU page
      And I should see Transaction Date equals 8/9/2021 6:39 AM in MTU page
      And I should see Credit Card Number equals ************0001 in MTU page
      And I should see Authorization Code equals 123457 in MTU page
      And I should see Reference ID equals D502455840 in MTU page
      And I should see Response Code equals 0 in MTU page
      And I should see First Purchase Source equals Customer in MTU page
      And I should see Second Purchase Source equals BW Calling App in MTU page
      And I should see Third Purchase Source equals iOS in MTU page

  Scenario: C92432462: See additional "MTU Details" tab of CallingApp transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "19739797521" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date             | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:39 AM | IMTU    | GH        | MTN             | 19739797521 | 233240183507      | $10.00 | Redeemed |
      | 8/9/2021 6:36 AM | IMTU    | GH        | MTN             | 19739797521 | 233240023222      | $10.00 | Redeemed |
      | 8/9/2021 6:34 AM | IMTU    | GH        | MTN             | 19739797521 | 233240049482      | $7.00  | Redeemed |
      | 8/9/2021 6:25 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:24 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:22 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
    When I click expand button for transaction with 8/9/2021 6:39 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 45783 in MTU page
      And I should see External Reference ID equals 301850571415 in MTU page
      And I should see Sender Phone equals 19739797521 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals $7.85 in MTU page

  Scenario: C92432461: See additional "DTC Info" details of MoneyApp transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-05 date in START DATE field in React application
      And I put 2021-08-05 date in END DATE field in React application
      And I fill PHONE NUMBER field with "16465161351" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |
    When I click expand button for transaction with 8/5/2021 10:30 AM Date
    Then I should see Credit Card Authorized Status equals Delayed Capture in MTU page
      And I should see Transaction Type equals Real time recharge in MTU page
      And I should see Product Type equals IMTU in MTU page
      And I should see Credit Card Type equals Visa in MTU page
      And I should see Purchase Amount equals $7.00 in MTU page
      And I should see Transaction Status equals Approved in MTU page
      And I should see Transaction Date equals 8/5/2021 10:30 AM in MTU page
      And I should see Credit Card Number equals 41XXXXXXXXXX1111 in MTU page
      And I should see Authorization Code equals 123457 in MTU page
      And I should see Reference ID equals D502447175 in MTU page
      And I should see Response Code equals 0 in MTU page
      And I should see First Purchase Source equals Customer in MTU page
      And I should see Second Purchase Source equals BW Calling App in MTU page

  Scenario: C92432463: See additional "MTU Details" tab of MoneyApp transaction
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-05 date in START DATE field in React application
      And I put 2021-08-05 date in END DATE field in React application
      And I fill PHONE NUMBER field with "16465161351" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:30 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $7.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |
      | 8/5/2021 10:03 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50241008192       | $5.00  | Redeemed |
    When I click expand button for transaction with 8/5/2021 10:30 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 30103162817382022 in MTU page
      And I should see External Reference ID equals 30103162817382022 in MTU page
      And I should see Sender Phone equals 16465161351 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals $7.00 in MTU page

  Scenario: C92864515: MTU search by Destination Phone Number by one day
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-09-01 date in START DATE field in React application
      And I put 2021-09-01 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date             | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 9/1/2021 7:50 AM | IMTU    | Guatemala | Tigo            | 9025550100  | 41008192          | $7.00  | Redeemed |

  Scenario: C92864516: MTU search by Destination Phone Number by date range
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-09-01 date in START DATE field in React application
      And I put 2021-09-06 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 9/6/2021 11:17 AM | IMTU    | Guatemala | Tigo            | 9025550100  | 41008192          | $7.00  | Redeemed |
      | 9/1/2021 7:50 AM  | IMTU    | Guatemala | Tigo            | 9025550100  | 41008192          | $7.00  | Redeemed |

  Scenario: C92864524: Failed transactions are not displayed if search MTU by Destination Phone Number
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-09-01 date in START DATE field in React application
      And I put 2021-09-06 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 9/6/2021 11:17 AM | IMTU    | Guatemala | Tigo            | 9025550100  | 41008192          | $7.00  | Redeemed |
      | 9/1/2021 7:50 AM  | IMTU    | Guatemala | Tigo            | 9025550100  | 41008192          | $7.00  | Redeemed |
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
    Then I put 2021-07-04 date in START DATE field in React application
      And I put 2021-10-01 date in END DATE field in React application
      And I fill PHONE NUMBER field with "16465161351" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/11/2021 5:25 AM | IMTU    | BO        | Tigo            | 16465161351 | 59155511568       | $1.00  | Fail     |
      | 8/11/2021 5:25 AM | IMTU    | BO        | Tigo            | 16465161351 | 59155511568       | $1.00  | Fail     |
      | 8/11/2021 4:17 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50212335546       | $5.00  | Redeemed |
      | 8/11/2021 4:17 AM | IMTU    | Guatemala | Claro           | 16465161351 | 50212335546       | $5.00  | Redeemed |
      | 8/11/2021 4:06 AM | IMTU    | MX        | Telcel          | 16465161351 | 524558411657      | $11.00 | Fail     |
      | 8/11/2021 4:06 AM | IMTU    | MX        | Telcel          | 16465161351 | 524558411657      | $11.00 | Fail     |

  Scenario: C92864539: Retailer Info details for International e-Gift product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-04 date in START DATE field in React application
      And I put 2021-10-04 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product              | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 10/4/2021 4:10 AM | International E-Gift | Guatemala | Tomza_TROPIGAS  | -           | 41008192          | $63.00 | Redeemed |
    When I click expand button for transaction with 10/4/2021 4:10 AM Date
    Then I should see Retailer ID equals 1135329746 in MTU page
      And I should see Commission equals $1.50 in MTU page

  Scenario: C92864540: MTU Details for International e-Gift product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-04 date in START DATE field in React application
      And I put 2021-10-04 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product              | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 10/4/2021 4:10 AM | International E-Gift | Guatemala | Tomza_TROPIGAS  | -           | 41008192          | $63.00 | Redeemed |
    When I click expand button for transaction with 10/4/2021 4:10 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 9W-LZ7P-J194 in MTU page
      And I should see External Reference ID equals 3021633335052038 in MTU page
      And I should see Sender Phone equals - in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals Q440.00 in MTU page

  Scenario: C92864698: Retailer Info details for Domestic e-Gift product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-04 date in START DATE field in React application
      And I put 2021-10-04 date in END DATE field in React application
      And I fill MSISDN field with "5024100819" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product         | Country | Mobile Operator     | Sender Phone| Destination Phone | Amount  | Status   |
      | 10/4/2021 4:06 AM | Domestic E-Gift | US      | CashStar_Burlington | -           | 5024100819        | $100.00 | Redeemed |
    When I click expand button for transaction with 10/4/2021 4:06 AM Date
    Then I should see Retailer ID equals 1135329746 in MTU page
      And I should see Commission equals $2.50 in MTU page

  Scenario: C92864699: MTU Details for Domestic e-Gift product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-04 date in START DATE field in React application
      And I put 2021-10-04 date in END DATE field in React application
      And I fill MSISDN field with "5024100819" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product         | Country | Mobile Operator     | Sender Phone| Destination Phone | Amount  | Status   |
      | 10/4/2021 4:06 AM | Domestic E-Gift | US      | CashStar_Burlington | -           | 5024100819        | $100.00 | Redeemed |
    When I click expand button for transaction with 10/4/2021 4:06 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 36397937 in MTU page
      And I should see External Reference ID equals 302163333477900 in MTU page
      And I should see Sender Phone equals - in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals $100.00 in MTU page

  Scenario: C92864700: Retailer Info details for DMTU product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-01 date in START DATE field in React application
      And I put 2021-10-01 date in END DATE field in React application
      And I fill MSISDN field with "5024100819" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 10/1/2021 9:55 AM | DMTU    | US      | IS_Verizon      | 5024100819  | 5024100819        | $30.00 | Redeemed |
    When I click expand button for transaction with 10/1/2021 9:55 AM Date
    Then I should see Retailer ID equals 1135329746 in MTU page
      And I should see Commission equals $0.60 in MTU page

  Scenario: C92864701: MTU Details for DMTU product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-01 date in START DATE field in React application
      And I put 2021-10-01 date in END DATE field in React application
      And I fill MSISDN field with "5024100819" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product | Country | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 10/1/2021 9:55 AM | DMTU    | US      | IS_Verizon      | 5024100819  | 5024100819        | $30.00 | Redeemed |
    When I click expand button for transaction with 10/1/2021 9:55 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 807308447 in MTU page
      And I should see External Reference ID equals 30122163309653259 in MTU page
      And I should see Sender Phone equals 5024100819 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals $30.00 in MTU page

  Scenario: C92864702: Retailer Info details for IMTU product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-01 date in START DATE field in React application
      And I put 2021-10-01 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product              | Country   | Mobile Operator       | Sender Phone| Destination Phone | Amount | Status   |
      | 10/1/2021 9:54 AM | IMTU                 | Guatemala | Tigo                  | 6465161351  | 41008192          | $7.00  | Redeemed |
      | 10/1/2021 8:21 AM | International E-Gift | Guatemala | RapiMovil_AgenciasWay | -           | 41008192          | $25.00 | Redeemed |
    When I click expand button for transaction with 10/1/2021 9:54 AM Date
    Then I should see Retailer ID equals 1135329746 in MTU page
      And I should see Commission equals $0.63 in MTU page

  Scenario: C92864703: MTU Details for IMTU product
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-01 date in START DATE field in React application
      And I put 2021-10-01 date in END DATE field in React application
      And I fill MSISDN field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date              | Product              | Country   | Mobile Operator       | Sender Phone| Destination Phone | Amount | Status   |
      | 10/1/2021 9:54 AM | IMTU                 | Guatemala | Tigo                  | 6465161351  | 41008192          | $7.00  | Redeemed |
      | 10/1/2021 8:21 AM | International E-Gift | Guatemala | RapiMovil_AgenciasWay | -           | 41008192          | $25.00 | Redeemed |
    When I click expand button for transaction with 10/1/2021 9:54 AM Date
      And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 1802608291 in MTU page
      And I should see External Reference ID equals 301111633096456310 in MTU page
      And I should see Sender Phone equals 6465161351 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals Q50.40 in MTU page

  Scenario: C92891938  MTU page is able to search by Destination Phone Number of K2 Transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-06 date in START DATE field in React application
      And I put 2021-10-06 date in END DATE field in React application
      And I fill USERNAME field with "k2test@idt.net" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date	          | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status |
      | 10/6/2021 7:09 PM | IMTU    | IT        | Vodafone        |             | 393823645241      | E6.00  | FAILED |

  Scenario: C92891939 MTU page is able to search by Sender's Customer Phone of K2 Transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-07 date in START DATE field in React application
      And I put 2021-10-20 date in END DATE field in React application
      And I fill DESTINATION PHONE NUMBER field with "41008192" value in React application
      And I click on SEARCH on Mtu Page in React application
     Then I compare transactions in MTU transactions page in React application:
      | Date	           | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 10/19/2021 2:08 PM | IMTU    | Guatemala | Tigo            | 7328295913  | 41008192          | $14.00 | Redeemed |

  Scenario: C92891940  MTU page is able to search by Destination Phone Number of K2 Transactions
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-21 date in START DATE field in React application
      And I put 2021-10-21 date in END DATE field in React application
      And I fill PHONE NUMBER field with "497328295913" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product | Country     | Mobile Operator | Sender Phone| Destination Phone | Amount     | Status    |
      | 10/21/2021 9:16 PM |   IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | COMPLETED |
      | 10/21/2021 9:16 PM |   IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | COMPLETED |
      | 10/21/2021 12:46 PM |  IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | COMPLETED |
      | 10/21/2021 12:46 PM |  IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | FAILED    |
      | 10/21/2021 12:46 PM |  IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | COMPLETED |
      | 10/21/2021 12:46 PM |  IMTU  |    ES       | Vodafone        | -           | +34674446155      | E5.30      | COMPLETED |

  Scenario:C92968844 Operator name is displayed in K2 transactions - MTU
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-27 date in START DATE field in React application
      And I put 2021-10-27 date in END DATE field in React application
      And I fill PHONE NUMBER field with "497328295913" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product    | Country      | Mobile Operator | Sender Phone| Destination Phone | Amount  | Status    |
      | 10/27/2021 9:43 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | NG           | Airtel          | -           | +2347164536721    | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |

  Scenario:C92970223  Aggregator and External Product ID added in K2 transactions details - MTU
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-27 date in START DATE field in React application
      And I put 2021-10-27 date in END DATE field in React application
      And I fill PHONE NUMBER field with "497328295913" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product    | Country      | Mobile Operator | Sender Phone| Destination Phone | Amount  | Status    |
      | 10/27/2021 9:43 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | NG           | Airtel          | -           | +2347164536721    | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
    When I click expand button for transaction with 10/27/2021 9:43 PM Date
    And I click on MTU DETAILS on Mtu Page in React application
    Then I should see Aggregator equals DingV3 in MTU page
    And I should see External Product ID equals VFITIT83847 in MTU page

  Scenario:C92981769 IMTU Details Displays Sender Phone Number
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-10-27 date in START DATE field in React application
      And I put 2021-10-27 date in END DATE field in React application
      And I fill PHONE NUMBER field with "497328295913" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product    | Country      | Mobile Operator | Sender Phone| Destination Phone | Amount  | Status    |
      | 10/27/2021 9:43 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | NG           | Airtel          | -           | +2347164536721    | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | IT           | Vodafone        | -           | +393823645241     | E6.00   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
      | 10/27/2021 9:34 PM | IMTU       | ES           | Vodafone        | -           | +34674446155      | E5.30   | COMPLETED |
    When I click expand button for transaction with 10/27/2021 9:43 PM Date
      And I click on MTU DETAILS on Mtu Page in React application
      And I should see Sender Phone equals +497328295913 in MTU page

  Scenario:C93005542 MTU search of HardCard transaction by PIN
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I fill PIN field with "8465224869" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product | Country | Mobile Operator | Sender Phone| Destination Phone | Amount     | Status   |
      | 12/1/2021 12:25 PM | IMTU    | MA      | Baluwo          | 5917748355  | 21260664876234    | 5.00Dirham | Redeemed |
    When I click expand button for transaction with 12/1/2021 12:25 PM Date
    Then I should see Retailer ID equals - in MTU page
      And I should see Commission equals - in MTU page
    When I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 605 in MTU page
      And I should see External Reference ID equals 4021638379525 in MTU page
      And I should see Sender Phone equals 5917748355 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals 4.00Dirham in MTU page
      And I should see Aggregator equals - in MTU page
      And I should see External Product ID equals - in MTU page

  Scenario:C93005543 MTU search of DTC transaction by PIN
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I fill PIN field with "40482702454" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product    | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 11/15/2021 4:01 AM | IMTU       | Guatemala | Tigo            | 16465161351 | 41008192          | $14.00 | Redeemed |
    When I click expand button for transaction with 11/15/2021 4:01 AM Date
    Then I should see Credit Card Authorized Status equals Delayed Capture in MTU page
      And I should see Transaction Type equals Real time recharge in MTU page
      And I should see Product Type equals IMTU in MTU page
      And I should see Credit Card Type equals Visa in MTU page
      And I should see Purchase Amount equals $14.00 in MTU page
      And I should see Transaction Status equals Approved in MTU page
      And I should see Transaction Date equals 11/15/2021 4:01 AM in MTU page
      And I should see Credit Card Number equals 41XXXXXXXXXXXXX1111 in MTU page
      And I should see Credit Card Handle equals 2100000951 in MTU page
      And I should see Authorization Code equals 123457 in MTU page
      And I should see Reference ID equals D502802103 in MTU page
      And I should see Response Code equals 0 in MTU page
      And I should see First Purchase Source equals Customer in MTU page
      And I should see Second Purchase Source equals BW Calling App in MTU page
    When I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 132520758 in MTU page
      And I should see External Reference ID equals 401111636966916724 in MTU page
      And I should see Sender Phone equals 16465161351 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals Q100.00 in MTU page
      And I should see Aggregator equals - in MTU page
      And I should see External Product ID equals - in MTU page

  Scenario:C93005545 MTU search of Retail transaction by PIN
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I fill PIN field with "40499334037" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date               | Product    | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 11/23/2021 7:09 AM | IMTU       | Guatemala | Tigo            | 6465161351  | 41008192          | $7.00  | Reversed |
      | 11/15/2021 5:20 AM | IMTU       | Guatemala | Tigo            | 6465161351  | 41008192          | $7.00  | Redeemed |
    When I click expand button for transaction with 11/15/2021 5:20 AM Date
    Then I should see Retailer ID equals 1135329746 in MTU page
      And I should see Commission equals $0.63 in MTU page
    When I click on MTU DETAILS on Mtu Page in React application
    Then I should see Receipt Number equals 2067797478 in MTU page
      And I should see External Reference ID equals 301111636971629676 in MTU page
      And I should see Sender Phone equals 6465161351 in MTU page
      And I should see FX Rate Used equals MAP in MTU page
      And I should see Amount Received equals Q50.40 in MTU page
      And I should see Aggregator equals - in MTU page
      And I should see External Product ID equals - in MTU page

  Scenario:C93005546 MTU search by PIN. Error validation
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I fill PIN field with "asdf" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then "Only numbers are allowed" message displayed in PIN field in MTU page

  Scenario:C92208051 MTU history in reverse chronological order by default
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I put 2021-08-09 date in START DATE field in React application
      And I put 2021-08-09 date in END DATE field in React application
      And I fill PHONE NUMBER field with "19739797521" value in React application
      And I click on SEARCH on Mtu Page in React application
    Then I compare transactions in MTU transactions page in React application:
      | Date             | Product | Country   | Mobile Operator | Sender Phone| Destination Phone | Amount | Status   |
      | 8/9/2021 6:39 AM | IMTU    | GH        | MTN             | 19739797521 | 233240183507      | $10.00 | Redeemed |
      | 8/9/2021 6:36 AM | IMTU    | GH        | MTN             | 19739797521 | 233240023222      | $10.00 | Redeemed |
      | 8/9/2021 6:34 AM | IMTU    | GH        | MTN             | 19739797521 | 233240049482      | $7.00  | Redeemed |
      | 8/9/2021 6:25 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:24 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |
      | 8/9/2021 6:22 AM | IMTU    | Guatemala | Tigo            | 19739797521 | 50279995555       | $7.00  | Fail     |

  Scenario: C93045609 Date Range is disabled when search by PIN
    When I click on Query tab in React application
      And I click on MTU on Mtu Page in React application
      And I fill PIN field with "40482702454" value in React application
    Then I verify that DATE RANGE is in read only