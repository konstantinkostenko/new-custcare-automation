package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.Map;

public class ReactVoidTransactionPage extends ReactBasePage {

    private static final String VALIDATION_MESSAGE = "//div[@role='alert'][contains(text(),'%s')]";

    private static final String PARAMETER = "//div[./label[./text()='%s']]/following-sibling::div//div[@class='ant-form-item-control-input-content']";


    @FindBy(xpath = "//div[./div[contains(.,'Account Debit (General)')]]/following-sibling::div//textarea[@id='comment']")
    private WebElement txtComment;

    @FindBy(xpath = "//button//span[contains(text(),'Void')]")
    private WebElement btnVoidAccount;

    @FindBy(xpath = "//button[./span[contains(text(),'Void')]]/following-sibling::button")
    private WebElement btnCancel;

    public ReactVoidTransactionPage() {
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
        pageElementsMap.put("COMMENT", txtComment);
        pageElementsMap.put("VOID", btnVoidAccount);
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
                By.xpath(String.format(VALIDATION_MESSAGE, expectedParameter)));
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
     * Get text of element.
     *
     * @param expectedParameter as String.
     * @return product value as String.
     */
    public String getElementValueInPage(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(PARAMETER, expectedParameter)));
        return CommonActions.getTextElement(expectedValue);
    }

}
