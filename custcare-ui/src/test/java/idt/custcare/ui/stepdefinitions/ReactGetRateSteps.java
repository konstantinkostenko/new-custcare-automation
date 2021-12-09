package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactGetRatePage;
import org.testng.Assert;

import java.util.Map;

/**
 * Contains steps definition methods for React Get Rate page.
 */
public class ReactGetRateSteps {
    private ReactGetRatePage reactGetRatePage;

    /**
     * Initializes an instance of {@link ReactGetRateSteps}.
     */
    public ReactGetRateSteps() {
        reactGetRatePage = new ReactGetRatePage();
    }

    /**
     * Clicks an element.
     */
    @And("^I click on Get Rate tab in React application$")
    public void iClickGetRateTab() {
        reactGetRatePage.clickGetRateTab();
    }

    /**
     * Sets PIN.
     *
     * @param value as String.
     */
    @And("^I set (.*) into PIN/Account field in Rate Query page in React application$")
    public void iSetValueInPinField(final String value) {
        reactGetRatePage.setPin(value);
    }

    /**
     * Choose Country.
     *
     * @param value as String.
     */
    @And("^I choose (.*) from Country list in Rate Query page in React application$")
    public void iChooseCountry(final String value) {
        reactGetRatePage.chooseCountry(value);
    }

    /**
     * Choose Access type.
     *
     * @param value as String.
     */
    @And("^I choose (.*) from Access Type list in Rate Query page in React application$")
    public void iSetValueInAccessTypeField(final String value) {
        reactGetRatePage.chooseAccessType(value);
    }

    /**
     * Choose Amount.
     *
     * @param value as String.
     */
    @And("^I choose (.*) from Amount list in Rate Query page in React application$")
    public void iSetValueInAmountField(final String value) {
        reactGetRatePage.chooseAmount(value);
    }

    /**
     * Search for Rates.
     */
    @And("^I click Search button in Rate Query page in React application$")
    public void iSearchForClass() {
        reactGetRatePage.clickSearch();
    }

    /**
     * Verifies that Rate Query page is displayed.
     */
    @Then("^I should see Rate Query page in React application$")
    public void iShouldSeeRateQueryPage() {
        Assert.assertTrue(reactGetRatePage.isRateQueryPage(), "Rate Query page is not displayed as expected.");
    }

    /**
     * Verifies that Rates table is displayed.
     */
    @Then("^I should see Rates table in Rate Query page in React application$")
    public void iShouldSeeRateTable() {
        Assert.assertTrue(reactGetRatePage.isRatesTable(), "Rate table is not displayed as expected.");
    }

    /**
     * Verifies that correct rate data is displayed in the table.
     *
     * @param rateInfo info will be used to compare with rate query data.
     */
    @And("^I compare rates in Rate Query page in React application:$")
    public void iCompareRatesInRateQueryPage(final Map<String, String> rateInfo) {
        Map<String, String> actualRateData = reactGetRatePage.findRateData();
        Assert.assertEquals(actualRateData, rateInfo, "Rate data does not match expected values.");
    }
}
