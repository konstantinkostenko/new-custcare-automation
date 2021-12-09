package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import idt.custcare.ui.portals.custcare.pages.ReactMtuQueryPage;
import org.testng.Assert;

/**
 * Contains steps definition methods for React Mtu Query page.
 */
public class ReactMtuSteps {

    private ReactMtuQueryPage reactMtuQueryPage;

    /**
     * Initializes an instance of {@link ReactMtuSteps}.
     */
    public ReactMtuSteps() {
        reactMtuQueryPage = new ReactMtuQueryPage();
    }

    /**
     * Clicks an element on Mtu Query Page.
     *
     * @param fieldName as String.
     */
    @When("^I click on (.*) on Mtu Page in React application$")
    public void clickElement(final String fieldName) {
        reactMtuQueryPage.clickOnButton(fieldName);
    }

    /**
     * Verifies that element displays expected value on Mtu Page.
     *
     * @param fieldName    as String.
     * @param expectedText as String.
     */
    @Then("^I verify that (.*) displays (.*) on Mtu Page in React application$")
    public void verifyTextDisplayedInReact(final String fieldName, final String expectedText) {
        String actualMessage = reactMtuQueryPage.getText(fieldName);
        Assert.assertEquals(actualMessage, expectedText,
                String.format("Expected was %s but displayed is %s on Mtu Query Page.", expectedText, actualMessage));
    }

    /**
     * Fills text in element on Mtu Query Page.
     *
     * @param fieldName  as String.
     * @param fieldValue as String.
     */
    @And("^I fill (.*) field with \"(.*)\" value in React application$")
    public void FillFieldInReact(final String fieldName, final String fieldValue) {
        reactMtuQueryPage.fillFieldIfValueNotNull(fieldName, fieldValue);
    }

    /**
     * Sets specified data into the field on Mtu Query Page.
     *
     * @param dateFieldValue as String.
     * @param dateFieldName  as String.
     */
    @And("^I put (.*) date in (.*) field in React application$")
    public void fillDateFieldInReact(String dateFieldValue, String dateFieldName) {
        reactMtuQueryPage.setDateField(dateFieldValue, dateFieldName);
    }

    /**
     * Verifies that correct date range is displayed in MTU search page.
     */
    @Then("^I verify that (.*) field displays (.*) date$")
    public void verifyDefaultSearchRange(final String fieldName, final String expectedDate) {
        String actualDate = reactMtuQueryPage.getTextOfValue(fieldName);
        Assert.assertEquals(reactMtuQueryPage.getDate(expectedDate), actualDate,
                String.format("Expected was %s but displayed is %s on Mtu Query Page.", actualDate, reactMtuQueryPage.getDate(expectedDate)));
    }

    /**
     * Chooses specific date in calendar in MTU query page.
     *
     * @param date as String.
     */
    @And("^I choose (.*) date in calendar$")
    public void iChooseDateInCalendar(final String date) {
        reactMtuQueryPage.chooseDate(date);
    }


    @Then("^I verify that (.*) is in read only$")
    public void iVerifyThatUSERNAMEIsInReadOnly(final String fieldName) {
        if (fieldName.equals("DATE RANGE")){
            Assert.assertTrue(reactMtuQueryPage.isDateRangeDisabled(), "Date Range field is not disabled");
        }else {
            Assert.assertEquals(reactMtuQueryPage.getStateReadOnlyField(fieldName), "ant-input ant-input-disabled");
        }

        //input[@id='date'][@disabled]
    }

    /**
     * Expands transaction on Mtu Query Page.
     *
     * @param fieldName as String.
     */
    @When("^I click expand button for transaction with (.*) Date$")
    public void expandTransaction(final String fieldName) {
        reactMtuQueryPage.expandTransaction(fieldName);
    }

    /**
     * Verifies that appropriate value is displayed.
     *
     * @param expectedParameter as String.
     * @param expectedValue     as String.
     */
    @Then("^I should see (.*) equals (.*) in MTU page$")
    public void iShouldSeeMtuPage(final String expectedParameter, final String expectedValue) {
        Assert.assertEquals(reactMtuQueryPage.getElementValueInPage(expectedParameter), expectedValue);
    }
    /**
     * Verifies that appropriate message displayed.
     */

    @Then("^\"(.*)\" message displayed in (.*) field in MTU page$")
    public void messageDisplayedInUSERNAMEFieldInMTUPage(final String expectedMessage, final String fieldName) {
        Assert.assertEquals(reactMtuQueryPage.getMessageByField(fieldName), expectedMessage);
    }


    @Then("^Destination location equals (.*) is displayed$")
    public void iShouldSeeDestinationAccountHistoryPage(final String expectedValue) {
        Assert.assertEquals(reactMtuQueryPage.getDestinationLocation(), expectedValue);
    }
}
