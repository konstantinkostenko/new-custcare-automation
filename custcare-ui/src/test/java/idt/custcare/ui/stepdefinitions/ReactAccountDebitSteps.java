package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactAccountDebitPage;
import org.testng.Assert;

public class ReactAccountDebitSteps {
    private ReactAccountDebitPage reactAccountDebitPage;

    public ReactAccountDebitSteps() {
        reactAccountDebitPage = new ReactAccountDebitPage();
    }

    /**
     * Verifies the messages should be displayed on debit card page.
     */
    @Then("^I should see Account Debit pop-up$")
    public void accountDebitPageDisplayed() {
        Assert.assertTrue(reactAccountDebitPage.isAccountDebitPage());
    }

    /**
     * Click element on Account Debit Page.
     *
     * @param button as String.
     */
    @And("^I click (.*) button in Account Debit pop-up$")
    public void clickButton(final String button) {
        reactAccountDebitPage.clickWebElement(button);
    }

    /**
     * Sets the field with specified data on Mtu Transactions Page.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName  as String.
     */
    @And("^I put \"(.*)\" date in (.*) field in Account Debit pop-up$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactAccountDebitPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Verifies the messages should be displayed on debit card page.
     *
     * @param message is the value to verify the message.
     */
    @Then("^\"(.*)\" alert should be displayed in Account Debit pop-up$")
    public void theMessageShouldBeDisplayed(final String message) {
        Assert.assertTrue(reactAccountDebitPage.isElementWithParameterDisplayedInPage(message), "Alert message is not displayed in Account Debit pop-up");
    }

    /**
     * Verifies value of Debit Amount field.
     *
     * @param value as String.
     */
    @Then("^Value of (.*) equels to \"(.*)\" displayed in Account Debit pop-up$")
    public void checksValueOfDebitAmount(final String element,final String value) {
        Assert.assertEquals(reactAccountDebitPage.getTextValue(element),value, "Debit Amount value in Account Debit pop-up is incorrect");
    }

    /**
     * Chooses option from Maintenance menu.
     *
     * @param button as String.
     */
    @And("^I choose (.*) from Maintenance menu$")
    public void iChooseOptionFromMaintenanceMenu(final String button) {
        reactAccountDebitPage.clickWebElement(button);
    }
}
