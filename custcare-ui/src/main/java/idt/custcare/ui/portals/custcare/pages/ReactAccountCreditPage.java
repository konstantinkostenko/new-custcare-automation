package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.Map;

public class ReactAccountCreditPage extends ReactBasePage {

    private static final String PARAMETER = "//div[./label[@title='%s']]/following-sibling::div//div[contains(text(),'%s')]";
    private static final String REASON = "//div[@title='%s']";

    @FindBy(xpath = "//div[contains(text(),'Account Credit (General)')]")
    private WebElement lblPageTitle;

    @FindBy(id = "creditAmount")
    private WebElement txtCreditAmount;

    @FindBy(id = "comment")
    private WebElement txtComment;

    @FindBy(xpath = "//span[./input[@id='reason']]")
    private WebElement lstReason;

    @FindBy(xpath = "//button//span[contains(text(),'Credit Account')]")
    private WebElement btnCreditAccount;

    @FindBy(xpath = "//button[./span[contains(text(),'Credit Account')]]/following-sibling::button")
    private WebElement btnCancel;

    public ReactAccountCreditPage() {
    }

    /**
     * Checks if Account Credit popup displayed.
     *
     * @return true if Account Credit popup displayed.
     */
    public boolean isAccountCreditPage() {
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
        pageElementsMap.put("CREDIT AMOUNT", txtCreditAmount);
        pageElementsMap.put("REASON", lstReason);
        pageElementsMap.put("COMMENT", txtComment);
        pageElementsMap.put("CREDIT ACCOUNT", btnCreditAccount);
        pageElementsMap.put("CANCEL", btnCancel);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Chooses access type from the list in Rate Query page.
     *
     * @param value as String.
     */
    public void chooseReason(final String value) {
        CommonActions.clickElement(lstReason);
        WebElement reason = getDriver().findElement(
                By.xpath(String.format(REASON, value)));
        CommonActions.clickElement(reason);
    }

    /**
     * Chooses access type from the list in Rate Query page.
     *
     * @param value as String.
     */
    public void isReason(final String value) {
        CommonActions.clickElement(lstReason);
        WebElement reason = getDriver().findElement(
                By.xpath(String.format(REASON, value)));
        CommonActions.isElementDisplayed(reason);
    }

    /**
     * Checks if element with appropriate parameter displayed.
     *
     * @param expectedField as String.
     * @param expectedMessage as String.
     * @return true if element displayed.
     */
    public boolean isElementWithParameterDisplayedInPage(String expectedField,String expectedMessage ) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(PARAMETER, expectedField,expectedMessage)));
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
