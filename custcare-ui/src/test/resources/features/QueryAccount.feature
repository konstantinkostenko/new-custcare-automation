@React @ReactQuery @QueryAccount
Feature: Query account
  I want to verify that query an account is working properly in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  Scenario: C89115419: User is able to search by PIN
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page

  Scenario: C89116232: User is able to search by PIN with dash and spaces in number
    When I click on Query tab in React application
      And I set 729-770-3533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page

  Scenario: C89115926: User is able to search by CONTROL NUMBER
    When I click on Query tab in React application
      And I set 4431054584 Control Number in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page

  Scenario: C89134904: User is not able to search with invalid PIN
    When I click on Query tab in React application
      And I set 3563347345734843 PIN in Query Search page in React application
      And I search for account in React application
    Then Account Not Found message displayed in Query Search page in React application

  Scenario: C89136233: User is not able to search with invalid Control number
    When I click on Query tab in React application
      And I set 3563347345734843 Control Number in Query Search page in React application
      And I search for account in React application
    Then Account Not Found message displayed in Query Search page in React application

  @closePopup
  Scenario: C89138399: Multiple PINs search result
    When I click on Query tab in React application
      And I set 83789400001 PIN in Query Search page in React application
      And I search for account in React application
    Then I should see Account Information popup
      And Multiple accounts have been found. Please, select the one you need by clicking the appropriate line. message displayed in Account Information popup
      And I compare Accounts in Account Information popup in React application:
        | Name | Program          | Status | Activation Date        | Last Use Date        |
        | -    | VoiceWeb Testing | Active | 10/31/2002 11:35:33 AM | 8/12/2009 3:37:58 PM |
        | -    | P_IVR testing    | Active | -                      | -                    |
      And I click on VoiceWeb  Testing on Account Information popup
      And I see SEARCH RESULT in Search Result page

  Scenario: C92864672 Verify that is not able to add symbols on Phone number into search field
    When I click on Query tab in React application
      And I set +(729)770-3533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page

  @closePopup
  Scenario: C93033888 verify pagination is displayed if we have more than 4 rows for Multiple PINs on search result
    When I click on Query tab in React application
      And I set 6597752483 PIN in Query Search page in React application
      And I search for account in React application
    Then I should see Account Information popup
      And Multiple accounts have been found. Please, select the one you need by clicking the appropriate line. message displayed in Account Information popup
      And I compare Accounts in Account Information popup in React application:
        | Name              | Program                     | Status | Activation Date       | Last Use Date |
        | -                 | SG Boss Revolution Customer | Active | 11/23/2021 1:15:00 AM | -             |
        | Last Serhiyenka   | Dupont - Prepaid            | Active | 11/23/2021 1:28:09 AM | -             |
        | -	                | Boss Revolution Customer	  | Active | 11/23/2021 1:14:46 AM | -             |
        | First test Black1 | Gajendra Partition pin pool | Active | 11/23/2021 1:22:45 AM | -             |
      And I click on NEXT PAGE of pagination in Account Information popup
      And I compare Accounts in Account Information popup in React application:
        | Name      | Program       | Status | Activation Date       | Last Use Date |
        | Last Last | Dyn Pin no VM | Active | 11/23/2021 1:24:49 AM | -             |
      And I click on PREVIOUS PAGE of pagination in Account Information popup
      And I compare Accounts in Account Information popup in React application:
        | Name              | Program                     | Status | Activation Date       | Last Use Date |
        | -                 | SG Boss Revolution Customer | Active | 11/23/2021 1:15:00 AM | -             |
        | Last Serhiyenka   | Dupont - Prepaid            | Active | 11/23/2021 1:28:09 AM | -             |
        | -	                | Boss Revolution Customer	  | Active | 11/23/2021 1:14:46 AM | -             |
        | First test Black1 | Gajendra Partition pin pool | Active | 11/23/2021 1:22:45 AM | -             |
      And I click on SG Boss Revolution Customer on Account Information popup
      And I see SEARCH RESULT in Search Result page