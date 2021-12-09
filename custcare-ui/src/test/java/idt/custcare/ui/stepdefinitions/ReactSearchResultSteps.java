package idt.custcare.ui.stepdefinitions;

import idt.custcare.ui.utils.CommonActions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactSearchResultPage;
import io.cucumber.java.en.When;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

/**
 * Contains steps definition methods for SPA Account Info page.
 */
public class ReactSearchResultSteps {
    private ReactSearchResultPage reactSearchResultPage;
    private double currentBalance;

    /**
     * Initializes an instance of {@link ReactSearchResultSteps}.
     */
    public ReactSearchResultSteps() {
        reactSearchResultPage = new ReactSearchResultPage();
    }

    /**
     * Verifies that element is displayed in Search Result page.
     */
    @And("^I see (.*) in Search Result page$")
    public void iSeeElementInSearchResultPage(final String element) {
        Assert.assertTrue(reactSearchResultPage.isElementDisplayed(element), "Element is not displayed as expected.");
    }

    /**
     * Verifies that appropriate value is displayed.
     *
     * @param expectedParameter as String.
     * @param expectedValue     as String.
     */
    @Then("^I should see (.*) equals (.*) in Search Result page$")
    public void iShouldSeeAccountQueryPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactSearchResultPage.getElementValueInPage(expectedParameter), expectedValue);
    }

    /**
     * Verifies that VIP customer lable is displayed.
     */
    @Then("^I (.*) see (.*) label in Customer block in Search Result page$")
    public void iShouldSeeVipCustomerLable(String condition, String labelName) {
        if(condition.equals("should")) {
            Assert.assertTrue(reactSearchResultPage.isCustomerValueIndicator(labelName),"Expected label is NOT displayed");
        } else {
            Assert.assertFalse(reactSearchResultPage.isCustomerValueIndicatorLabel(), "Label is displayed");
        }
    }

    /**
     * Verifies that appropriate value is displayed in Info panel.
     *
     * @param expectedParameter as String.
     * @param expectedValue     as String.
     */
    @Then("^I should see (.*) equals (.*) in Info panel$")
    public void iShouldSeeElementsInInfoPanel(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactSearchResultPage.getTextOfElementValueInInfoPanel(expectedParameter), expectedValue);
    }

    /**
     * Verifies that appropriate value is displayed.
     *
     * @param expectedParameter as String.
     * @param expectedValue     as String.
     */
    @Then("^I verifies that (.*) equals to (.*) displayed in Search Result page$")
    public void iVerifiesAccountQueryPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactSearchResultPage.getTextOfElementValueInPage(expectedParameter), expectedValue);
    }

    /**
     * Verifies that correct recent calls data is displayed in the table.
     *
     * @param recentCalls info will be used to compare with transaction query data.
     */
    @Then("^I compare recent calls in Search Result page:$")
    public void iCompareRecentCallsInSearchResultPage(final List<Map<String, String>> recentCalls) {
        List<Map<String, String>> actualRecentCalls = reactSearchResultPage.findRecentCalls();
        Assert.assertEquals(actualRecentCalls, recentCalls, "Recent calls does not match expected values.");
    }

    /**
     * Click element in Search Result page.
     *
     * @param button as String.
     */
    @And("^I click (.*) button in Search Result Page$")
    public void clickButton(final String button) {
        reactSearchResultPage.clickElement(button);
    }

    /**
     * Sets the date field with specified date in Search Result page.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName  as String.
     */
    @And("^I put (.*) date in (.*) field in Search Result in React application$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactSearchResultPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Verifies text of new comment in Search Result page.
     *
     * @param comment as String.
     */
    @And("^I verify that new added comment equals to (.*) in Search Result Page$")
    public void iVerifyNewAddedCommentEqualsToValue(String comment) {
        Assert.assertEquals(reactSearchResultPage.getCommentText(), comment, "New added comment does not match expected values.");
    }

    /**
     * Verifies that correct recent calls data is displayed in the table.
     *
     * @param usedPromoCodes info will be used to compare with transaction query data.
     */
    @Then("^I compare used promo codes in Search Result page:$")
    public void iCompareUsedPromoCodesInSearchResultPage(final List<Map<String, String>> usedPromoCodes) {
        List<Map<String, String>> actualUsedPromoCodes = reactSearchResultPage.findUsedPromoCodes();
        Assert.assertEquals(actualUsedPromoCodes, usedPromoCodes, "Recent calls does not match expected values.");
    }

    /**
     * Verifies that no data displayed in Used Promo Codes table.
     */
    @And("^I verify that no data displayed in Used Promo Codes table$")
    public void iVerifyNoDataDisplayedInUsedPromoCodes() {
        Assert.assertTrue(reactSearchResultPage.isNoUsedPromoCodes(), "No Data message is not displayed in Used Promo Codes table");
    }

    /**
     * Verifies text of new comment in Search Result page.
     *
     * @param value as String.
     */
    @And("^I verify that Balance equals to (.*) in Search Result Page$")
    public void iVerifyBalanceEqualsToValue(String value) {
        Assert.assertEquals(reactSearchResultPage.getBalanceValue(), value, "Balance value does not match expected values.");
    }

    /**
     * Verifies text of new comment in Search Result page.
     *
     * @param value as String.
     */
    @And("^I select page (.*) in Used Promo Codes pagination block$")
    public void iSelectPageInUsedPromoCodes(String value) {
        reactSearchResultPage.openPageInUsedPromoCodesPaginationBlock(value);
    }

    /**
     * Checks current balance value in Account info page and save in in currentBalance object.     *
     */
    @When("^I check current balance in Search Results page$")
    public void checkCurrentBalance() {
        currentBalance = reactSearchResultPage.getCurrentBalance();
    }

    /**
     * Checks current balance value in Account info page and save in in currentBalance object.     *
     */
    @When("^I click Recharge link in Search Result Page$")
    public void iClickRechargeLinkInSearchResultPage() {
        reactSearchResultPage.clickOnRechargeLinkButton();
    }

    /**
     * Checks that a current balance has been increased after recharge success.
     */
    @Then("^I check that current balance was increased after recharge for (.*) in search results page$")
    public void checkCurrentBalanceAfterRecharge(String value) {
        CommonActions.waitFor(1);
        double balance = reactSearchResultPage.getCurrentBalance();
        double amount = Double.parseDouble(value);
        double balanceAfterRecharge = currentBalance + amount;
        Assert.assertEquals(balance, balanceAfterRecharge, "Balance after recharge does not match expected value.");
    }

    /**
     * Checks that a current balance has been increased after recharge success.
     */
    @Then("^I check that current balance was decreased after account debit in search results page$")
    public void checkCurrentBalanceAfterDebit() {
        double balance = reactSearchResultPage.getCurrentBalance();
        double balanceAfterRecharge = currentBalance - 5.0;
        Assert.assertEquals(balance, balanceAfterRecharge, "Balance after recharge does not match expected value.");
    }

    /**
     * Checks that a current balance has been increased after recharge success.
     */
    @Then("^I check that current balance was increased after account credit in search results page$")
    public void checkCurrentBalanceAfterCredit() {
        double balance = reactSearchResultPage.getCurrentBalance();
        double balanceAfterRecharge = currentBalance + 5.0;
        Assert.assertEquals(balance, balanceAfterRecharge, "Balance after recharge does not match expected value.");
    }

    /**
     * Opens Maintenance menu.
     */
    @And("^I open Maintenance menu in React application$")
    public void iOpenMaintenanceMenu() {
        reactSearchResultPage.openMaintenanceMenu();
    }

    @Then("^I click Show all calls link in Search Result Page$")
    public void iClickSHOW_ALL_CALLSLinkInSearchResultPage() {
        reactSearchResultPage.clickShowAllCallsLinkButton();
    }

    @Then("^I (.*) see Show all calls Link in Recent Calls Block$")
    public void iShouldNotSeeShowAllCallLinkInRecentCallsBlock(String example) {
        if (example.equals("should not")){
            Assert.assertFalse(reactSearchResultPage.isLinkShowAllCallsIsDisplayed(), "Show all calls");
        } else if (example.equals("should")){
            Assert.assertTrue(reactSearchResultPage.isLinkShowAllCallsIsDisplayed(), "Show all calls");
        }
    }
}