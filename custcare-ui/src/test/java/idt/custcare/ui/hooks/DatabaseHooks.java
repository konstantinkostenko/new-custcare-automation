package idt.custcare.ui.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import idt.custcare.ui.database.DataBases;
import idt.custcare.ui.database.DbQueries;
import idt.custcare.ui.utils.DbUtils;

/**
 * Hooks for database operations.
 */
public class DatabaseHooks {

    /**
     * Deletes row with pin equal to 83782422711 and trans_id equal to 'C'.
     */
    @Before(value = "@deleteFromCCHistory")
    public void deleteFromCCHistory() {
        String query = String.format(DbQueries.DELETE_CCHISTORY_HAVING_PIN, "83782422711");
        DbUtils.runQuery(query, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }

    /**
     * Sets the initial state to perform a disconnect call operation.
     */
    @Before(value = "@setStateToDisconnectCall")
    public void setStateToDisconnectCall() {
        String deleteInfoFromPartitionedBillTab = "DELETE FROM PARTITIONED_BILLTAB WHERE PIN=1297703533";
        DbUtils.runQuery(deleteInfoFromPartitionedBillTab, DataBases.DEBIT);
        String insertData = "BEGIN FOR i IN 1..3 LOOP INSERT INTO PARTITIONED_BILLTAB VALUES "
                + "(4431291795, 1297703533,6565,sysdate,2,15,8773006455, 7322711210,'011449731111111','00','B:12=3',"
                + "60,60,1500,1200,4,'0010',null,null,null, null,null,null,null,null,null,null,null,null,null,null,"
                + "null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,"
                + "null,null,null,null,null,null); DBMS_LOCK.SLEEP(2); END LOOP; COMMIT; END;";
        DbUtils.runQuery(insertData, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }

    /**
     * Deletes first row of CC_HISTORY table.
     */
    @After(value = "@deleteFirstRowCCHistory")
    public void deleteFirstRowFromCCHistory() {
        String query = String.format(DbQueries.DELETE_FISRT_ROW_CCHISTORY, "testl5");
        DbUtils.runQuery(query, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }

    /**
     * Deletes subscription plan.
     */
    @Before(value = "@deleteSubscriberPlan")
    public void deleteSubscriberPlan() {
        String deleteSubscriberQuery = "DELETE SUBSCRIBER_PLAN WHERE CTLNUM = "
                + "(SELECT CTLNUM FROM PARTITIONED_PINTAB WHERE PIN =8760021004)";
        String updatePinTabTableQuery = "UPDATE PINTAB SET STATE='A',EXPIRED_DATE=NULL, BALANCE=500 "
                + "WHERE CTLNUM=760051004";
        String deleteFromTransTable = "DELETE TRANS WHERE CTLNUM = "
                + "(SELECT CTLNUM FROM PARTITIONED_PINTAB WHERE PIN = 8760021004)";
        DbUtils.runQuery(deleteSubscriberQuery, DataBases.DEBIT);
        DbUtils.runQuery(updatePinTabTableQuery, DataBases.DEBIT);
        DbUtils.runQuery(deleteFromTransTable, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }

    /**
     * Sets the Credit Risk to Fraud.
     */
    @Before(value = "@setToFraud")
    public void setToFraud() {
        String updatetData = "UPDATE SUBSCRIBER_INFO SET CREDIT_RISK = 'F' WHERE  CTLNUM = '4431291795'";
        DbUtils.runQuery(updatetData, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }

    /**
     * Sets the Credit Risk to Verified.
     */
    @Before(value = "@setToVerified")
    public void setToVerified() {
        String updatetData = "UPDATE SUBSCRIBER_INFO SET CREDIT_RISK = 'V' WHERE  CTLNUM = '4431054584'";
        DbUtils.runQuery(updatetData, DataBases.DEBIT);
        DbUtils.closeCurrentDbClient();
    }
}
