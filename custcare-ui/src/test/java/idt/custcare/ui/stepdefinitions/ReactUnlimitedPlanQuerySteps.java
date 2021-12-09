package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import idt.custcare.ui.portals.custcare.pages.ReactUnlimitedPlanQueryPage;
import org.testng.Assert;

import java.util.List;
import java.util.Map;

/**
 * Contains steps definition methods for Unlimited Plan Query page.
 */
public class ReactUnlimitedPlanQuerySteps {
    private ReactUnlimitedPlanQueryPage reactUnlimitedPlanQueryPage;

    /**
     * Initializes an instance of {@link ReactUnlimitedPlanQuerySteps}.
     */
    public ReactUnlimitedPlanQuerySteps() {
        reactUnlimitedPlanQueryPage = new ReactUnlimitedPlanQueryPage();
    }

    /**
     * Clicks an element.
     */
    @And("^I click on Unlimited Plan Query tab in React application$")
    public void iClickUnlimitedPlanQueryTab() {
        reactUnlimitedPlanQueryPage.clickUnlimitedPlanQueryTab();
    }

    /**
     * Sets PIN.
     *
     * @param value as String.
     */
    @And("^I set (.*) into PIN/Account field in Unlimited Plan Query page in React application$")
    public void iSetValueInPinField(final String value) {
        reactUnlimitedPlanQueryPage.setPin(value);
    }

    /**
     * Choose Country.
     *
     * @param value as String.
     */
    @And("^I choose (.*) from Country list in Unlimited Plan Query page in React application$")
    public void iChooseCountry(final String value) {
        reactUnlimitedPlanQueryPage.chooseCountry(value);
    }

    /**
     * Search for Rates.
     */
    @And("^I click Search button in Unlimited Plan Query page in React application$")
    public void iSearchForClass() {
        reactUnlimitedPlanQueryPage.clickSearch();
    }

    /**
     * Verifies that Unlimited Plan Query page is displayed correctly.
     */
    @Then("^I should see Unlimited Plan Query page in React application$")
    public void iShouldSeeUnlimitedPlanQueryPage() {
        Assert.assertTrue(reactUnlimitedPlanQueryPage.isUnlimitedPlanQueryPage(), "Unlimited Plan Query page is not displayed as expected.");
    }

    /**
     * Verifies that Plans table is displayed.
     */
    @Then("^I should see Plans table in Unlimited Plan Query page in React application$")
    public void iShouldSeePlansTable() {
        Assert.assertTrue(reactUnlimitedPlanQueryPage.isPlansTable(), "Plans table is not displayed as expected.");
    }

    /**
     * Verifies that correct plan data is displayed in the table.
     *
     * @param plansInfo info will be used to compare with plan query data.
     */
    @Then("^I compare transactions in Unlimited Plan Query page in React application:$")
    public void iComparePlansInUnlimitedPlanQueryPage(final List<Map<String, String>> plansInfo) {
        List<Map<String, String>> actualPlanData = reactUnlimitedPlanQueryPage.findPlanData();
        Assert.assertEquals(actualPlanData, plansInfo, "Plan data does not match expected values.");
    }


    /**
     * Verifies that Plans table is displayed.
     */
    @Then("^I should see no data displayed in Unlimited Plan Query page in React application$")
    public void iShouldSeeNoData() {
        Assert.assertTrue(reactUnlimitedPlanQueryPage.isNoData(), "No data is not displayed in Plans table as expected.");
    }
}
