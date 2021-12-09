package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import idt.custcare.ui.base.BasePage;
import idt.custcare.ui.database.DataBases;
import idt.custcare.ui.database.DbQueries;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.Context;
import idt.custcare.ui.utils.DbUtils;
import idt.custcare.ui.utils.SmartWait;
import org.testng.Assert;

import java.util.List;

/**
 * Contains common steps definition methods for many pages and/or components used y many scenarios.
 */
public class CommonSteps {

    /**
     * Updates the database with condition specified on the table.
     *
     * @param tableName Name of table in database
     * @param data      Data to set in records in table
     * @param condition condition as per table should be updated
     * @param dbName    Name of database.
     */
    @Given("^I update \"(.*)\" with data \"(.*)\" where \"(.*)\" on \"(.*)\" database$")
    public void updateQuery(final String tableName, final String data, final String condition, final DataBases dbName) {
        String query = String.format(DbQueries.UPDATE_RECORD, tableName, data, condition);
        DbUtils.runQuery(query, dbName);
    }

    /**
     * Runs Select query on database.
     *
     * @param clm       Name of Column in database table
     * @param tbl       Name of table in database
     * @param condition Condition as per table records should be selected
     * @param db        Name of database
     * @param ctxKey    Context Key where you want to set the retrieved scalar object.
     */
    @When("^I select \"(.*)\" from \"(.*)\" table where \"(.*)\" in \"(.*)\" database and save it as \"(.*)\" key$")
    public void selectQuery(final String clm, final String tbl, final String condition,
                            final DataBases db, final String ctxKey) {
        String whereCondition = condition;
        if (condition.contains("{currentPin}")) {
            whereCondition = condition.replace("{currentPin}", Context.getInstance().get("currentPin").toString());
        }
        String pinState = DbUtils.getDataOfASelectQuery(clm, tbl, whereCondition, db);
        Context.getInstance().add(ctxKey, pinState);
    }

    /**
     * Verifies that value retrieved from database equals to expected or not.
     *
     * @param contextKey    Context Key as String to retrieve actual value
     * @param expectedValue Expected value as String
     */
    @Then("^I verify that value saved by key \"(.*)\" equals to \"(.*)\"$")
    public void verifyTextEqualsContextKey(final String contextKey, final String expectedValue) {
        String actualValue = Context.getInstance().get(contextKey).toString();
        Assert.assertEquals(actualValue, expectedValue,
                String.format("Expected value from database is %s, but displayed is %s", expectedValue, actualValue));
    }

    /**
     * Deletes row(s) from database.
     *
     * @param tableName    Name of database table
     * @param condition    condition to be used as for where clause
     * @param databaseName Name of database
     */
    @Given("^I delete from \"(.*)\" where \"(.*)\" in \"(.*)\" database$")
    public void deleteQuery(final String tableName, final String condition, final DataBases databaseName) {
        final String deleteQuery = String.format(DbQueries.DELETE_RECORD, tableName, condition, databaseName);
        DbUtils.runQuery(deleteQuery, databaseName);
    }

    /**
     * Accepts transaction.
     */
    @And("^I accept the transaction$")
    public void iAcceptTheTransaction() {
        BasePage.acceptTransaction();
    }

    /**
     * Clicks on Ok alert button.
     */
    @When("^I click on Ok alert$")
    public void iClickOnOkAlert() {
        CommonActions.acceptAlert();
    }

    /**
     * Verifies that page with expected url opens or not.
     * @param pageTitle as String
     * @param expectedUrl as String
     */
    @Then("^I verify that \"(.*)\" page with \"(.*)\" url is displayed$")
    public void verifyCurrentUrl(final String pageTitle, final String expectedUrl){
        String actualUrl = CommonActions.getCurrentUrl();
        String errorMessage = String.format("%s url doesnt contains %s. The user is not redirected to %s", actualUrl, expectedUrl, pageTitle);
        Assert.assertTrue(actualUrl.contains(expectedUrl), errorMessage);
    }

    @Then("^I verify that alert box displays message \"(.*)\"$")
    public void alertBoxShouldDisplayMessage(final String expectedMessage) {
        String actualMessage = CommonActions.getAlertMessage().replace("\n", "");;
        Assert.assertEquals(actualMessage, expectedMessage, String.format("Expected was %s, but displayed is %s in alert box", expectedMessage, actualMessage));
    }

    /**
     * Verifies if the popup window opens.
     */
    @Then("I verify that popup window opens")
    public void verifyPopupWindowOpens() {
        SmartWait.waitUntil(()->CommonActions.getWindowHandles().size()>0);
        Assert.assertTrue(CommonActions.getWindowHandles().size()>0,  "Popup window did not open.");
    }

    /**
     * Verifies that popup window is not displayed
     */
    @Then("I verify that Popup window is not displayed")
    public void verifyPopupWindowIsNotDisplayed() {
        Assert.assertTrue(CommonActions.getWindowHandles().size() == 1,  "Popup window is still displayed.");
    }

    @When("^I insert into \"(.*)\" with values \"(.*)\" on \"(.*)\" database$")
    public void insertRecord(final String tableName, final String insertValues, final DataBases databaseName) {
        final String insertQuery = String.format(DbQueries.INSERT_RECORD2, tableName, insertValues);
        DbUtils.runQuery(insertQuery, databaseName);
    }

    /**
     * Switch from parent tab to another tab.
     */
    @And("I switch to another tab from parent tab")
    public void switchToAnotherTabFromParentTab() {
        List<String> handles = CommonActions.getWindowHandles();
        String anotherHandle = handles.get(1);
        CommonActions.switchWindow(anotherHandle);
        Context.getInstance().add("handles", handles);
    }

    /**
     * Switch from another tab to parent tab.
     */
    @And("I switch to parent tab from another tab")
    public void switchToParentTabFromAnotherTab() {
        List<String> handles = (List<String>)Context.getInstance().get("handles");
        String parentHandle = handles.get(0);
        CommonActions.closeWindowDriver();
        CommonActions.switchWindow(parentHandle);
    }
}
