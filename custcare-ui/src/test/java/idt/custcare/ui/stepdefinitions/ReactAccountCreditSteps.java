package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactAccountCreditPage;
import org.testng.Assert;

public class ReactAccountCreditSteps {
    private ReactAccountCreditPage reactAccountCreditPage;

    public ReactAccountCreditSteps() {
        reactAccountCreditPage = new ReactAccountCreditPage();
    }

    /**
     * Verifies that Account Credit pop-up opens.
     */
    @Then("^I should see Account Credit pop-up$")
    public void accountDebitPageDisplayed() {
        Assert.assertTrue(reactAccountCreditPage.isAccountCreditPage());
    }

    /**
     * Click element on Account Credit Page.
     *
     * @param button as String.
     */
    @And("^I click (.*) button in Account Credit pop-up$")
    public void clickButton(final String button) {
        reactAccountCreditPage.clickWebElement(button);
    }

    /**
     * Sets the field with specified data on Account Credit pop-up.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName  as String.
     */
    @And("^I put \"(.*)\" date in (.*) field in Account Credit pop-up$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactAccountCreditPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Verifies the messages should be displayed on Account Credit pop-up.
     *
     * @param message is the value to verify the message.
     */
    @Then("^\"(.*)\" alert message should be displayed for \"(.*)\" field$")
    public void theMessageShouldBeDisplayed(final String message, final String field) {
        Assert.assertTrue(reactAccountCreditPage.isElementWithParameterDisplayedInPage(field,message), "Alert message is not displayed in Account Credit pop-up");
    }

    /**
     * Verifies value of Credit Amount field.
     *
     * @param value as String.
     */
    @Then("^Value of (.*) equels to \"(.*)\" displayed in Account Credit pop-up$")
    public void checksValueOfDebitAmount(final String element, final String value) {
        Assert.assertEquals(reactAccountCreditPage.getTextValue(element), value, "Credit Amount value in Account Credit pop-up is incorrect");
    }

    /**
     * Choose Access type.
     *
     * @param value as String.
     */
    @And("^I choose (.*) from Reason list in Account Credit pop-up$")
    public void iSetValueInAccessTypeField(final String value) {
        reactAccountCreditPage.chooseReason(value);
    }

    /**
     * Choose Access type.
     *
     * @param value as String.
     */
    @And("^I check that (.*) reason displayed in Reason list$")
    public void isReasonDisplayed(final String value) {
        reactAccountCreditPage.isReason(value);
    }
}
