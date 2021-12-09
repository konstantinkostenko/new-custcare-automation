package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.constants.SearchBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Manages elements and actions on React Get Rate page.
 */
public class ReactGetRatePage extends ReactBasePage {

    private static final String COUNTRY = "//div[@title='%s']";
    private static final String ACCESS_TYPE_AMOUNT = "//div[@class='ant-select-item-option-content'][contains(text(),'%s')]";
    private static final String MAT_ROWS_LOCATOR = "//tbody//tr[contains(@class,'ant-table-row ant-table-row-level-0')]";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";

    @FindBy(xpath = "//a[@href=\"/getRate\"]")
    private WebElement btnGetRateTab;

    @FindBy(xpath = "//h3[contains(text(),'Get Rate')]")
    private WebElement lblPageTitle;

    @FindBy(id = "pinAcc")
    private WebElement txtPIN;

    @FindBy(xpath = "//*[@id='countryName']")
    private WebElement lstCountryName;

    @FindBy(xpath = "//span[./input[@id='accessType']]")
    private WebElement lstAccessType;

    @FindBy(xpath = "//span[./input[@id='amount']]")
    private WebElement lstAmount;

    @FindBy(xpath = "//span[contains(text(),'Search')]")
    private WebElement btnSearch;

    @FindBy(xpath = "//tbody[@class='ant-table-tbody']")
    private WebElement tblRates;

    /**
     * Clicks Get Rate tab in left side bar menu.
     */
    public void clickGetRateTab() {
        CommonActions.clickElement(btnGetRateTab);
    }

    /**
     * Finds the rate data from the table.
     *
     * @return a Map of Strings which represents rate info found on page.
     */
    public Map<String, String> findRateData() {
        CommonActions.waitFor(2);
        Map<String, String> rateMap = new HashMap<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.XPATH, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            rateMap.put(matCell.get(0).getText(), matCell.get(1).getText());
        }
        return rateMap;
    }

    /**
     * Sets value in PIN/Account field in Rate Query page.
     *
     * @param value as String.
     */
    public void setPin(final String value) {
CommonActions.waitFor(1);
        CommonActions.clearAndSetInputField(txtPIN, value);
    }

    /**
     * Chooses access type from the list in Rate Query page.
     *
     * @param value as String.
     */
    public void chooseAccessType(final String value) {
        CommonActions.clickElement(lstAccessType);
        WebElement accessType = getDriver().findElement(
                By.xpath(String.format(ACCESS_TYPE_AMOUNT, value)));
        CommonActions.clickElement(accessType);
    }

    /**
     * Chooses country name from the list in Rate Query page.
     *
     * @param value as String.
     */
    public void chooseCountry(final String value) {
        CommonActions.clickElement(lstCountryName);
        CommonActions.setInputField(lstCountryName, value);
        WebElement product = getDriver().findElement(
                By.xpath(String.format(COUNTRY, value)));
        CommonActions.clickElement(product);
    }

    /**
     * Chooses amount from the list in Rate Query page.
     *
     * @param value as String.
     */
    public void chooseAmount(final String value) {
        CommonActions.clickElement(lstAmount);
        WebElement amount = getDriver().findElement(
                By.xpath(String.format(ACCESS_TYPE_AMOUNT, value)));
        CommonActions.clickElement(amount);
    }

    /**
     * Clicks search button in Rate Query page.
     */
    public void clickSearch() {
        CommonActions.clickElement(btnSearch);
    }

    /**
     * Checks if Get Rate page is displayed.
     *
     * @return true if Get Rate page is displayed.
     */
    public boolean isRateQueryPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Checks if Rates table is displayed.
     *
     * @return true if Rates table is displayed.
     */
    public boolean isRatesTable() {
        return CommonActions.isElementDisplayed(tblRates);
    }
}
