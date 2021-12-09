package idt.custcare.ui.portals.custcare.pages.Components;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.Map;

public class ReactRechargeComponent extends ReactBasePage {

    @FindBy(xpath = "//button//span[contains(text(),'Voucher')]")
    private WebElement lnkBtnVoucher;

    @FindBy(xpath = "//span//a[contains(text(),'Bank Card')]")
    private WebElement lnkBtnBankCard;

    @FindBy(id = "rcDialogTitle0")
    private WebElement lblPageTitle;

    @FindBy(id = "account")
    private WebElement txtFromAccount;

    @FindBy(xpath = "//button/span[contains(text(),'Transfer')]")
    private WebElement btnTransfer;

    @FindBy(xpath = "//button/span[contains(text(),'Yes')]")
    private WebElement clickOnYesButtonFromTransaction;

    @FindBy(xpath = "//span[2][.=' has been completed successfully.']")
    private WebElement txtTransferCompleted;

    @FindBy(xpath = "//p[contains(text(),'not')]")
    private WebElement txtError;

    @FindBy(xpath = "//button[./span[contains(text(),'Transfer')]]/following-sibling::button")
    private WebElement btnCancel;

    @FindBy(xpath = "//div[contains(text(),'Error')]")
    private WebElement lblError;



    /**
     * Click voucher button text from menu
     */
    public void clickOnVoucherLinkButton() {
        CommonActions.waitFor(1);
        CommonActions.clickElement(lnkBtnVoucher);
    }
    /**
     * Click bank card button text from menu
     */
    public void clickOnBankCardLinkButton() {
        CommonActions.clickElement(lnkBtnBankCard);
    }
    /**
     * Checks if Voucher Recharge popup displayed.
     *
     * @return true if Voucher Recharge popup displayed.
     */
    public boolean isVoucherRechargePage(){
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Set pin on input field
     */
    public void setTxtFromAccount(String pin) {
        CommonActions.clearAndSetInputField(txtFromAccount, pin);
    }

    /**
     * Gets text The message of transaction complete
     *
     * @return text of displayed message.
     */
    public boolean isTransactionCompleted() {
        return CommonActions.isElementDisplayed(txtTransferCompleted);
    }

    /**
     * Gets text of displayed error message.
     *
     * @return text of displayed error message.
     */
    public String getErrorText() {
        return CommonActions.getTextElement(txtError);
    }

    /**
     * Checks if Voucher option is displayed in Recharge menu.
     *
     * @return true if Voucher option is displayed.
     */
    public boolean isVoucherAvailable(){
        return CommonActions.isElementDisplayed(lnkBtnVoucher);
    }

    /**
     * Gets a web element locator on page.
     *
     * @param elementName as String, represents element whose locator will be returned.
     * @return a specific web element locator.
     */
    @Override
    protected WebElement getPageElement(String elementName) {
        Map<String, WebElement> pageElementsMap = new HashMap<>();
        pageElementsMap.put("VOUCHE", lnkBtnVoucher);
        pageElementsMap.put("TRANSFER", btnTransfer);
        pageElementsMap.put("CANCEL", btnCancel);
        pageElementsMap.put("YES", clickOnYesButtonFromTransaction);
        pageElementsMap.put("ACTIVATION CODE", txtFromAccount);
        pageElementsMap.put("VOUCHER RECHARGE HEADER", lblPageTitle);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Click web element.
     *
     * @param dateField as String.
     */
    public void clickWebElement (final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        CommonActions.clickElement(dateElement);
    }
}
