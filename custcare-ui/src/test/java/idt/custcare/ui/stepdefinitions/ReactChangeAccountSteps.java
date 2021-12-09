package idt.custcare.ui.stepdefinitions;

import idt.custcare.ui.portals.custcare.pages.ReactChangeAccountPage;
import io.cucumber.java.en.And;
import org.testng.Assert;

/**
 * Contains steps definition methods for Change Account page.
 */
public class ReactChangeAccountSteps {
    private ReactChangeAccountPage reactChangeAccountPage;

    /**
     * Initializes an instance of {@link ReactChangeAccountSteps}.
     */
    public ReactChangeAccountSteps() {
        reactChangeAccountPage = new ReactChangeAccountPage();
    }

    /**
     * Chooses option from Change Account menu.
     *
     * @param element as String.
     */
    @And("^I choose (.*) from Change Account menu$")
    public void iChooseOptionFromChangeAccountMenu(final String element) {
        reactChangeAccountPage.clickElement(element);
    }

    /**
     * Verifies that appropriate header displayed.
     *
     * @param message as String.
     */
    @And("^I should see (.*) header in pop-up$")
    public void iSeeHeaderInPopUp(final String message) {
        Assert.assertTrue(reactChangeAccountPage.isHeaderDisplayed(message), String.format("Header message does not equals to %s", message));
    }

    /**
     * Accepts action in pop-up.
     *
     * @param element as String.
     */
    @And("^I accept (.*) action in pop-up$")
    public void iAcceptAction(final String element) {
        reactChangeAccountPage.acceptAction(element);
    }

    /**
     * Cancels action in pop-up.
     *
     * @param element as String.
     */
    @And("^I cancel (.*) action in pop-up$")
    public void iCancelAction(final String element) {
        reactChangeAccountPage.cancelAction(element);
    }

    /**
     * Verifies that appropriate message displayed.
     *
     * @param message as String.
     */
    @And("^I should see (.*) message in pop-up$")
    public void iSeeSuccessMessageInPopUp(final String message) {
        Assert.assertTrue(reactChangeAccountPage.isSuccessMessageDisplayed(message), String.format("Success message does not equals to %s", message));
        reactChangeAccountPage.closeSuccessMessagePopUp();
    }

    /**
     * Verifies that appropriate element displayed.
     *
     * @param option as String.
     */
    @And("^I should not see (.*) option in Change Account menu$")
    public void iNotSeeOptionInChangeAccountMenu(final String option) {
        Assert.assertFalse(reactChangeAccountPage.isElementDisplayed(option), String.format("%s is displayed in Change Account menu", option));
    }

}
