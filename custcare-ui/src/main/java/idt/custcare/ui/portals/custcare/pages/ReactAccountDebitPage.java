package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.Map;

public class ReactAccountDebitPage extends ReactBasePage {

    private static final String PARAMETER = "//div[@role='alert'][contains(text(),'%s')]";

    @FindBy(xpath = "//span[contains(text(),'Account Debit')]")
    private WebElement lnkAccountDebit;

    @FindBy(xpath = "//span[contains(text(),'Account Credit')]")
    private WebElement lnkAccountCredit;

    @FindBy(xpath = "//div[contains(text(),'Account Debit (General)')]")
    private WebElement lblPageTitle;

    @FindBy(xpath = "//div[./div[contains(.,'Account Debit (General)')]]/following-sibling::div//input[@id='debitAmount']")
    private WebElement txtDebitAmount;

    @FindBy(xpath = "//div[./div[contains(.,'Account Debit (General)')]]/following-sibling::div//textarea[@id='comment']")
    private WebElement txtComment;

    @FindBy(xpath = "//button//span[contains(text(),'Debit Account')]")
    private WebElement btnDebitAccount;

    @FindBy(xpath = "//button[./span[contains(text(),'Debit Account')]]/following-sibling::button")
    private WebElement btnCancel;

    public ReactAccountDebitPage() {
    }

    /**
     * Checks if Account Debit popup displayed.
     *
     * @return true if Account Debit popup displayed.
     */
    public boolean isAccountDebitPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Sets date field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setDateField(final String date, final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        CommonActions.clearTextFieldForReact(dateElement);
        CommonActions.setInputField(dateElement, date);
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
        pageElementsMap.put("ACCOUNT DEBIT", lnkAccountDebit);
        pageElementsMap.put("ACCOUNT CREDIT", lnkAccountCredit);
        pageElementsMap.put("DEBIT AMOUNT", txtDebitAmount);
        pageElementsMap.put("COMMENT", txtComment);
        pageElementsMap.put("DEBIT ACCOUNT", btnDebitAccount);
        pageElementsMap.put("CANCEL", btnCancel);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Checks if element with appropriate parameter displayed.
     *
     * @param expectedParameter as String.
     * @return true if element displayed.
     */
    public boolean isElementWithParameterDisplayedInPage(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(PARAMETER, expectedParameter)));
        return CommonActions.isElementDisplayed(expectedValue);
    }

    /**
     * Click web element.
     *
     * @param dateField as String.
     */
    public void clickWebElement(final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        CommonActions.clickElement(dateElement);
    }

    /**
     * Gets the value of Web Element.
     *
     * @param dateField Web Elements
     * @return returns String
     */
    public String getTextValue(final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        return CommonActions.getElementAttribute(dateElement, "value");
    }
}
