@React @ReactSearchResult @SearchResult
Feature: Search Result
  I want to verify that contents in search result page is displayed properly in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  Scenario: C89148734: Search Result: Credit Risk is null
    When I click on Query tab in React application
      And I set 378686608 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Not Set in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Not Set in Credit Risk pane

  Scenario: C89149226: Search Result: Credit Risk = "N"
    When I click on Query tab in React application
      And I set 4429934805 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Not Set in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Not Set in Credit Risk pane

  Scenario: C89149227: Search Result: Credit Risk = "V"
    When I click on Query tab in React application
      And I set 2003813799 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Verified in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Verified in Credit Risk pane

  Scenario: C89149228: Search Result: Credit Risk = "R"
    When I click on Query tab in React application
      And I set 2003842204 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Auto-Fraud in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Auto-Fraud in Credit Risk pane

  Scenario: C89149229: Search Result: Credit Risk = "U"
    When I click on Query tab in React application
      And I set 2003819841 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Unverified in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Unverified in Credit Risk pane

  Scenario: C89149230: Search Result: Credit Risk = "G"
    When I click on Query tab in React application
      And I set 2003818479 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Auto-Verified in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Auto-Verified in Credit Risk pane

  Scenario: C89149231: Search Result: Credit Risk = "F"
    When I click on Query tab in React application
      And I set 9099999023 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Credit Risk equals Fraud in Search Result page
    When I click PAYMENT INFO button in Search Result Page
    Then I should see CREDIT RISK equals Fraud in Credit Risk pane

  Scenario: C89320573: Search Result: Product section verification
    When I click on Query tab in React application
      And I set 6597751687 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verify that Balance equals to $28.50 in Search Result Page
      And I should see Pin equals 6597751687 in Search Result page
      And I should see Ctrl Number equals 4431741692 in Search Result page
      And I should see Plans equals 1) DS plan1 in Search Result page
      And I should see Program equals 14072 Boss Revolution Customer in Search Result page

  Scenario: C90770863: Search Result: Info Panel validation in Product section
    When I click on Query tab in React application
      And I set 89400001 Control Number in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click PLAN (I) button in Search Result Page
      And I should see Activation Date equals 10/31/2002 in Info panel
      And I should see First Call Made equals 12/09/2004 in Info panel
      And I should see Last Use Date equals 08/12/2009 in Info panel
      And I should see Last Service Charge equals 11/09/2004 in Info panel

  Scenario: C90770864: Search Result: Promo & Cash Balance validation for Min account
    When I click on Query tab in React application
      And I set 789400002 Control Number in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click BALANCE (?) button in Search Result Page
      And I verify that Balance equals to 264Min in Search Result Page
      And I should see Promo equals - in Info panel
      And I should see Cash equals - in Info panel
    When I click PAYMENT INFO button in Search Result Page
    Then I click BALANCE (?) button in Search Result Page
      And I verify that Balance equals to 264Min in Search Result Page
      And I should see Promo equals - in Info panel
      And I should see Cash equals - in Info panel
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
    Then I click BALANCE (?) button in Search Result Page
      And I verify that Balance equals to 264Min in Search Result Page
      And I should see Promo equals - in Info panel
      And I should see Cash equals - in Info panel

  Scenario: C90770865: Search Result: Promo & Cash Balance validation for $ account
    When I click on Query tab in React application
      And I set 4431291795 Control Number in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click BALANCE (?) button in Search Result Page
      And I verify that Balance equals to $651.35 in Search Result Page
      And I should see Promo equals $60.00 in Info panel
      And I should see Cash equals $591.35 in Info panel
    When I click PAYMENT INFO button in Search Result Page
    Then I verify that Balance equals to $651.35 in Search Result Page
    When I click BALANCE (?) button in Search Result Page
      And I should see Promo equals $60.00 in Info panel
      And I should see Cash equals $591.35 in Info panel
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
    When I click BALANCE (?) button in Search Result Page
      And I should see Promo equals $60.00 in Info panel
      And I should see Cash equals $591.35 in Info panel

  Scenario: C89320574: Search Result: Customer section verification
    When I click on Query tab in React application
      And I set 6597751687 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see First Name equals React in Search Result page
      And I should see Last Name equals App in Search Result page
      And I should see Phone Number equals 6597751687 in Search Result page
      And I should see Email equals test@test.test in Search Result page
      And I should see Street equals New Jersey 70 in Search Result page
      And I should see City, Zip/Postal Code equals Boston, 15849 in Search Result page
      And I should see State/Province equals New Jersey in Search Result page
      And I should see Country equals United States in Search Result page
      And I verifies that OPT-IN equals to ON displayed in Search Result page
      And I should see Credit Risk equals Auto-Verified in Search Result page

  Scenario: C90770866: Search Result: Account Status validation - In Use (M)
    When I click on Query tab in React application
      And I set 378686608 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page

  Scenario: C90771190: Search Result: Account Status validation - Expired (E)
    When I click on Query tab in React application
      And I set 335717354 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Expired displayed in Search Result page

  Scenario: C90771191: Search Result: Account Status validation - Disconnected (H)
    When I click on Query tab in React application
      And I set 4429932114 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page

  Scenario: C90771192: Search Result: Account Status validation - In Use (I)
    When I click on Query tab in React application
      And I set 2003844798 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page

  Scenario: C90771193: Search Result: Account Status validation - Unknown State (F)
    When I click on Query tab in React application
      And I set 378343012 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Unknown State displayed in Search Result page

  Scenario: C90771517: Search Result: Account Status validation - Provisioned (P)
    When I click on Query tab in React application
      And I set 784694819 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Provisioned displayed in Search Result page

  Scenario: C90771518: Search Result: Account Status validation - Active (A)
    When I click on Query tab in React application
      And I set 2003812816 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page

  Scenario: C90771712: Search Result: Account Status validation - Retired (R)
    When I click on Query tab in React application
      And I set 384662709 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page

  Scenario: C90772036: Search Result: Account Status validation - Suspended (S)
    When I click on Query tab in React application
      And I set 2007859870 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page

  Scenario: C90772037: Search Result: Account Status validation - PIN Reused (U)
    When I click on Query tab in React application
      And I set 2003826042 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to PIN Reused displayed in Search Result page

  Scenario: C90772038: Search Result: Account Status validation - Disabled (D)
    When I click on Query tab in React application
      And I set 4429893625 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disabled displayed in Search Result page

  Scenario: C89334055: Search Result: Recent Calls verification
      When I click on Query tab in React application
        And I set 5297703533 PIN in Query Search page in React application
        And I search for account in React application
        And I see Search Result in Search Result page
        And I compare recent calls in Search Result page:
        | Date/Time             | Duration | Cost  | Balance | DNIS       | Destination    | ANI        |
        | 11/24/2021 3:25:03 AM | 0:13     | $0.05 | $0.95	 | 7326405363 | 11532416640001 | 8282724023 |

  Scenario: C89664251: Review recent comments from a new Account
    When I click on Query tab in React application
      And I set 4431054584 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page

  Scenario: C89675303: Add new comment
    When I click on Query tab in React application
      And I set 2297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
      And I put Test Comment date in COMMENT TEXT field in Search Result in React application
      And I click ADD COMMENT button in Search Result Page
    Then I verifies that NOTIFICATION MESSAGE equals to Comment successfully added displayed in Search Result page
      And I close alert message
      And I verify that new added comment equals to Test Comment in Search Result Page

  Scenario: C89701177: Add new comment validation error
    When I click on Query tab in React application
    And I set 2297703533 PIN in Query Search page in React application
    And I search for account in React application
    And I see Search Result in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    And I put <>&'"!| date in COMMENT TEXT field in Search Result in React application
    And I click ADD COMMENT button in Search Result Page
    Then I verifies that NOTIFICATION MESSAGE equals to Symbols <>&'"!| are not allowed displayed in Search Result page
      And I close alert message

  Scenario: C90082463: User has no used promo codes
    When I click on Query tab in React application
      And I set 2297703533 PIN in Query Search page in React application
      And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
      And I verify that no data displayed in Used Promo Codes table

  Scenario: C90082541: See available used promo codes with Promo State = APPLIED
    When I click on Query tab in React application
    And I set 4429946346 Control Number in Query Search page in React application
    And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
    And I compare used promo codes in Search Result page:
      | Promo Code    | Redemption Date  | Promo State | Event    | Product Purchased      | Reward    | Promo Name    |
      | UNLIMPERCNOTH | 08/21/2017 02:40 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |

  Scenario: C90098406: See available used promo codes with Promo State = PENDING
    When I click on Query tab in React application
    And I set 4429955379 Control Number in Query Search page in React application
    And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
    And I compare used promo codes in Search Result page:
      | Promo Code     | Redemption Date  | Promo State | Event    | Product Purchased      | Reward      | Promo Name     |
      | UNLIMFIXEDNOTH | 09/20/2017 09:38 | PENDING     | RECHARGE | Boss Revolution Coupon | BONUS $2.00 | UNLIMFIXEDNOTH |

  Scenario: C90098408: See available used promo codes with Promo State = CANCELLED
    When I click on Query tab in React application
    And I set 4429949637 Control Number in Query Search page in React application
    And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
    And I compare used promo codes in Search Result page:
      | Promo Code     | Redemption Date  | Promo State | Event    | Product Purchased      | Reward      | Promo Name     |
      | UNLIMFIXEDNOTH | 09/04/2017 07:07 | CANCELLED   | RECHARGE | Boss Revolution Coupon | BONUS $2.00 | UNLIMFIXEDNOTH |

  Scenario: C90098409: See available used promo codes with Promo State = CANCELLEDX
    When I click on Query tab in React application
    And I set 4430163038 Control Number in Query Search page in React application
    And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
    And I compare used promo codes in Search Result page:
      | Promo Code | Redemption Date  | Promo State | Event    | Product Purchased      | Reward      | Promo Name      |
      | SERG7      | 07/30/2018 17:31 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS $1.00 | R180_PSPD2048_s |
      | SERG7      | 07/30/2018 17:31 | CANCELLEDX  | RECHARGE | Boss Revolution Coupon | BONUS $1.00 | R180_PSPD2048_s |

  Scenario: C90926800: Next best offer is displayed
    When I click on Query tab in React application
      And I set 7574128011 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Class ID equals 14072 in Search Result page
      And I should see Product Type equals BR PINLESS in Search Result page
      And I should see Program Name equals US BOSS REVOLUTION CUSTOMER in Search Result page

  Scenario: C90927670: Next best offer is not displayed
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Class ID equals - in Search Result page
      And I should see Product Type equals - in Search Result page
      And I should see Program Name equals - in Search Result page

  Scenario: C90138904: See available used promo codes list
    When I click on Query tab in React application
      And I set 4429978458 Control Number in Query Search page in React application
      And I search for account in React application
    When I click USED PROMO CODES button in Search Result Page
    Then I compare used promo codes in Search Result page:
      | Promo Code    | Redemption Date  | Promo State | Event    | Product Purchased      | Reward    | Promo Name    |
      | UNLIMPERCNOTH | 02/06/2018 15:48 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 01/19/2018 11:18 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/07/2017 10:24 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/06/2017 10:15 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:21 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:08 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:06 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 12:54 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 12:49 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 11:24 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
    When I select page 4 in Used Promo Codes pagination block
    Then I compare used promo codes in Search Result page:
      | Promo Code    | Redemption Date  | Promo State | Event    | Product Purchased      | Reward    | Promo Name    |
      | UNLIMPERCNOTH | 11/10/2017 15:04 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/10/2017 15:03 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/10/2017 15:03 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/10/2017 14:55 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/10/2017 14:54 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/08/2017 18:07 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 11/08/2017 17:49 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
    When I select page 1 in Used Promo Codes pagination block
    Then I compare used promo codes in Search Result page:
      | Promo Code    | Redemption Date  | Promo State | Event    | Product Purchased      | Reward    | Promo Name    |
      | UNLIMPERCNOTH | 02/06/2018 15:48 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 01/19/2018 11:18 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/07/2017 10:24 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/06/2017 10:15 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:21 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:08 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 16:06 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 12:54 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 12:49 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |
      | UNLIMPERCNOTH | 12/04/2017 11:24 | APPLIED     | RECHARGE | Boss Revolution Coupon | BONUS 10% | UNLIMPERCNOTH |

  Scenario: C92005571: Customer value indicator - VIP
    When I click on Query tab in React application
      And I set 4431286466 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see VIP label in Customer block in Search Result page

  Scenario: C92005572: Customer value indicator - High
    When I click on Query tab in React application
      And I set 4044213521 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see High label in Customer block in Search Result page

  Scenario: C92005573: Customer value indicator - Medium
    When I click on Query tab in React application
      And I set 3187008508 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Medium label in Customer block in Search Result page

  Scenario: C92005574: Customer value indicator - Low
    When I click on Query tab in React application
      And I set 4182116205 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see Low label in Customer block in Search Result page

  Scenario: C92005575: Customer value indicator - New to Pinless
    When I click on Query tab in React application
      And I set 4622011881 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see New to Pinless label in Customer block in Search Result page

  Scenario: C92005576: Customer value indicator - New to MT
    When I click on Query tab in React application
      And I set 4620334011 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see New to MT label in Customer block in Search Result page

  Scenario: C92005577: Customer value indicator - New to MTU
    When I click on Query tab in React application
      And I set 4617880549 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should see New to MTU label in Customer block in Search Result page

  Scenario: C92005917: Customer value indicator is not displayed
    When I click on Query tab in React application
      And I set 4432976355 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should not see any label in Customer block in Search Result page

  Scenario: C92862880 “Show all calls” button is displayed when there is at least 1 call to display
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
      And I compare recent calls in Search Result page:
        | Date/Time             | Duration | Cost  | Balance | DNIS       | Destination    | ANI        |
        | 11/24/2021 3:25:03 AM | 0:13     | $0.05 | $0.95	 | 7326405363 | 11532416640001 | 8282724023 |
    Then I should see Show all calls Link in Recent Calls Block

  Scenario: C92862881 show all calls” button is hidden if there are no calls for the account
    When I click on Query tab in React application
      And I set 6597752300 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I should not see Show all calls Link in Recent Calls Block

  Scenario: C92862877  “Show all calls” button is redirecting to Account History page
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
      And I compare recent calls in Search Result page:
      | Date/Time             | Duration | Cost  | Balance | DNIS       | Destination    | ANI        |
      | 11/24/2021 3:25:03 AM | 0:13     | $0.05 | $0.95   | 7326405363 | 11532416640001 | 8282724023 |
      And I click Show all calls link in Search Result Page
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event | Amount | Balance | Details        |
      | 11/24/2021 3:25:03 AM | Call  | $0.05  | $0.95   | 11532416640001 |
