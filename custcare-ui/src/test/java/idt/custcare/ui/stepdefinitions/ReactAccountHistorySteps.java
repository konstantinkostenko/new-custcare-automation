package idt.custcare.ui.stepdefinitions;

import idt.custcare.ui.portals.custcare.pages.ReactAccountHistoryPage;
import idt.custcare.ui.utils.CommonActions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.testng.Assert;

import java.util.List;
import java.util.Map;


public class ReactAccountHistorySteps {
    private double currentBalance;
    private String balance;
    private String transactionDateTime;

    private ReactAccountHistoryPage reactAccountHistoryPage;

    /**
     * Initializes an instance of {@link ReactAccountHistorySteps}.
     */
    public ReactAccountHistorySteps() {
        reactAccountHistoryPage = new ReactAccountHistoryPage();
    }

    @And("^I click History link in Account History Page$")
    public void iClickHistoryLinkInAccountHistoryPage() {
        reactAccountHistoryPage.clickOnHistoryLinkButton();
    }

    @Then("^I compare events in AccountHistory page in React application:$")
    public void iCompareEventsInAccountHistoryPageInReactApplication(final List<Map<String, String>> eventInfo) {
        CommonActions.waitFor(1);
        List<Map<String, String>> actualEventData = reactAccountHistoryPage.findEvents();
        Assert.assertEquals(actualEventData, eventInfo, "Events data does not match expected values.");
    }

    @And("^I click on (.*) on Account History Page in React application$")
    public void clickElement(final String fieldName) {
        reactAccountHistoryPage.clickOnButton(fieldName);
    }

    @And("^I set the checkbox to (.*) for (.*) Events in the Account History$")
    public void iSetTheCheckboxToCheckedForCreditsEventsInTheAccountHistory(final String checkBoxState, final String checkBoxName) {
        reactAccountHistoryPage.setCheckboxAccountHistory(checkBoxName, checkBoxState);
    }

    @When("^I click expand button for transaction with (.*) data in Account History page$")
    public void expandTransaction(final String fieldName) {
        if (fieldName.equals("NEW")) {
            reactAccountHistoryPage.expandTransaction(transactionDateTime);
        } else {
            reactAccountHistoryPage.expandTransaction(fieldName);
        }
    }

    @When("^I get Date/Time of new transaction in Account History page$")
    public void getDateTimeForNewTransaction() {
        balance = "$" + currentBalance;
        transactionDateTime = reactAccountHistoryPage.getDateTimeOfTransaction(balance);
    }

    @When("^I click 3 dots for transaction with (.*) data$")
    public void clickThreeDotsForTransaction(final String fieldName) {
        CommonActions.waitFor(5);
        if (fieldName.equals("CURRENT BALANCE")) {
            balance = "$" + currentBalance;
            reactAccountHistoryPage.clickThreeDots(balance);
        } else {
            reactAccountHistoryPage.clickThreeDots(fieldName);
        }
    }


    @And("^I click on (.*) from 3 dots menu$")
    public void clickElementFromTreeDotsMenu(final String fieldName) {
        reactAccountHistoryPage.clickOnOptionFromThreeDotsMenu(fieldName);
    }

    /**
     * Verifies the messages should be displayed on debit card page.
     */
    @Then("^I (.*) see (.*) pop-up in Account History page$")
    public void debitToReverseCreditDisplayed(final String condition, final String fieldName) {
        Assert.assertTrue(reactAccountHistoryPage.isPopupDisplayed(condition, fieldName));
    }

    /**
     * Checks that a current balance has been increased after recharge success.
     */
    @Then("^I check that current balance (.*) for (.*) in Account History page$")
    public void checkCurrentBalanceAfterDebit(final String statement, final String value) {
        CommonActions.waitFor(1);
        if (statement.equals("INCREASE")) {
            double balance = reactAccountHistoryPage.getCurrentBalance();
            double amount = Double.parseDouble(value);
            double balanceAfterRecharge = currentBalance + amount;
            Assert.assertEquals(balance, balanceAfterRecharge, "Balance does not match expected value.");
        } else {
            double balance = reactAccountHistoryPage.getCurrentBalance();
            double amount = Double.parseDouble(value);
            double balanceAfterRecharge = currentBalance - amount;
            Assert.assertEquals(balance, balanceAfterRecharge, "Balance does not match expected value.");
        }
    }

    @Then("^I should see (.*) equals (.*) in Account History page$")
    public void iShouldSeeAccountHistoryPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactAccountHistoryPage.getElementValueInPage(expectedParameter), expectedValue);
    }

    @Then("^I should not see Status in event details in Account History page$")
    public void iShouldNotSeeInAccountHistoryPage() {
        Assert.assertFalse(reactAccountHistoryPage.isStatusDisplayed(), "Status is displayed in event details");
    }

    @Then("^I should not see Show More link in Account History page$")
    public void iShouldNotSeeShowMoreLinkInAccountHistoryPage() {
        Assert.assertFalse(reactAccountHistoryPage.isShowMoreDisplayed(), "Show More Link is displayed in event details");
    }

    @When("^I check current balance in Account History Page$")
    public void checkCurrentBalance() {
        currentBalance = reactAccountHistoryPage.getCurrentBalance();
    }

    @And("^I put (.*) date in Comment field in (.*) pop-up$")
    public void setDataInCommentField(String dateFieldValue, String dateFieldName) {
        reactAccountHistoryPage.setCommentField(dateFieldValue, dateFieldName);
    }

    @And("^I put (.*) date in Refund field in (.*) pop-up$")
    public void setDataInRefundField(String dateFieldValue, String dateFieldName) {
        reactAccountHistoryPage.setRefundField(dateFieldValue, dateFieldName);
    }

    @And("^I click on (.*) button in (.*) pop-up$")
    public void clickButtonInPopUp(String dateFieldValue, String dateFieldName) {
        reactAccountHistoryPage.clickButtonInPopup(dateFieldValue, dateFieldName);
    }

    @When("^I check that 3 dots are not displayed for (.*) transaction in Account History page$")
    public void threeDotsNotDisplayedForDebitedTransaction(String fieldName) {
        if(fieldName.equals("debited")){
            Assert.assertFalse(reactAccountHistoryPage.isThreeDotsDisplayed(transactionDateTime));
        } else {
            Assert.assertFalse(reactAccountHistoryPage.isThreeDotsDisplayed(fieldName));
        }
    }

    @Then("^New (.*) transaction equals to (.*) displayed in Account History page$")
    public void newTransactionDisplayedInAccountHistoryPage(final String transaction, final String transactionDetails) {
        Assert.assertTrue(reactAccountHistoryPage.isTransactionDisplayed(transaction, transactionDetails));
    }

    @And("^I click on (.*) destination phone number$")
    public void clickDestinationPhoneNumber(final String fieldName) {
        reactAccountHistoryPage.clickDestinationPhoneNumber(fieldName);
    }

    @Then("^I check that (.*) event has (.*) in Details$")
    public void checkDetailsOfParticularEvent(final String event, final String transactionDetails) {
        Assert.assertEquals(reactAccountHistoryPage.getTransactionDetails(event), transactionDetails);
    }
}

