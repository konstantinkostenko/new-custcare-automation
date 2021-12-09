@React @ReactChangeAccountState
Feature: Change Account Status
  I want to verify that account can be changed in React application

  Background: Login to React portal with custcare user credentials
    Given I login to REACT application with CustcareUser credentials

  @closePopup
  Scenario: C91615769: Account in Active (A) status can be Suspended
    Given I update "PARTITIONED_PINTAB" with data "state = 'A'" where "pin = '6597752302'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752302 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose SUSPEND from Change Account menu
    Then I should see Suspend account header in pop-up
    When I accept Suspend action in pop-up
    Then I should see Account 6597752302 has been suspended message in pop-up
      And I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to suspend in Search Result Page

  @closePopup
  Scenario: C91616136: Account in In use (I) status can be Suspended
    Given I update "PARTITIONED_PINTAB" with data "state = 'I'" where "pin = '6597752304'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752304 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose SUSPEND from Change Account menu
    Then I should see Suspend account header in pop-up
    When I accept Suspend action in pop-up
    Then I should see Account 6597752304 has been suspended message in pop-up
      And I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to suspend in Search Result Page

  @closePopup
  Scenario: C91616137: Suspend action is not available if account state is differ from Active (A) or In use (I)
    When I click on Query tab in React application
      And I set 4429932114 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 2007859870 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 4429893625 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disabled displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 335717354 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Expired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 386400143 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 378686601 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 784694819 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Provisioned displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu
    When I click on Query tab in React application
      And I set 4834445001 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to PIN Reused displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see SUSPEND option in Change Account menu

  @closePopup
  Scenario: C91616138: Unable to Suspend account if Class Migration in Progress
    When I click on Query tab in React application
      And I set 0412170000 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose SUSPEND from Change Account menu
    Then I should see Suspend account header in pop-up
    When I accept Suspend action in pop-up
    Then I should see Class is being migrated. Try again later. message in pop-up

  @closePopup
  Scenario: C91653047: Account in Disconnected (H - Hard Disconnect) status can be Reactivated
    Given I update "PARTITIONED_PINTAB" with data "state = 'H'" where "pin = '6597752305'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752305 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Account 6597752305 has been successfully reactivated message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to reactivated in Search Result Page

  @closePopup
  Scenario: C91653048: Verify that Reactivate action is not available if account state Active (A)
    When I click on Query tab in React application
      And I set 4432878727 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see REACTIVATE option in Change Account menu

  @closePopup
  Scenario: C91653051: Verify Account in Suspended (S) status can be Reactivated
    Given I update "PARTITIONED_PINTAB" with data "state = 'S'" where "pin = '6597752307'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752307 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Account 6597752307 has been successfully reactivated message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to reactivated in Search Result Page

  @closePopup
  Scenario: C91653053: Verify Account in Disabled (D) status can be Reactivated
    Given I update "PARTITIONED_PINTAB" with data "state = 'D'" where "pin = '6597752308'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752308 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disabled displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Account 6597752308 has been successfully reactivated message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to reactivated in Search Result Page

  @closePopup
  Scenario: C91653054: Verify Account in Expired (E) status can be Reactivated
    Given I update "PARTITIONED_PINTAB" with data "state = 'E'" where "pin = '6597752309'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752309 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Expired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Account 6597752309 has been successfully reactivated message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to reactivated in Search Result Page

  @closePopup
  Scenario: C91653055: Verify Account in Retired (R) status can be Reactivated
    Given I update "PARTITIONED_PINTAB" with data "state = 'R',EXPIRED_DATE=sysdate" where "pin = '6597752310'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752310 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Account 6597752310 has been successfully reactivated message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to reactivated in Search Result Page

  @closePopup
  Scenario: C91653057: Verify that Reactivate action is not available if account state In use (I)
    Given I update "PARTITIONED_PINTAB" with data "state = 'I,EXPIRED_DATE=sysdate'" where "pin = '6597752311'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432878832 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see REACTIVATE option in Change Account menu

  @closePopup
  Scenario: C91653058: Verify that Reactivate action is not available if account state In-use in wireless (M)
    Given I update "PARTITIONED_PINTAB" with data "state = 'M',EXPIRED_DATE=sysdate" where "pin = '6597752312'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432878836 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see REACTIVATE option in Change Account menu

  @closePopup
  Scenario: C91653059: Verify Unable to Reactivate account if Class Migration in Progress
    When I update "PARTITIONED_PINTAB" with data "state = 'S',EXPIRED_DATE=sysdate" where "pin = '6597752313'" on "DEBIT" database
      And I click on Query tab in React application
      And I set 6597752313 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I should see Class is being migrated. Try again later. message in pop-up

  @closePopup
  Scenario: C91654031: Verify Account in In use (I) status can be Unlocked
    Given I update "PARTITIONED_PINTAB" with data "state = 'I',EXPIRED_DATE=sysdate" where "pin = '6597752314'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752314 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose UNLOCK from Change Account menu
    Then I should see Unlock account header in pop-up
    When I accept Unlock action in pop-up
    Then I should see Account 6597752314 has been unlocked message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to unlocked in Search Result Page

  @closePopup
  Scenario: C91654032: Verify Account in In-use in wireless (M) status can be Unlocked
    Given I update "PARTITIONED_PINTAB" with data "state = 'M',EXPIRED_DATE=sysdate" where "pin = '6597752315'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752315 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose UNLOCK from Change Account menu
    Then I should see Unlock account header in pop-up
    When I accept Unlock action in pop-up
    Then I should see Account 6597752315 has been unlocked message in pop-up
      And I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to unlocked in Search Result Page

  @closePopup
  Scenario: C91654033: Verify that Unlock action is not available if account state Expired (E)
    Given I update "PARTITIONED_PINTAB" with data "state = 'E',EXPIRED_DATE=sysdate" where "pin = '6597752316'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432879643 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Expired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654034: Verify that Unlock action is not available if account state Disconnected (H - Hard Disconnect)
    Given I update "PARTITIONED_PINTAB" with data "state = 'H',EXPIRED_DATE=sysdate" where "pin = '6597752317'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432879647 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654035: Verify that Unlock action is not available if account state Suspended (S)
    Given I update "PARTITIONED_PINTAB" with data "state = 'S',EXPIRED_DATE=sysdate" where "pin = '6597752318'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432879651 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654036: Verify that Unlock action is not available if account state Disabled (D)
    Given I update "PARTITIONED_PINTAB" with data "state = 'D',EXPIRED_DATE=sysdate" where "pin = '6597752319'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432879655 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disabled displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654037: Verify that Unlock action is not available if account state Active (A)
    Given I update "PARTITIONED_PINTAB" with data "state = 'A',EXPIRED_DATE=sysdate" where "pin = '6597752320'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432882769 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654038: Verify that Unlock action is not available if account state Retired (R)
    Given I update "PARTITIONED_PINTAB" with data "state = 'R',EXPIRED_DATE=sysdate" where "pin = '6597752321'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432882773 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see UNLOCK option in Change Account menu

  @closePopup
  Scenario: C91654039: Verify Unable to Unlock account if Class Migration in Progress
    Given I update "PARTITIONED_PINTAB" with data "state = 'I',EXPIRED_DATE=sysdate" where "pin = '6597752322'" on "DEBIT" database
      And I click on Query tab in React application
      And I set 6597752322 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose UNLOCK from Change Account menu
    Then I should see Unlock account header in pop-up
    When I accept Unlock action in pop-up
    Then I should see Class is being migrated. Try again later. message in pop-up

  @closePopup @C91769457
  Scenario: C91769457: Account in Active status can be Disconnected
    Given I update "PARTITIONED_PINTAB" with data "state = 'A',EXPIRED_DATE=sysdate" where "pin = '6597752340'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752340 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose DISCONNECT from Change Account menu
    Then I should see Disconnect account header in pop-up
    When I accept Disconnect action in pop-up
    Then I should see Account 6597752340 has been disconnected message in pop-up
      And I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to disconnect in Search Result Page

  @closePopup @C91769458
  Scenario: C91769458: Account in Suspended (S) status can be Disconnected
    Given I update "PARTITIONED_PINTAB" with data "state = 'S',EXPIRED_DATE=sysdate" where "pin = '6597752341'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752341 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Suspended displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose DISCONNECT from Change Account menu
    Then I should see Disconnect account header in pop-up
    When I accept Disconnect action in pop-up
    Then I should see Account 6597752341 has been disconnected message in pop-up
      And I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to disconnect in Search Result Page

  @closePopup @C91769459
  Scenario: C91769459: Account in Disabled (D) status can be Disconnected
    Given I update "PARTITIONED_PINTAB" with data "state = 'D',EXPIRED_DATE=sysdate" where "pin = '6597752343'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 6597752343 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Disabled displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose DISCONNECT from Change Account menu
    Then I should see Disconnect account header in pop-up
    When I accept Disconnect action in pop-up
    Then I should see Account 6597752343 has been disconnected message in pop-up
      And I verifies that ACCOUNT STATUS equals to Disconnected displayed in Search Result page
    When I click COMMENTS BLOCK button in Search Result Page
    Then I verify that new added comment equals to disconnect in Search Result Page

  @closePopup @C91769461
  Scenario: C91769461: Disconnect option is not available if account state is "Expired (E)"
    Given I update "PARTITIONED_PINTAB" with data "state = 'E',EXPIRED_DATE=sysdate" where "pin = '6597752370'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432923286 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Expired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see DISCONNECT option in Change Account menu

  @closePopup @C91769462
  Scenario: C91769462: Disconnect option is not available if account state is "Retired (R)"
    Given I update "PARTITIONED_PINTAB" with data "state = 'R',EXPIRED_DATE=sysdate" where "pin = '6597752371'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432929913 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see DISCONNECT option in Change Account menu

  @closePopup @C91769463
  Scenario: C91769463: Disconnect option is not available if account state is "In use wireless (M)"
    Given I update "PARTITIONED_PINTAB" with data "state = 'M',EXPIRED_DATE=sysdate" where "pin = '6597752372'" on "DEBIT" database
    When I click on Query tab in React application
      And I set 4432929915 Control Number in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to In Use displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    Then I should not see DISCONNECT option in Change Account menu

  @closePopup @C91771669
  Scenario: C91771669: Verify Unable to Unlock account if Class Migration in Progress
    Given I update "PARTITIONED_PINTAB" with data "state = 'A',EXPIRED_DATE=sysdate" where "pin = '6597752332'" on "DEBIT" database
      And I click on Query tab in React application
      And I set 6597752332 PIN in Query Search page in React application
      And I search for account in React application
      And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Active displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
      And I choose DISCONNECT from Change Account menu
    Then I should see Disconnect account header in pop-up
    When I accept Disconnect action in pop-up
    Then I should see Class is being migrated. Try again later. message in pop-up

  @closePopup
  Scenario: C93068197 Verify error message on reactivation window when reactivate an expired account within the last 20 days.
    When I click on Query tab in React application
    And I set 21232110011 PIN in Query Search page in React application
    And I search for account in React application
    And I see Search Result in Search Result page
    Then I verifies that ACCOUNT STATUS equals to Retired displayed in Search Result page
    When I click ACCOUNT STATUS button in Search Result Page
    And I choose REACTIVATE from Change Account menu
    Then I should see Reactivate account header in pop-up
    When I accept Reactivate action in pop-up
    Then I verifies that NOTIFICATION MESSAGE equals to Account 21232110011 cannot be reactivated. Reactivation window exceeded (20 days from expiration) displayed in Search Result page
