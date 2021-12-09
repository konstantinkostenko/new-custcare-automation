@React @AccountHistory
Feature: Account History page
  In order to test the Account History page functionality in React application
  As a user I want to see the details of any event related to the credit/Debit/vouchers issues

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  Scenario: C92862594 Account History page is displayed Credit events by date ranges
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-04 date in START DATE field in React application
      And I put 2021-09-10 date in END DATE field in React application
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time           | Event  | Amount | Balance | Details |
      | 9/8/2021 2:05:21 PM | Credit | $10.00 | $59.50  | credit  |
      | 9/7/2021 2:43:37 PM | Credit | $50.00 | $59.50  | credit  |

  Scenario: C92862595 Account History page is displayed ALL events by date ranges
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-04 date in START DATE field in React application
      And I put 2021-09-04 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                        |
      | 9/4/2021 12:17:39 AM | Voucher recharge | $5.00  | -       | To Pin 6597751686              |
      | 9/4/2021 12:17:39 AM | Transaction      | $5.00  | -       | To Pin 6597751686              |
      | 9/4/2021 12:12:38 AM | Comment          | -      | -       | (testl9)Billing history viewed |
      | 9/4/2021 12:12:31 AM | Comment          | -      | -       | (testl8)Billing history viewed |
      | 9/4/2021 12:12:24 AM | Comment          | -      | -       | (testl7)Billing history viewed |
      | 9/4/2021 12:12:13 AM | Comment          | -      | -       | (testl6)Billing history viewed |

  Scenario: C92862596 Account History page is displayed Credit events detail
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-04 date in START DATE field in React application
      And I put 2021-09-10 date in END DATE field in React application
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time           | Event            | Amount | Balance | Details |
      | 9/8/2021 2:05:21 PM | Credit           | $10.00 | $59.50  | credit  |
      | 9/7/2021 2:43:37 PM | Credit           | $50.00 | $59.50  | credit  |
    When I click expand button for transaction with 9/7/2021 2:43:37 PM data in Account History page
    Then I should see User Type equals custsvc in Account History page
      And I should see User equals nflorero in Account History page
      And I should see Status equals not-debited in Account History page

  Scenario: C92862671	Verify that unchecked Credits options, credits events are not listed
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-04 date in START DATE field in React application
      And I put 2021-09-10 date in END DATE field in React application
      And I set the checkbox to checked for Credits Events in the Account History
      And I set the checkbox to checked for Voucher recharges Events in the Account History
      And I set the checkbox to checked for Debits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount  | Balance | Details           |
      | 9/8/2021 2:05:21 PM  | Credit           | $10.00  |	$59.50  | credit            |
      | 9/7/2021 5:54:21 PM  | Debit            | $10.00  |	$49.50  | debit             |
      | 9/7/2021 2:43:37 PM  | Credit           | $50.00  |	$59.50  | credit            |
      | 9/7/2021 2:38:50 PM  | Debit            | $5.00   |	$5.50   | debit             |
      | 9/6/2021 7:53:37 PM  | Voucher recharge | $5.00	  | -       | To Pin 6597751686 |
      | 9/6/2021 7:53:14 PM  | Voucher recharge | $5.00	  | -	    | To Pin 6597751686 |
      | 9/4/2021 12:17:39 AM | Voucher recharge | $5.00	  | -	    | To Pin 6597751686 |
    When I set the checkbox to unchecked for Credits Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount  | Balance | Details           |
      | 9/7/2021 5:54:21 PM  | Debit            | $10.00  |	$49.50  | debit             |
      | 9/7/2021 2:38:50 PM  | Debit            | $5.00   |	$5.50   | debit             |
      | 9/6/2021 7:53:37 PM  | Voucher recharge | $5.00	  | -       | To Pin 6597751686 |
      | 9/6/2021 7:53:14 PM  | Voucher recharge | $5.00	  | -	    | To Pin 6597751686 |
      | 9/4/2021 12:17:39 AM | Voucher recharge | $5.00	  | -	    | To Pin 6597751686 |

  Scenario: C92862763 Account History page is displayed Transaction events by date range
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Transactions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details           |
      | 8/19/2021 4:53:01 PM | Transaction      | $5.00  | -       | To Pin 6597751686 |
      | 8/19/2021 6:16:09 AM | Transaction      | $5.00  | -       | To Pin 6597751686 |

  Scenario: C92862764 Account History page is displayed Transactions event detail
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Transactions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details           |
      | 8/19/2021 4:53:01 PM | Transaction      | $5.00  | -       | To Pin 6597751686 |
      | 8/19/2021 6:16:09 AM | Transaction      | $5.00  | -       | To Pin 6597751686 |
    When I click expand button for transaction with 8/19/2021 6:16:09 AM data in Account History page
    Then I should see Transaction Type equals Transfer Out in Account History page
      And I should see User equals testl5 in Account History page

  Scenario: C92862765 Verify that unchecked Transaction options, Transaction events are not listed
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Comment Events in the Account History
      And I set the checkbox to checked for Voucher recharges Events in the Account History
      And I set the checkbox to checked for Transactions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                    |
      | 8/19/2021 4:53:01 PM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |
      | 8/19/2021 4:53:01 PM | Transaction      | $5.00  | -       | To Pin 6597751686                          |
      | 8/19/2021 7:17:46 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed - cnum |
      | 8/19/2021 7:17:45 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed        |
      | 8/19/2021 6:16:09 AM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |
      | 8/19/2021 6:16:09 AM | Transaction      | $5.00  | -       | To Pin 6597751686                          |
    When I set the checkbox to unchecked for Transactions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                    |
      | 8/19/2021 4:53:01 PM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |
      | 8/19/2021 7:17:46 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed - cnum |
      | 8/19/2021 7:17:45 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed        |
      | 8/19/2021 6:16:09 AM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |

  Scenario: C92862784 Account History page is displayed Voucher Recharge events by date ranges
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Voucher recharge Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details           |
      | 8/19/2021 4:53:01 PM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686 |
      | 8/19/2021 6:16:09 AM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686 |

  Scenario:  C92862785  Account History page is displayed Voucher Recharge events detail
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Voucher recharges Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details           |
      | 8/19/2021 4:53:01 PM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686 |
      | 8/19/2021 6:16:09 AM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686 |
    When I click expand button for transaction with 8/19/2021 6:16:09 AM data in Account History page
     And I should see User equals testl5 in Account History page

  Scenario: C92862786 Verify that unchecked Voucher Recharge options, Voucher Recharge events are not listed
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-19 date in START DATE field in React application
      And I put 2021-08-19 date in END DATE field in React application
      And I set the checkbox to checked for Comment Events in the Account History
      And I set the checkbox to checked for Voucher recharges Events in the Account History
      And I set the checkbox to checked for Transactions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                    |
      | 8/19/2021 4:53:01 PM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |
      | 8/19/2021 4:53:01 PM | Transaction      | $5.00  | -       | To Pin 6597751686                          |
      | 8/19/2021 7:17:46 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed - cnum |
      | 8/19/2021 7:17:45 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed        |
      | 8/19/2021 6:16:09 AM | Voucher recharge | $5.00	 | -	   | To Pin 6597751686                          |
      | 8/19/2021 6:16:09 AM | Transaction      | $5.00  | -       | To Pin 6597751686                          |
    When I set the checkbox to unchecked for Voucher recharges Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                    |
      | 8/19/2021 4:53:01 PM | Transaction      | $5.00  | -       | To Pin 6597751686                          |
      | 8/19/2021 7:17:46 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed - cnum |
      | 8/19/2021 7:17:45 AM | Comment          | -	     | -       | (omaliarenko)Billing history viewed        |
      | 8/19/2021 6:16:09 AM | Transaction      | $5.00  | -       | To Pin 6597751686                          |

  Scenario: C92862829  Account History page is displayed Promotions events by date ranges
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-27 date in START DATE field in React application
      And I put 2021-04-27 date in END DATE field in React application
      And I set the checkbox to checked for Promotions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event     | Amount | Balance | Details                                            |
      | 4/27/2021 4:02:51 PM | Promotion | $2.00  | -	    | Recharge Promo: Recharge promo for Dom B2B testing |

  Scenario: C92862830  Account History page is displayed Promotion event detail
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-27 date in START DATE field in React application
      And I put 2021-04-27 date in END DATE field in React application
      And I set the checkbox to checked for Promotions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event     | Amount | Balance | Details                                            |
      | 4/27/2021 4:02:51 PM | Promotion | $2.00  | -	    | Recharge Promo: Recharge promo for Dom B2B testing |
    When I click expand button for transaction with 4/27/2021 4:02:51 PM data in Account History page
    Then I should see Description equals Applied Recharge in Account History page
      And I should see Discount plan equals DS plan1 in Account History page
      And I should see Transaction ID equals D501682774-CC in Account History page

  Scenario: C92862831  Verify that unchecked Promotion options, Promotion events are not listed
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-27 date in START DATE field in React application
      And I put 2021-04-27 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I set the checkbox to checked for Voucher recharges Events in the Account History
      And I set the checkbox to checked for Promotions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                            |
      | 4/27/2021 4:06:35 PM | Voucher recharge | $5.00  |	-	   | To Pin 6597751686                                  |
      | 4/27/2021 4:02:51 PM | Promotion	    | $2.00  |	-	   | Recharge Promo: Recharge promo for Dom B2B testing |
      | 4/27/2021 4:02:51 PM | Delayed Capture	| $20.00 |	-	   | Approved                                           |
      | 4/27/2021 4:02:50 PM | Authorized       | $20.00 |	-	   | Approved, Delayed Capture                          |
      | 4/27/2021 8:09:07 AM | Voucher recharge | $5.00  |	-      | To Pin 6297703533                                  |
    When I set the checkbox to unchecked for Promotions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                   |
      | 4/27/2021 4:06:35 PM | Voucher recharge | $5.00  |	-	   | To Pin 6597751686         |
      | 4/27/2021 4:02:51 PM | Delayed Capture	| $20.00 |	-	   | Approved                  |
      | 4/27/2021 4:02:50 PM | Authorized       | $20.00 |	-	   | Approved, Delayed Capture |
      | 4/27/2021 8:09:07 AM | Voucher recharge | $5.00  |	-      | To Pin 6297703533         |

  Scenario: C92862720 Account History page is displayed Debit events by date ranges
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-20 date in START DATE field in React application
      And I put 2021-08-20 date in END DATE field in React application
      And I set the checkbox to checked for Debits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details |
      | 8/20/2021 2:04:01 AM | Debit | $1.00  | $50.40  | debit   |
      | 8/20/2021 1:54:54 AM | Debit | $1.00  | $51.40  | debit   |

  Scenario: C92862721 Account History page is displayed Debit events detail
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-20 date in START DATE field in React application
      And I put 2021-08-20 date in END DATE field in React application
      And I set the checkbox to checked for Debits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details |
      | 8/20/2021 2:04:01 AM | Debit | $1.00  | $50.40  | debit   |
      | 8/20/2021 1:54:54 AM | Debit | $1.00  | $51.40  | debit   |
    When I click expand button for transaction with 8/20/2021 1:54:54 AM data in Account History page
    Then I should see User Type equals custsvc in Account History page
      And I should see User equals vzapatylak in Account History page

  Scenario: C92862766  Account History page is displayed Payments events detail
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-29 date in START DATE field in React application
      And I put 2021-04-29 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event | Amount | Balance | Details    |
      | 4/29/2021 11:29:37 AM | Sale  | $5.00  | -       | Approved   |
      | 4/29/2021 10:49:43 AM | Sale  | $5.00  | -       | Error (12) |
      | 4/29/2021 10:47:59 AM | Sale  | $5.00  | -       | Error (12) |
    When I click expand button for transaction with 4/29/2021 10:47:59 AM data in Account History page
    Then I should see Card Type equals Visa in Account History page
      And I should see Credit Card Number equals 41XXXXXXXXXX1111 in Account History page
      And I should see Transaction Type equals Sale in Account History page
      And I should see Plan Name equals BR Unlimited 30-day Plan in Account History page
      And I should see CS Rep equals vzapatylak in Account History page
      And I should see Handle equals 2100000951 in Account History page

  Scenario: C92862723 Verify that unchecked Debit options, debit events are not listed
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-20 date in START DATE field in React application
      And I put 2021-08-20 date in END DATE field in React application
      And I set the checkbox to checked for Transactions Events in the Account History
      And I set the checkbox to checked for Debits Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event       | Amount | Balance | Details                 |
      | 8/20/2021 2:04:01 AM | Debit       | $1.00  | $50.40  | debit                   |
      | 8/20/2021 1:54:54 AM | Debit       | $1.00  | $51.40  | debit                   |
      | 8/20/2021 1:54:40 AM | Transaction | $9.50  | -       | Reactivation [D,S to A] |
    When I set the checkbox to unchecked for Debits Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event       | Amount | Balance | Details                 |
      | 8/20/2021 1:54:40 AM | Transaction | $9.50  | -       | Reactivation [D,S to A] |

  Scenario: C92862729 Account History page is displayed Payments events by date ranges
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-29 date in START DATE field in React application
      And I put 2021-04-29 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
     And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event | Amount | Balance | Details    |
      | 4/29/2021 11:29:37 AM | Sale  | $5.00  | -       | Approved   |
      | 4/29/2021 10:49:43 AM | Sale  | $5.00  | -       | Error (12) |
      | 4/29/2021 10:47:59 AM | Sale  | $5.00  | -       | Error (12) |

  Scenario: C92862767 Verify that unchecked Payments options, payment events are not listed
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-04-29 date in START DATE field in React application
      And I put 2021-04-29 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I set the checkbox to checked for Transactions Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event       | Amount | Balance | Details                           |
      | 4/29/2021 11:29:37 AM | Sale        | $5.00  | -       | Approved                          |
      | 4/29/2021 11:29:37 AM |	Transaction | $5.00  | -	   | Unlimited Plan Sale (Subscriber)  |
      | 4/29/2021 10:49:43 AM | Sale        | $5.00  | -       | Error (12)                        |
      | 4/29/2021 10:47:59 AM | Sale        | $5.00  | -       | Error (12)                        |
      | 4/29/2021 10:29:51 AM |	Transaction	| $5.00	 | -	   | Reactivation [D,S to A]           |
      | 4/29/2021 10:28:51 AM |	Transaction | $0.00  | -	   | Customer Removed from BlackListed |
    When I set the checkbox to unchecked for Payments Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event       | Amount | Balance | Details                           |
      | 4/29/2021 11:29:37 AM |	Transaction | $5.00  | -	   | Unlimited Plan Sale (Subscriber)  |
      | 4/29/2021 10:29:51 AM |	Transaction	| $5.00	 | -	   | Reactivation [D,S to A]           |
      | 4/29/2021 10:28:51 AM |	Transaction | $0.00  | -	   | Customer Removed from BlackListed |

  Scenario: C92862768 Account History page is displayed Comment events by date ranges
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-16 date in START DATE field in React application
      And I put 2021-09-16 date in END DATE field in React application
      And I set the checkbox to checked for Comment Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event   | Amount | Balance | Details                                    |
      | 9/16/2021 7:55:11 AM | Comment | -	    | -	      | (aserhiyenka)Billing history viewed - cnum |
      | 9/16/2021 7:55:10 AM | Comment | -	    | -	      | (aserhiyenka)Billing history viewed        |
      | 9/16/2021 7:21:49 AM | Comment | -	    | -	      | (kkostenko)Billing history viewed - cnum   |
      | 9/16/2021 6:32:24 AM | Comment | -	    | -	      | (aserhiyenka)Billing history viewed - cnum |
      | 9/16/2021 6:32:15 AM | Comment | -      | -	      | (aserhiyenka)Billing history viewed        |
      | 9/16/2021 6:21:04 AM | Comment | -	    | -	      | (aserhiyenka)Billing history viewed - cnum |
      | 9/16/2021 6:21:04 AM | Comment | -	    | -	      | (aserhiyenka)Billing history viewed        |
      | 9/16/2021 6:15:34 AM | Comment | -      | -	      | (kkostenko)Billing history viewed - cnum   |
      | 9/16/2021 5:24:16 AM | Comment | -      | -       |	(kkostenko)Billing history viewed - cnum   |

  Scenario: C92862769 Verify that unchecked Comments options, comment events are not listed
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-07-01 date in START DATE field in React application
      And I put 2021-07-01 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details                                        |
      | 7/1/2021 11:23:32 AM | Comment          | -      | -	   | (aserhiyenka)Billing history viewed - pin/cnum |
      | 7/1/2021 11:23:14 AM | Voucher recharge | $5.00  | -	   | From Pin 1122211222                            |
      | 7/1/2021 11:23:14 AM | Transaction      | $5.00  | -	   | From Pin 1122211222                            |
      | 7/1/2021 11:22:17 AM | Comment          | -      | -       | (aserhiyenka)Billing history viewed            |
    When I set the checkbox to checked for Voucher recharge Events in the Account History
      And I set the checkbox to checked for Transaction Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event            | Amount | Balance | Details             |
      | 7/1/2021 11:23:14 AM | Voucher recharge | $5.00  | -	   | From Pin 1122211222 |
      | 7/1/2021 11:23:14 AM | Transaction      | $5.00  | -	   | From Pin 1122211222 |

  Scenario: C92864321: Dashboard in Account History page
    When I click on Query tab in React application
      And I set 89400001 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
    Then I should see Company equals IDT in Account History page
      And I should see Card Name equals VoiceWeb Testing in Account History page
      And I should see Class Id equals 9494 in Account History page
      And I should see Control Number equals 89400001 in Account History page
      And I should see PIN equals 83789400001 in Account History page
      And I should see Balance equals 818692Min in Account History page
      And I should see Currency equals MIN (Min) in Account History page
      And I should see Status equals Active in Account History page
      And I should see Activation equals 10/31/2002 11:35 in Account History page
      And I should see First Call Made equals 12/09/2004 14:25 in Account History page
      And I should see Last Use equals 08/12/2009 15:37 in Account History page
      And I should see Last Service Charge equals 11/09/2004 14:30 in Account History page

  Scenario: C92862904 "Show more" / "Show less" for details in Comments events (175 characters or less)
    When I click on Query tab in React application
      And I set 5297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-03 date in START DATE field in React application
      And I put 2021-10-03 date in END DATE field in React application
      And I set the checkbox to checked for Comment Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event   | Amount | Balance | Details                                                                                                                                                                                      |
      | 10/3/2021 9:26:45 AM | Comment | -      | - 	  | (aserhiyenka)Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetu |
      And I should not see Show More link in Account History page

  Scenario: C92862886 "Show more" / "Show less" for details in Comments events (more 175 characters)
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-09-26 date in START DATE field in React application
      And I put 2021-09-26 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Comment Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event   | Amount | Balance | Details                               |
      | 9/26/2021 10:44:22 PM |	Comment | -      | - 	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 10:44:21 PM |	Comment | -      | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 10:40:35 PM |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 10:40:34 PM |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:47:10 PM  | Comment	| -      | -       | (testl5)test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test ...Show more|
      | 9/26/2021 9:44:38 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:44:38 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:43:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:43:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:41:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:40:59 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:37:06 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:37:05 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
    When I click on SHOW MORE on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event   | Amount | Balance | Details                       |
      | 9/26/2021 10:44:22 PM |	Comment | -      | - 	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 10:44:21 PM |	Comment | -      | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 10:40:35 PM |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 10:40:34 PM |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:47:10 PM  | Comment	| -      | -       | (testl5)test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test.Show less|
      | 9/26/2021 9:44:38 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:44:38 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:43:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:43:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:41:00 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:40:59 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |
      | 9/26/2021 9:37:06 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed - cnum |
      | 9/26/2021 9:37:05 PM  |	Comment | -	     | -	   | (testl5)Billing history viewed        |

  Scenario: C92864452 Account History page displays Recent Calls events by date range
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Calls Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details       |
      | 9/29/2021 7:50:59 AM | Call  | $0.04  | $9.98   | 1150497985825 |
      | 9/29/2021 7:49:27 AM | Call  | $0.05  | $9.98   | 18246390003   |
      | 9/29/2021 6:03:58 AM | Call  | $0.02  | $9.98   | 18246390003   |

  Scenario: C92864453 Account History page displays Recent calls event details: call is not credited
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Calls Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details       |
      | 9/29/2021 7:50:59 AM | Call  | $0.04  | $9.98   | 1150497985825 |
      | 9/29/2021 7:49:27 AM | Call  | $0.05  | $9.98   | 18246390003   |
      | 9/29/2021 6:03:58 AM | Call  | $0.02  | $9.98   | 18246390003   |
    When I click expand button for transaction with 9/29/2021 7:50:59 AM data in Account History page
    Then I should see ANI equals 7796311501 in Account History page
      And I should see DNIS equals 9378742082 (test) in Account History page
      And I should see Duration equals 0:19 in Account History page
      And I should see Discount Plan equals BR Unlimited Not Offered To Retailer Plan in Account History page
      And I should see Info Digits equals 00(Plain Old Telephone Service) in Account History page
      And I should see Call End Reason equals Calling Party Disconnected in Account History page
      And I should not see Status in event details in Account History page

  Scenario: C92864455 Account History page displays Recent calls event details: call is not credited
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Calls Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details       |
      | 9/29/2021 7:50:59 AM | Call  | $0.04  | $9.98   | 1150497985825 |
      | 9/29/2021 7:49:27 AM | Call  | $0.05  | $9.98   | 18246390003   |
      | 9/29/2021 6:03:58 AM | Call  | $0.02  | $9.98   | 18246390003   |
    When I click expand button for transaction with 9/29/2021 7:49:27 AM data in Account History page
    Then I should see ANI equals 7796311501 in Account History page
      And I should see DNIS equals 9378742082 (test) in Account History page
      And I should see Duration equals 0:25 in Account History page
      And I should see Status equals Credit denied in Account History page

  Scenario: C92864456 Account History page displays Recent calls event details: call credited
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Calls Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details       |
      | 9/29/2021 7:50:59 AM | Call  | $0.04  | $9.98   | 1150497985825 |
      | 9/29/2021 7:49:27 AM | Call  | $0.05  | $9.98   | 18246390003   |
      | 9/29/2021 6:03:58 AM | Call  | $0.02  | $9.98   | 18246390003   |
    When I click expand button for transaction with 9/29/2021 6:03:58 AM data in Account History page
    Then I should see ANI equals 7796311501 in Account History page
      And I should see DNIS equals 9378742082 (test) in Account History page
      And I should see Duration equals 0:13 in Account History page
      And I should see Status equals Credited in Account History page

  Scenario: C92864454 Verify unchecked Recent Calls option, Recent Call events are not listed
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Calls Events in the Account History
      And I set the checkbox to checked for Transactions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event       | Amount | Balance | Details                     |
      | 9/29/2021 7:50:59 AM | Call        | $0.04  | $9.98   | 1150497985825               |
      | 9/29/2021 7:49:27 AM | Call        | $0.05  | $9.98   | 18246390003                 |
      | 9/29/2021 7:06:01 AM | Transaction | $25.00 | -       | Balance Allowance 502667146 |
      | 9/29/2021 7:06:01 AM | Transaction | $0.00  | -       | Plan Enroll                 |
      | 9/29/2021 6:03:58 AM | Call        | $0.02  | $9.98   | 18246390003                 |
      | 9/29/2021 5:27:43 AM | Transaction | $0.00  | -       | Create Account              |
    When I set the checkbox to unchecked for Calls Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event       | Amount | Balance | Details                     |
      | 9/29/2021 7:06:01 AM | Transaction | $25.00 | -       | Balance Allowance 502667146 |
      | 9/29/2021 7:06:01 AM | Transaction | $0.00  | -       | Plan Enroll                 |
      | 9/29/2021 5:27:43 AM | Transaction | $0.00  | -       | Create Account              |

  Scenario: C92864459 Verify destination location in Account History page
    When I click on Query tab in React application
      And I set 6597752445 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-08-31 date in START DATE field in React application
      And I put 2021-09-29 date in END DATE field in React application
      And I set the checkbox to checked for Calls Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time            | Event | Amount | Balance | Details       |
      | 9/29/2021 7:50:59 AM | Call  | $0.04  | $9.98   | 1150497985825 |
      | 9/29/2021 7:49:27 AM | Call  | $0.05  | $9.98   | 18246390003   |
      | 9/29/2021 6:03:58 AM | Call  | $0.02  | $9.98   | 18246390003   |
    When I click on 1150497985825 destination phone number
      Then Destination location equals USA. is displayed

  @closePopup
  Scenario: C92864737 Debit from Account history
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752446
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
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
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I should see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I put Test date in Comment field in Debit to reverse the credit for Account 6597752446 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Previous credit for Account 6597752446 debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance DECREASE for 5 in Account History page

  @closePopup
  Scenario: C92864738 Debit from Account history - fields validation
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
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
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I click on DEBIT on Account History Page in React application
    Then "Comment can not be empty" alert should be displayed in Account Debit pop-up
      And I click on CANCEL on Account History Page in React application

  @closePopup
  Scenario: C92864739 Debit from Account history - Cancel button
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I click on CANCEL on Account History Page in React application

  @closePopup
  Scenario: C92866864 Debit from Account history - balance change
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Disconnected Call from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I put Test date in Comment field in Debit to reverse the credit for Account 6597752446 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Previous credit for Account 6597752446 debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance DECREASE for 5 in Account History page

  @closePopup
  Scenario: C92866865 Debit from Account history - comment after debit
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
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
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I put Comment validation: Debit to reverse the credit for Account 6597752446 date in Comment field in Debit to reverse the credit for Account 6597752446 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Previous credit for Account 6597752446 debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance DECREASE for 5 in Account History page
    When I set the checkbox to unchecked for Credits Events in the Account History
      And I set the checkbox to checked for Comments Events in the Account History
      And New Comment transaction equals to Comment validation: Debit to reverse the credit for Account 6597752446 displayed in Account History page

  @closePopup
  Scenario: C92866866 Debit from Account history - debited earlier
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Balance not applied from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I get Date/Time of new transaction in Account History page
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I put Comment validation: Debit to reverse the credit for Account 6597752446 date in Comment field in Debit to reverse the credit for Account 6597752446 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Previous credit for Account 6597752446 debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that current balance DECREASE for 5 in Account History page
      And I check that 3 dots are not displayed for debited transaction in Account History page

  @closePopup
  Scenario: C92866867 Debit from Account history - balance is less than the debited amount
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752447
    When I click on Query tab in React application
      And I set 6597752447 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose Business credit request from Reason list in Account Credit pop-up
      And I put "20" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752447 is credited $20.00 displayed in Search Result page
      And I check that current balance INCREASE for 20 in Account History page
      And I close alert message
      And I check current balance in Account History Page
      And I click on SEARCH RESULT on Account History Page in React application
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
    When I open Maintenance menu in React application
      And I choose ACCOUNT DEBIT from Maintenance menu
    Then I should see Account Debit pop-up
    When I put "Test" date in COMMENT field in Account Debit pop-up
      And I put "15" date in DEBIT AMOUNT field in Account Debit pop-up
      And I click DEBIT ACCOUNT button in Account Debit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752447 is debited $15.00 displayed in Search Result page
      And I close alert message
      And I check that current balance DECREASE for 15 in Account History page
      And I click on SEARCH RESULT on Account History Page in React application
    When I click History link in Account History Page
    Then I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752447 pop-up in Account History page
    When I put Failed date in Comment field in Debit to reverse the credit for Account 6597752447 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Debit amount exceeds current balance displayed in Search Result page
      And I close alert message

  @closePopup
  Scenario: C92866868 Debit from Account history - Status
    When I click on Query tab in React application
      And I set 6597752446 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I check current balance in Search Results page
    When I open Maintenance menu in React application
      And I choose ACCOUNT CREDIT from Maintenance menu
    Then I should see Account Credit pop-up
    When I put "Test Credit" date in COMMENT field in Account Credit pop-up
      And I choose False Answer Supervision from Reason list in Account Credit pop-up
      And I put "5" date in CREDIT AMOUNT field in Account Credit pop-up
      And I click CREDIT ACCOUNT button in Account Credit pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 6597752446 is credited $5.00 displayed in Search Result page
      And I check that current balance was increased after recharge for 5 in search results page
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I click on SEARCH RESULT on Account History Page in React application
    When I click History link in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Credits Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I get Date/Time of new transaction in Account History page
    When I click expand button for transaction with NEW data in Account History page
      And I should see Status equals not-debited in Account History page
      And I click 3 dots for transaction with CURRENT BALANCE data
      And I click on Debit from 3 dots menu
    Then I SHOULD see Debit to reverse the credit for Account 6597752446 pop-up in Account History page
    When I put Comment validation: Debit to reverse the credit for Account 6597752446 date in Comment field in Debit to reverse the credit for Account 6597752446 pop-up
      And I click on DEBIT on Account History Page in React application
    Then I verifies that NOTIFICATION MESSAGE equals to Previous credit for Account 6597752446 debited $5.00 displayed in Search Result page
      And I close alert message
      And I check that 3 dots are not displayed for debited transaction in Account History page
    When I click expand button for transaction with NEW data in Account History page
    Then I should see Status equals debited in Account History page

  @closePopup
  Scenario: C92890401 Refund a credit card payment
    Given I delete from "CC_HISTORY" where "CTLNUM = 4433285535" in "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752463 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success              |
      | Amount: $5.00        |
      | Promo Award: $0.50   |
      | Escrow Amount: $0.00 |
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with $5.00 data
      And I click on Refund from 3 dots menu
    Then I SHOULD see Refund a Payment pop-up in Account History page
    When I put Revert date in Comment field in Refund a Payment pop-up
      And I click on Refund button in Refund a Payment pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to $5.00 has been refunded to account 6597752463 displayed in Search Result page
      And I close alert message
    Then I check that current balance DECREASE for 5.5 in Account History page
      And I check that Sale event has Approved, Refunded in Details
      And I check that Refund event has Approved in Details


  Scenario: C92893664 Payment already refunded
    When I click on Query tab in React application
      And I set 6597752464 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-27 date in START DATE field in React application
      And I put 2021-10-27 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event           | Amount   | Balance | Details                   |
      | 10/27/2021 9:56:15 AM | Sale            | $100.00  | -       | Approved                  |
      | 10/27/2021 9:46:34 AM |	Refund          | $25.00   | -       | Approved                  |
      | 10/27/2021 9:46:08 AM | Delayed Capture | $25.00   | -       | Approved, Refunded        |
      | 10/27/2021 9:46:07 AM | Authorized      | $25.00   | -       | Approved, Delayed Capture |
      And I check that 3 dots are not displayed for 10/27/2021 9:46:34 AM transaction in Account History page

  @closePopup
  Scenario: C92893665 Check required fields for Refund a credit card
    When I click on Query tab in React application
      And I set 6597752464 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-27 date in START DATE field in React application
      And I put 2021-10-27 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I click 3 dots for transaction with 10/27/2021 9:56:15 AM data
      And I click on Refund from 3 dots menu
    Then I SHOULD see Refund a Payment pop-up in Account History page
    When I click on Refund button in Refund a Payment pop-up
    Then "Comment can not be empty" alert message should be displayed for "Comment" field
      And I click on Cancel button in Refund a Payment pop-up

  @closePopup
  Scenario: C92893666 Partial refund
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752465
      And I delete from "CC_HISTORY" where "CTLNUM = 4433286500" in "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752465 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success              |
      | Amount: $25.00       |
      | Promo Award: $2.50   |
      | Escrow Amount: $0.00 |
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I check that Sale event has Approved in Details
      And I click 3 dots for transaction with $25.00 data
      And I click on Refund from 3 dots menu
    Then I SHOULD see Refund a Payment pop-up in Account History page
    When I put Partial Refund date in Comment field in Refund a Payment pop-up
      And I put 10 date in Refund field in Refund a Payment pop-up
      And I click on Refund button in Refund a Payment pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to $10.00 has been refunded to account 6597752465 displayed in Search Result page
      And I close alert message
    Then I check that current balance DECREASE for 12.5 in Account History page
      And I check that Refund event has Approved in Details
      And I check that Sale event has Approved, Credited in Details
    When I click expand button for transaction with $10.00 data in Account History page
    Then I should see Transaction Type equals Refund in Account History page

  Scenario: C92893667 Payment is not eligible for a refund
    When I click on Query tab in React application
      And I set 6597752467 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-28 date in START DATE field in React application
      And I put 2021-10-28 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I click expand button for transaction with 10/28/2021 5:34:40 AM data in Account History page
      And I should see Transaction Type equals Refund in Account History page
      And I check that 3 dots are not displayed for 10/28/2021 5:34:40 AM transaction in Account History page
    When I click on Query tab in React application
      And I set 6597752467 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-28 date in START DATE field in React application
      And I put 2021-10-28 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
    Then I click expand button for transaction with 10/28/2021 5:34:04 AM data in Account History page
      And I should see Transaction Type equals Authorized in Account History page
      And I check that 3 dots are not displayed for 10/28/2021 5:34:04 AM transaction in Account History page

  Scenario: C92896057 Transaction type verification for refunded payments
    Given I update balance in table PARTITIONED_PINTAB with values STATE='A',EXPIRED_DATE=null, BALANCE=100 for pin PIN=6597752466
      And I delete from "CC_HISTORY" where "CTLNUM = 4433287697" in "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752466 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click PAYMENT INFO button in Search Result Page
      And I set 5 value in TRANSACTION AMOUNT field in Payment Info page in React application
      And I click APPLY button in Payment Info Page
    Then the following messages are displayed in Payment Info page
      | Success              |
      | Amount: $5.00        |
      | Promo Award: $0.50   |
      | Escrow Amount: $0.00 |
      And I close alert message
    When I click History link in Account History Page
      And I click on EXPAND DASHBOARD on Account History Page in React application
      And I check current balance in Account History Page
      And I choose TODAY date in calendar
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I check that Sale event has Approved in Details
      And I click 3 dots for transaction with $5.00 data
      And I click on Refund from 3 dots menu
    Then I SHOULD see Refund a Payment pop-up in Account History page
    When I put Revert date in Comment field in Refund a Payment pop-up
      And I click on Refund button in Refund a Payment pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to $5.00 has been refunded to account 6597752466 displayed in Search Result page
      And I close alert message
    Then I check that current balance DECREASE for 5.5 in Account History page
    When I click expand button for transaction with $5.00 data in Account History page
    Then I should see Transaction Type equals Refund in Account History page
      And I check that Sale event has Approved, Refunded in Details
      And I check that Refund event has Approved in Details

  @closePopup
  Scenario: C92932388 Refund with 0 balance
    When I click on Query tab in React application
      And I set 6597752468 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
    When I click History link in Account History Page
      And I put 2021-10-28 date in START DATE field in React application
      And I put 2021-10-28 date in END DATE field in React application
      And I set the checkbox to checked for Payments Events in the Account History
      And I click on SEARCH on Account History Page in React application
      And I check that Delayed Capture event has Approved in Details
      And I click 3 dots for transaction with $50.00 data
      And I click on Refund from 3 dots menu
    Then I SHOULD see Refund a Payment pop-up in Account History page
    When I put Refund amount exceed current balance date in Comment field in Refund a Payment pop-up
      And I click on Refund button in Refund a Payment pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to The refund can not be done. The balance is less than the refund sum displayed in Search Result page
      And I close alert message
    Then I check that Delayed Capture event has Approved in Details

  Scenario: C93023359 Void External Transfer pop-up overview
    When I click on Query tab in React application
      And I set 44794164754 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click History link in Account History Page
      And I put 2021-10-24 date in START DATE field in React application
      And I put 2021-11-22 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Transactions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event       | Amount | Balance | Details                     |
      | 11/19/2021 8:07:04 AM | Transaction | $7.00  | -       | Transfer Out Reversal       |
      | 11/19/2021 8:07:04 AM | Transaction | $7.00  | -       | Phone Number 41008192       |
      | 11/19/2021 8:07:02 AM | Transaction | $7.00  | -       | Balance Allowance 502843465 |
      | 11/19/2021 8:07:00 AM | Transaction | $0.00  | -       | Create Account              |
    And I click 3 dots for transaction with 11/19/2021 8:07:04 AM data
    And I click on Void from 3 dots menu
    Then I SHOULD see Void External Transfer pop-up in Account History page
      And I should see PIN equals 44794164754 in Void External Transfer pop-up
      And I should see Date equals 11/19/2021 8:07:04 AM in Void External Transfer pop-up
      And I should see Amount equals $7.00 in Void External Transfer pop-up
      And I click on Cancel button in Void External Transfer pop-up

  Scenario: C93023360 Comment field is mandatory in Void External Transfer pop-up
    When I click on Query tab in React application
      And I set 44794164754 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click History link in Account History Page
      And I put 2021-10-24 date in START DATE field in React application
      And I put 2021-11-22 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Transactions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event       | Amount | Balance | Details                     |
      | 11/19/2021 8:07:04 AM | Transaction | $7.00  | -       | Transfer Out Reversal       |
      | 11/19/2021 8:07:04 AM | Transaction | $7.00  | -       | Phone Number 41008192       |
      | 11/19/2021 8:07:02 AM | Transaction | $7.00  | -       | Balance Allowance 502843465 |
      | 11/19/2021 8:07:00 AM | Transaction | $0.00  | -       | Create Account              |
      And I click 3 dots for transaction with 11/19/2021 8:07:04 AM data
      And I click on Void from 3 dots menu
    Then I SHOULD see Void External Transfer pop-up in Account History page
      And I click on Void button in Void External Transfer pop-up
    Then "Comment can not be empty" alert message should be displayed for "Comment" field
      And I click on Cancel button in Void External Transfer pop-up

  Scenario: C93029972 Voided IMTU Transaction verification
    When I click on Query tab in React application
      And I set 44755927117 PIN in Query Search page in React application
      And I search for account in React application
    Then I see Search Result in Search Result page
      And I click History link in Account History Page
      And I put 2021-10-24 date in START DATE field in React application
      And I put 2021-11-22 date in END DATE field in React application
      And I click on SEARCH on Account History Page in React application
      And I set the checkbox to checked for Transactions Events in the Account History
    Then I compare events in AccountHistory page in React application:
      | Date/Time             | Event       | Amount | Balance | Details                     |
      | 11/19/2021 7:36:39 AM | Transaction | $7.00  | -       | Phone Number 41008192       |
      | 11/19/2021 7:36:39 AM | Transaction | $7.00  | -       | Transfer Out Reversal       |
      | 11/19/2021 7:09:15 AM | Transaction | $7.00  | -       | Phone Number 41008192       |
      | 11/19/2021 7:09:15 AM | Transaction | $7.00  | -       | Transfer Out Reversal       |
      | 11/19/2021 7:09:14 AM | Transaction | $7.00  | -       | Balance Allowance 502843186 |
      | 11/19/2021 7:09:09 AM | Transaction | $0.00  | -       | Create Account              |
    When I click expand button for transaction with 11/19/2021 7:09:15 AM data in Account History page
    Then I should see Status equals Void Applied in Account History page