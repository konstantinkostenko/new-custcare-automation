package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactMtuTransactionsPage;
import idt.custcare.ui.utils.CommonActions;
import org.testng.Assert;
import java.util.List;
import java.util.Map;

/**
 * Contains steps definition methods for React Mtu Transactions page.
 */
public class ReactMtuTransactionsSteps {

    private ReactMtuTransactionsPage reactMtuTransactionsPage;

    /**
     * Initializes an instance of {@link ReactMtuTransactionsSteps}.
     */
    public ReactMtuTransactionsSteps() {
        reactMtuTransactionsPage = new ReactMtuTransactionsPage();
    }

    /**
     * Verifies that element displays expected value on Mtu Transactions Page.
     *
     * @param fieldName    as String.
     * @param expectedText as String.
     */
    @Then("^I verify that (.*) displays (.*) on Mtu Transactions Page in React application$")
    public void verifyTextDisplayedInReact(final String fieldName, final String expectedText) {
        String actualMessage = reactMtuTransactionsPage.getText(fieldName);
        Assert.assertEquals(actualMessage, expectedText,
                String.format("Expected was %s but displayed is %s on Mtu Query Page.", expectedText, actualMessage));
    }

    /**
     * Verifies that element displays expected value on Mtu Transactions Page.
     *
     * @param expectedText as String.
     */
    @Then("^I verify that (.*) message displays if no transactions found on Mtu Transactions Page$")
    public void verifyTextDisplayedInReact(final String expectedText) {
        Assert.assertEquals(reactMtuTransactionsPage.isNoTransactionsDisplayed(), expectedText, "No Data message is not displayed");
    }

    /**
     * Verifies that correct rate data is displayed in the table.
     *
     * @param transactionInfo info will be used to compare with transaction query data.
     */
    @Then("^I compare transactions in MTU transactions page in React application:$")
    public void iCompareRatesInRateQueryPage(final List<Map<String, String>> transactionInfo) {
        List<Map<String, String>> actualTransactionData = reactMtuTransactionsPage.findTransactionData();
        Assert.assertEquals(actualTransactionData, transactionInfo, "Transaction data does not match expected values.");
    }

    /**
     * Click element on Mtu Transactions Page.
     *
     * @param button as String.
     */
     @And("^I click (.*) button on Mtu Transactions Page$")
    public void clickButton (final String button) {
        reactMtuTransactionsPage.clickWebElement(button);
    }

    /**
     * Sets the field with specified data on Mtu Transactions Page.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName as String.
     */
    @And("^I put (.*) date in (.*) in MTU Transactions page in React application$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactMtuTransactionsPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Checks if Transaction page displayed.
     */
    @And("^I should see Transactions Page$")
        public void isTransactionPate(){
        Assert.assertTrue(reactMtuTransactionsPage.isTransactionsPage(), "Transaction page is not displayed");
    }
}
