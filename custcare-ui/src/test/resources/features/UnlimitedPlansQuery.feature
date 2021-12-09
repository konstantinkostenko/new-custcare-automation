@React @UnlimitedPlansQuery
Feature: Unlimited plans Query Feature
  In order to test the Unlimited plans query functionality in React application
  As a user I want to verify that Unlimited plans query is working properly

  Background: Login to custcare portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @quitWebDriver
  Scenario: C89464525: Request url send for unlimited plans
    When I click on Query tab in React application
      And I click on Unlimited Plan Query tab in React application
    Then I should see Unlimited Plan Query page in React application
    When I set 8377711314 into PIN/Account field in Unlimited Plan Query page in React application
      And I choose Guatemala from Country list in Unlimited Plan Query page in React application
      And I click Search button in Unlimited Plan Query page in React application
      And I should see Plans table in Unlimited Plan Query page in React application
    Then I compare transactions in Unlimited Plan Query page in React application:
      | Plan ID | Plan Name / Description | Price  | Included Location     | Excluded Location |
      | 5521    | Tigo One Day Unlimited  | $10.00 | 1. Guatemala Cellular | [blank]           |
      | 5803    | Tigo Guatemala 5 Days   | $25.00 | 1. Guatemala Cellular | [blank]           |

  Scenario: C89472499: Unlimited plans with Excluded Location
    When I click on Query tab in React application
      And I click on Unlimited Plan Query tab in React application
    Then I should see Unlimited Plan Query page in React application
    When I set 7297703533 into PIN/Account field in Unlimited Plan Query page in React application
      And I choose Turkmenistan from Country list in Unlimited Plan Query page in React application
      And I click Search button in Unlimited Plan Query page in React application
      And I should see Plans table in Unlimited Plan Query page in React application
    Then I compare transactions in Unlimited Plan Query page in React application:
      | Plan ID | Plan Name / Description | Price | Included Location | Excluded Location   |
      | 6001    | BR 1 day unlimited      | $5.00 | 1. Turkmenistan   | [blank]             |

  Scenario: C89473598: Unlimited plans with no data found
    When I click on Query tab in React application
      And I click on Unlimited Plan Query tab in React application
    Then I should see Unlimited Plan Query page in React application
    When I set 3003003434 into PIN/Account field in Unlimited Plan Query page in React application
      And I choose Afghanistan from Country list in Unlimited Plan Query page in React application
      And I click Search button in Unlimited Plan Query page in React application
      And I should see Plans table in Unlimited Plan Query page in React application
    Then I should see no data displayed in Unlimited Plan Query page in React application
