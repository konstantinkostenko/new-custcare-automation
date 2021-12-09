package idt.custcare.ui.hooks;

import idt.custcare.ui.portals.custcare.pages.ReactAccountHistoryPage;
import io.cucumber.java.Scenario;
import io.cucumber.java.After;

/**
 * Hooks for Unlimited Calling tests.
 */
public class ReactPopupHooks {
    private ReactAccountHistoryPage reactAccountHistoryPage;


    /**
     * Initializes an instance of {@link ReactPopupHooks}.
     */
    public ReactPopupHooks() {
        reactAccountHistoryPage = new ReactAccountHistoryPage();
    }

    /**
     * Checks and Closes all Dialogs or alerts if present
     */
    @After(value = "@closePopup", order = 3)
    public void closeVoucherRechargeDialog(Scenario scenario) {
        if (scenario.isFailed()) {
            if(reactAccountHistoryPage.isElementDisplayed("CLOSE")){
                reactAccountHistoryPage.clickOnButton("CLOSE");
            }
        }
    }
}