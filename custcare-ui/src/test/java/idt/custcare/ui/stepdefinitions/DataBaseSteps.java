package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import idt.custcare.ui.config.ReservedWords;
import idt.custcare.ui.database.DataBases;
import idt.custcare.ui.database.DbQueries;
import idt.custcare.ui.utils.DbUtils;
import org.testng.Assert;

import java.util.Map;

import static org.testng.Assert.assertEquals;

/**
 * Contains steps definition methods for database operations.
 */
public class DataBaseSteps {
    /**
     * Verifies that a specific amount of data is contained inside the specified database and table.
     *
     * @param expectedNumberOfRows the expected number of rows to be found in the table.
     * @param table                the table name that contains the searched data.
     * @param databaseName         the database name that contains the searched data.
     * @param filter               the map of fields and values for the records to
     *                             find in the specified table.
     */
    @Then("^There should be (.*) records found when I look for data in (.*) (.*) table with values:$")
    public void thereShouldBeRecordsFoundWhenLookForDataInTableWithValues(final int expectedNumberOfRows,
                                                                          final String table,
                                                                          final DataBases databaseName,
                                                                          final Map<String, String> filter) {
        int actualNumberOfRows = DbUtils.getTotalRowsOfASelectQuery(table, filter, databaseName);
        assertEquals(actualNumberOfRows, expectedNumberOfRows, String.format("Error: Number of expected found records: "
                + "%s is different than the actual found records: %s", expectedNumberOfRows, actualNumberOfRows));
    }

    /**
     * Verifies that specific data is contained inside the specified database and table.
     *
     * @param column       the column name that contains the searched data.
     * @param table        the table name that contains the searched data.
     * @param databaseName the database name that contains the searched data.
     * @param filter       the map of fields and values for the records to
     *                     find in the specified table.
     */
    @Then("^I should obtain null as result, when I look for (.*) data in (.*) (.*) table with values:$")
    public void shouldObtainResultWhenLookForDataInTableWithValues(final String column, final String table,
                                                                   final DataBases databaseName,
                                                                   final Map<String, String> filter) {
        String columnName = column.equalsIgnoreCase(ReservedWords.ALL.val())
                ? ReservedWords.ASTERISK_SYMBOL.val() : column;
        String actualResult = DbUtils.getRowDataOfASelectQuery(table, columnName, filter, databaseName);
        Assert.assertNull(actualResult, String.format("Error: Expected found result: %s is not null as expected",
                actualResult));
    }

    /**
     * Updates voucher balance.
     *
     * @param table as String, table name.
     * @param value as String, values in table.
     * @param pin   as String.
     */
    @When("^I update balance in table (.*) with values (.*) for pin (.*)$")
    public void updatePinBalance(final String table, final String value, final String pin) {
        String query = String.format(DbQueries.UPDATE_RECORD, table, value, pin);
        DbUtils.runQuery(query, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }
}
