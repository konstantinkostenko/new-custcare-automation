@React @ReactGetRate
Feature: Verify info on Get Rate Page in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @smoke @quitWebDriver
  Scenario: C89176873 Get Rate Search validation: Rate by "lac"
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page
    When I click on Get Rate tab in React application
      And I should see Rate Query page in React application
      And I choose Russia from Country list in Rate Query page in React application
      And I choose lac from Access Type list in Rate Query page in React application
      And I choose 20 from Amount list in Rate Query page in React application
      And I click Search button in Rate Query page in React application
    Then I should see Rates table in Rate Query page in React application
      And I compare rates in Rate Query page in React application:
      | Russia                | $0.046 |
      | Russia,St. Petersburg | $0.012 |
      | Russia,Moscow         | $0.017 |
      | Russia Cellular       | $0.099 |

  @smoke
  Scenario: C89176872 Get Rate Search validation: Rate by "iosWF"
    When I click on Query tab in React application
      And I set 3003003434 PIN in Query Search page in React application
      And I search for account in React application
    Then I see SEARCH RESULT in Search Result page
    When I click on Get Rate tab in React application
      And I should see Rate Query page in React application
      And I choose Russia from Country list in Rate Query page in React application
      And I choose iosWF from Access Type list in Rate Query page in React application
      And I choose 3 from Amount list in Rate Query page in React application
      And I click Search button in Rate Query page in React application
    Then I should see Rates table in Rate Query page in React application
      And I compare rates in Rate Query page in React application:
      | Russia                | $0.0274 |
      | Russia,St. Petersburg | $0.0124 |
      | Russia,Moscow         | $0.0176 |
      | Russia Cellular       | $0.0543 |

  @smoke @skipTest @flaky
  Scenario: C89176871 Get Rate Search validation: Rate by "800"
    When I click on Query tab in React application
      And I set 7297703533 PIN in Query Search page in React application
      And I search for account in React application
      Then I see SEARCH RESULT in Search Result page
    When I click on Get Rate tab in React application
      And I should see Rate Query page in React application
      And I choose Mexico from Country list in Rate Query page in React application
      And I choose 800 from Access Type list in Rate Query page in React application
      And I choose 3 from Amount list in Rate Query page in React application
      And I click Search button in Rate Query page in React application
    Then I should see Rates table in Rate Query page in React application
      And I compare rates in Rate Query page in React application:
      | Mexico | 760 cent |

  Scenario: C89179022: Get Rate Search validation: Account not found
    When I click on Query tab in React application
    When I click on Get Rate tab in React application
      And I should see Rate Query page in React application
      And I set 12 into PIN/Account field in Rate Query page in React application
      And I choose Mexico from Country list in Rate Query page in React application
      And I choose 800 from Access Type list in Rate Query page in React application
      And I choose 3 from Amount list in Rate Query page in React application
      And I click Search button in Rate Query page in React application
    Then Account Not Found message displayed in Query Search page in React application
