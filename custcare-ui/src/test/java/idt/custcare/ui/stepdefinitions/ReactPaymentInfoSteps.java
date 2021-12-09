package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactPaymentInfoPage;
import idt.custcare.ui.utils.CommonActions;
import org.testng.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Contains steps definition methods for Payment Info page.
 */
public class ReactPaymentInfoSteps {
    private ReactPaymentInfoPage reactPaymentInfoPage;

    @DataTableType(replaceWithEmptyString = "[blank]")
    public String stringType(String cell) {
        return cell;
    }
    /**
     * Initializes an instance of {@link ReactPaymentInfoSteps}.
     */
    public ReactPaymentInfoSteps() {
        reactPaymentInfoPage = new ReactPaymentInfoPage();
    }

    /**
     * Clicks element in Payment Info page.
     *
     * @param button as String.
     */
    @And("^I click (.*) button in Payment Info Page$")
    public void clickButton(final String button) {
        reactPaymentInfoPage.clickElement(button);
    }

    /**
     * Selects Payment Type.
     *
     * @param paymentType as String.
     */
    @And("^I select Payment Type = (.*) in Payment Info Page$")
    public void selectPaymentType(final String paymentType) {
        reactPaymentInfoPage.selectPaymentType(paymentType);
    }

    /**
     * Chooses expiration month.
     *
     * @param month as String.
     */
    @And("^I choose (.*) expiration month in Payment Info page in React application$")
    public void iChooseExpMonth(final String month) {
        reactPaymentInfoPage.selectExpirationMonth(month);
    }

    /**
     * Chooses expiration year.
     *
     * @param year as String.
     */
    @And("^I choose (.*) expiration year in Payment Info page in React application$")
    public void iChooseExpYear(final String year) {
        reactPaymentInfoPage.selectExpirationYear(year);
    }

    /**
     * Chooses value from the the list.
     *
     * @param value   as String.
     * @param element as String.
     */
    @And("^I choose (.*) from (.*) list in Payment Info page in React application$")
    public void chooseElementFromList(final String value, final String element) {
        reactPaymentInfoPage.selectElementFromList(element, value);
    }

    /**
     * Sets value in field.
     *
     * @param value as String.
     * @param field as String.
     */
    @And("^I set (.*) value in (.*) field in Payment Info page in React application$")
    public void iSetValueInField(final String field, final String value) {
        reactPaymentInfoPage.setDateField(field, value);
    }

    /**
     * Verifies that appropriate value is displayed.
     *
     * @param expectedParameter as String.
     * @param expectedValue     as String.
     */
    @Then("^I should see (.*) equals (.*) in Payment Info page$")
    public void iShouldSeeAccountQueryPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactPaymentInfoPage.getElementValueInPage(expectedParameter), expectedValue);
    }

    /**
     * Verifies that appropriate value is displayed.
     *
     * @param expectedParameter as String.
     */
    @Then("^I should see (.*) equals (.*) in Credit Risk pane$")
    public void iShouldSeeInCreditRiskPane(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactPaymentInfoPage.getTextOfElementValueInPage(expectedParameter), expectedValue);
    }

    /**
     * Sets checkbox to true of false.
     *
     * @param checkbox as String.
     * @param value    as String.
     */
    @Then("^Set (.*) checkbox = (.*) in Payment Info page$")
    public void setCheckbox(final String checkbox, final boolean value) {
        reactPaymentInfoPage.setCheckbox(checkbox, value);
    }

    /**
     * Verifies that correct data is displayed in Credit/Debit Card block.
     *
     * @param cardInfo info will be used to compare with Credit/Debit Card data.
     */
    @And("^I compare Credit/Debit Card info in Payment Info page:$")
    public void iCompareCreditCardInfoInPaymentInfoPage(final Map<String, String> cardInfo) {
        CommonActions.waitFor(1);
        Map<String, String> actualCardData = reactPaymentInfoPage.creditCardInfo();
        Assert.assertEquals(actualCardData, cardInfo, "Payment information does not match expected values.");
    }

    /**
     * Verifies "Customer info is empty" message displayed.
     */
    @Then("^Customer info is empty alert message displays in Payment Info page$")
    public void customerInfoEmptyAlertMessage() {
        Assert.assertTrue(reactPaymentInfoPage.isCustomerInfoEmpty(),
                "'Customer info is empty' alert message is not displayed as expected.");
    }

    /**
     * Verifies that appropriate message displayed.
     */
    @Then("^'(.*)' message displayed in Payment Info page$")
    public void customerDataSavedMessage(String message) {
        Assert.assertTrue(reactPaymentInfoPage.isMessageDisplayed(message),
                "Message is not displayed as expected.");
    }

    /**
     * Verifies that correct data is displayed in Recharge Settings block.
     *
     * @param rechargeSettings info will be used to compare with Recharge Settings data.
     */
    @And("^I compare Auto Recharge info in Payment Info page:$")
    public void iCompareAutoRechargeInfoInPaymentInfoPage(final Map<String, String> rechargeSettings) {
        CommonActions.waitFor(1);
        Map<String, String> actualRechargeData = reactPaymentInfoPage.autoRechargeInfo();
        Assert.assertEquals(actualRechargeData, rechargeSettings, "Auto Recharge information does not match expected values.");
    }


    /**
     * Verifies that correct data is displayed in Recharge Limits block.
     *
     * @param rechargeLimits info will be used to compare with Recharge Limits data.
     */
    @And("^I compare Recharge Limits info in Payment Info page:$")
    public void iCompareRechargeLimitsInfoInPaymentInfoPage(final Map<String, String> rechargeLimits) {
        CommonActions.waitFor(1);
        Map<String, String> actualRechargeLimitsData = reactPaymentInfoPage.rechargeLimitsInfo();
        Assert.assertEquals(actualRechargeLimitsData, rechargeLimits, "Recharge Limits information does not match expected values.");
    }

    /**
     * Selects street from autocomplete list.
     *
     * @param expectedParameter as String.
     */
    @Then("^I select (.*) option from autocomplete list in Payment Info page$")
    public void iSelectStreetInAutocomplete(final String expectedParameter) {
        reactPaymentInfoPage.selectStreetFromAutocomplete(expectedParameter);
    }

    /**
     * Verifies autocomplete list is not displayed.
     */
    @Then("^I should not see autocomplete list for Street1 in Payment Info page$")
    public void iShouldNotSeeAutocomplete() {
        Assert.assertFalse(reactPaymentInfoPage.isAutoCompleteDisplayed(), "Autocomplete is displayed");
    }

    /**
     * Verifies the success message and the amount for Recharge Bank Account
     * @param messages
     */
    @Then("^the following messages are displayed in Payment Info page$")
    public void theFollowingMessagesAreDisplayedInPaymentInfoPage(final List<String> messages) {
        messages.forEach(message -> {
            Assert.assertTrue(reactPaymentInfoPage.isTextMessageDisplayed(message));
        });
    }

    /**
     * Verifies the transaction amount fixed on recharge section
     * @param field transaction amount
     * @param amount recharge value
     */
    @Then("^I should see (.*) equals (.*) in Recharge section$")
    public void iShouldSeeTransactionAmountEqualsInRechargeSection(String field, String amount) {
        Assert.assertEquals( reactPaymentInfoPage.getValueInRechargeSection(), amount);
    }

    /**
     * Verify the Unable Recharge message
     * @param rechargeMessage String
     */
    @Then("^(.*) message displayed in Recharge section$")
    public void unableToRechargeMessageDisplayedInRechargeSection(String rechargeMessage) {
        Assert.assertTrue(reactPaymentInfoPage.isTextUnableRecharge(rechargeMessage));
    }
}