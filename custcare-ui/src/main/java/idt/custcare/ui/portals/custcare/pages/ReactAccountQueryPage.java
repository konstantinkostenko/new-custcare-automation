package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.constants.SearchBy;
import io.cucumber.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Manages elements and actions on React Account Query page.
 */
public class ReactAccountQueryPage extends ReactBasePage {

    private static final String PRODUCT = "//div[@title='%s']";
    private static final String CLICK_PROGRAM = "//tr//td[contains(.,'%s')]";
    private static final String MAT_ROWS_LOCATOR = "tbody>tr[class*='ant-table-row ant-table-row-level-0']";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";

    @FindBy(id = "pin")
    private WebElement txtPIN;

    @FindBy(id = "ctl")
    private WebElement txtCtnum;

    @FindBy(xpath = "//h3[contains(text(),'Query Search')]")
    private WebElement lblPageTitle;

    @FindBy(xpath = "//span[contains(text(),'Search')]")
    private WebElement btnSearch;

    @FindBy(xpath = "//a[text()='Query']")
    private WebElement tabQuery;

    @FindBy(xpath = "//div[contains(text(), 'no record found')]")
    private WebElement txtAccountNotFound;

    @FindBy(xpath = "//span[@class='ant-notification-close-x']")
    private WebElement btnCloseAlert;

    @FindBy(xpath = "//div[contains(text(), 'Account Information')]")
    private WebElement txtAccountInformation;

    @FindBy(xpath = "//p[contains(text(), 'Multiple accounts have been found. Please, select the one you need by clicking the appropriate line.')]")
    private WebElement txtAccountHasSeveralProductsMessage;

    @FindBy(xpath = "//span[@class='ant-select-selection-search']")
    private WebElement btnSelectProduct;

    @FindBy(xpath = "//button//span[contains(text(), 'OK')]")
    private WebElement btnOk;

    @FindBy(xpath = "//button//span[contains(text(), 'Cancel')]")
    private WebElement btnCancel;

    @FindBy(xpath = "//span[@aria-label='close']")
    private WebElement btnClose;

    @FindBy(xpath = "//li[@title='Next Page']")
    private WebElement btnNextPage;

    @FindBy(xpath = "//li[@title='Previous Page']")
    private WebElement btnPreviousPage;

    /**
     * Clicks search button in Account Query page.
     */
    public void clickSearch() {
        CommonActions.clickElement(btnSearch);
    }

    /**
     * Clicks Query tab in left side bar menu.
     */
    public void clickQueryTab() {
        CommonActions.clickElement(tabQuery);
    }

    /**
     * Sets value in PIN/Account field in Account Query page.
     *
     * @param value as String.
     */
    public void setPin(final String value) {
        CommonActions.clearTextFieldForReact(txtPIN);
        CommonActions.setInputField(txtPIN, value);
    }

    /**
     * Sets value in Control Number field in Account Query page.
     *
     * @param value as String.
     */
    public void setCtnum(final String value) {
        CommonActions.clearTextFieldForReact(txtCtnum);
        CommonActions.setInputField(txtCtnum, value);
    }

    /**
     * Checks if Account Query page is displayed.
     *
     * @return true if Account Query page is displayed.
     */
    public boolean isAccountQueryPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Checks if Account not found message displayed.
     *
     * @return true if Account not found.
     */
    public boolean isAccountNotFound() {
        return CommonActions.isElementDisplayed(txtAccountNotFound);
    }

    /**
     * Checks if Account has several products message displayed.
     *
     * @return true if displayed.
     */
    public String getAccountInformationMessage() {
        return CommonActions.getTextElement(txtAccountHasSeveralProductsMessage);
    }

    /**
     * Checks if Account Information popup displayed.
     *
     * @return true if Account Information displayed.
     */
    public boolean isAccountInformation() {
        return CommonActions.isElementDisplayed(txtAccountInformation);
    }

    /**
     * Select option from dropdown in Account Information popup.
     *
     * @param value as String.
     */
    public void selectOptionFormDropdown(final String value) {
        CommonActions.clickElement(btnSelectProduct);
        WebElement product = getDriver().findElement(
                By.xpath(String.format(PRODUCT, value)));
        CommonActions.clickElement(product);
    }

    /**
     * Gets a web element locator on page.
     *
     * @param elementName as String, represents element whose locator will be returned.
     * @return a specific web element locator.
     */
    @Override
    protected WebElement getPageElement(final String elementName) {
        Map<String, WebElement> pageElementMap = new HashMap<>();
        pageElementMap.put("OK", btnOk);
        pageElementMap.put("CANCEL", btnCancel);
        pageElementMap.put("CLOSE", btnClose);
        pageElementMap.put("NEXT PAGE", btnNextPage);
        pageElementMap.put("PREVIOUS PAGE", btnPreviousPage);
        return pageElementMap.get(elementName.toUpperCase());
    }

    /**
     * Clicks a button on page.
     *
     * @param buttonName as String, represents button which will be clicked on page.
     */
    public void clickOnButton(final String buttonName) {
        WebElement btnLocator = getPageElement(buttonName);
        CommonActions.clickElement(btnLocator);
    }

    /**
     * Clicks close button in alert message.
     */
    public void closeAlertMessage() {
        CommonActions.clickElement(btnCloseAlert);
    }

    /**
     * Finds Events in Account History page.
     *
     * @return a list of Maps which represents events info found on page.
     */
    public List<Map<String, String>> findSeveralAccounts() {
        CommonActions.waitFor(1);
        List<Map<String, String>> multAccounts = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.CSS, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> accountMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            accountMap.put("Name", matCell.get(0).getText());
            accountMap.put("Program", matCell.get(1).getText());
            accountMap.put("Status", matCell.get(2).getText());
            accountMap.put("Activation Date", matCell.get(3).getText());
            accountMap.put("Last Use Date", matCell.get(4).getText());
            multAccounts.add(accountMap);
        }
        return multAccounts;
    }

    /**
     * Finds Multiple Account in popup.
     *
     * @return a list of Maps which represents Multiple Accounts info found on page.
     */
    public void clickFirstRecord(final String fieldName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(CLICK_PROGRAM, fieldName)));
        CommonActions.clickElement(expectedValue);
    }

    public void closeAccountInformationPopup() {
        CommonActions.clickElement(btnClose);
    }
}
