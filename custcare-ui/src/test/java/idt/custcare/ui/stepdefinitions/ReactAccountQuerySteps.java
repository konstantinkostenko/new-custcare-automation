package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import idt.custcare.ui.portals.custcare.pages.ReactAccountQueryPage;
import io.cucumber.java.en.Then;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

/**
 * Contains steps definition methods for React Account Query page.
 */
public class ReactAccountQuerySteps {
    private ReactAccountQueryPage reactAccountQueryPage;

    /**
     * Initializes an instance of {@link ReactAccountQuerySteps}.
     */
    public ReactAccountQuerySteps() {
        reactAccountQueryPage = new ReactAccountQueryPage();
    }

    /**
     * Sets Control Number.
     *
     * @param value as String.
     */
    @And("^I set (.*) Control Number in Query Search page in React application$")
    public void iSetValueInControlNumberField(final String value) {
        reactAccountQueryPage.setCtnum(value);
    }

    /**
     * Clicks an element.
     */
    @And("^I click on Query tab in React application$")
    public void iClickQueryTab() {
        reactAccountQueryPage.clickQueryTab();
    }

    /**
     * Sets PIN.
     *
     * @param value as String.
     */
    @And("^I set (.*) PIN in Query Search page in React application$")
    public void iSetValueInPinField(final String value) {
        reactAccountQueryPage.setPin(value);
    }

    /**
     * Search for Account.
     */
    @And("^I search for account in React application$")
    public void iSearchForAccount() {
        reactAccountQueryPage.clickSearch();
    }

    /**
     * Verifies that Account Information popup is displayed.
     */
    @Then("^I should see Account Information popup$")
    public void iShouldSeeAccountInformationPopUp() {
        Assert.assertTrue(reactAccountQueryPage.isAccountInformation(), "Account Information popup is not displayed as expected.");
    }

    /**
     * Closes alert message.
     */
    @And("^I close alert message$")
    public void iCloseAlertMessage() {
        reactAccountQueryPage.closeAlertMessage();
    }

    /**
     * Verifies account not found message displayed.
     */
    @Then("^Account Not Found message displayed in Query Search page in React application$")
    public void accountNotFountDisplayedInAccountQueryPageSpa() {
        Assert.assertTrue(reactAccountQueryPage.isAccountNotFound(),
                "Account Not Found error message is not displayed as expected.");
        reactAccountQueryPage.closeAlertMessage();
    }

    /**
     * Verifies that expectedMessage is displayed in Account Information popup.
     *
     * @param expectedMessage as String.
     */
    @And("^(.*) message displayed in Account Information popup$")
    public void messageDisplayed(final String expectedMessage) {
        Assert.assertEquals(reactAccountQueryPage.getAccountInformationMessage(), expectedMessage);
    }

    /**
     * List of Multiple Accounts in popup.
     */
    @And("I compare Accounts in Account Information popup in React application:")
    public void iCompareAccountsInAccountInformationPopupInReactApplication(final List<Map<String, String>> accountInfo) {
        List<Map<String, String>> actualAccountData = reactAccountQueryPage.findSeveralAccounts();
        Assert.assertEquals(actualAccountData, accountInfo, "Multiple Accounts data does not match expected values.");
    }

    /**
     * Clicks an element on first record on Account Information popup.
     */
    @And("^I click on (.*) on Account Information popup$")
    public void iClickOnFirstRecordOnAccountInformationPopup(final String fieldName) {
        reactAccountQueryPage.clickFirstRecord(fieldName);
    }

    /**
     * Closes Account Information popup.
     */
    @And("^I close Account Information popup$")
    public void iCloseAccountInformationPopup() {
        reactAccountQueryPage.closeAccountInformationPopup();
    }

    /**
     * Clicks an element for Previous and Next button on Account Information popup.
     */
    @And("^I click on (.*) of pagination in Account Information popup$")
    public void clickButton(final String button) {
        reactAccountQueryPage.clickOnButton(button);
    }
}


