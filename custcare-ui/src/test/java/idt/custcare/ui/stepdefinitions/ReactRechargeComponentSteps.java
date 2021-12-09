package idt.custcare.ui.stepdefinitions;

import idt.custcare.ui.portals.custcare.pages.Components.ReactRechargeComponent;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.testng.Assert;

public class ReactRechargeComponentSteps {
    private ReactRechargeComponent reactRechargeComponent;

    public ReactRechargeComponentSteps() {
        reactRechargeComponent = new ReactRechargeComponent();
    }

   /**
     * Find and click on Voucher link.
     */
    @When("^I click on Voucher$")
    public void iClickRechargeLinkInSearchResultPage() {
        reactRechargeComponent.clickOnVoucherLinkButton();
    }

    /**
     * Find and click on Bank Card link.
     */
    @When("^I click on Bank Card$")
    public void iClickOnBankCard() {
        reactRechargeComponent.clickOnBankCardLinkButton();
    }

    /**
     * Click element on Voucher Recharge Page.
     *
     * @param button as String.
     */
    @And("^I click (.*) button on Voucher Recharge pop-up$")
    public void clickButton(final String button) {
        reactRechargeComponent.clickWebElement(button);
    }

    /**
     * Verified if Voucher option is available.
     */
    @When("^I should not see Voucher option in Recharge menu$")
    public void isVoucherAvailable() {
        Assert.assertFalse(reactRechargeComponent.isVoucherAvailable());
    }

    /**
     * put number in From value from voucher recharge pop up.
     */
    @When("^I set (.*) pin number in From Account field of voucher Recharge pop up$")
    public void setValueForFromAccountField(final String pin) {
        reactRechargeComponent.setTxtFromAccount(pin);
    }

    /**
     * Checks that a expected error message exists.
     *
     * @param expectedMessage as String.
     */
    @Then("^I will see (.*) message in voucher window$")
    public void noBalance(final String expectedMessage) {
        Assert.assertEquals(reactRechargeComponent.getErrorText(), expectedMessage, "Error message does not match.");
    }
}
