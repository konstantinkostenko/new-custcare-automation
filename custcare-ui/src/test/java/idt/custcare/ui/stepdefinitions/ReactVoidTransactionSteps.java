package idt.custcare.ui.stepdefinitions;

import idt.custcare.ui.portals.custcare.pages.ReactVoidTransactionPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.testng.Assert;

public class ReactVoidTransactionSteps {
    private ReactVoidTransactionPage reactVoidTransactionPage;

    public ReactVoidTransactionSteps() {
        reactVoidTransactionPage = new ReactVoidTransactionPage();
    }

    /**
     * Sets the field with specified data on Mtu Transactions Page.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName  as String.
     */
    @And("^I put \"(.*)\" date in (.*) field in Void External Transfer pop-up$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactVoidTransactionPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Verifies the messages should be displayed on debit card page.
     *
     * @param message is the value to verify the message.
     */
    @Then("^\"(.*)\" alert should be displayed in Void External Transfer pop-up$")
    public void theMessageShouldBeDisplayed(final String message) {
        Assert.assertTrue(reactVoidTransactionPage.isElementWithParameterDisplayedInPage(message), "Alert message is not displayed in Void External Transfer pop-up");
    }

    @Then("^I should see (.*) equals (.*) in Void External Transfer pop-up")
    public void iShouldSeeAccountHistoryPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactVoidTransactionPage.getElementValueInPage(expectedParameter), expectedValue);
    }
}
