package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.constants.SearchBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Manages elements and actions on React Unlimited Plan Query page.
 */
public class ReactUnlimitedPlanQueryPage extends ReactBasePage {

    private static final String COUNTRY = "//div[@title='%s']";
    private static final String MAT_ROWS_LOCATOR = "//tbody//tr[contains(@class,'ant-table-row ant-table-row-level-0')]";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";

    @FindBy(id = "pinAcc")
    private WebElement txtPIN;

    @FindBy(id = "countryName")
    private WebElement txtCountryName;

    @FindBy(xpath = "//h3[contains(text(),'Unlimited Plan Query')]")
    private WebElement lblPageTitle;

    @FindBy(xpath = "//span[contains(text(),'Search')]")
    private WebElement btnSearch;

    @FindBy(xpath = "//a[contains(text(),'Unlimited Plan Query')]")
    private WebElement tabUnlimitedPlanQuery;

    @FindBy(xpath = "//*[@id='countryName']")
    private WebElement lstCountryName;

    @FindBy(xpath = "//tbody[@class='ant-table-tbody']")
    private WebElement tblRates;

    @FindBy(xpath = "//div[@class='ant-empty-description'][contains(text(),'No Data')]")
    private WebElement txtNoData;

    /**
     * Clicks search button in Unlimited Plan Query page.
     */
    public void clickSearch() {
        CommonActions.clickElement(btnSearch);
    }

    /**
     * Clicks Unlimited Plan Query tab in left side bar menu.
     */
    public void clickUnlimitedPlanQueryTab() {
        CommonActions.clickElement(tabUnlimitedPlanQuery);
    }

    /**
     * Sets value in PIN/Account field in Unlimited Plan Query page.
     *
     * @param value as String.
     */
    public void setPin(final String value) {
        CommonActions.clearTextFieldForReact(txtPIN);
        CommonActions.setInputField(txtPIN, value);
    }

    /**
     * Chooses country name from the list in Unlimited Plan Query page.
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
     * Checks if Unlimited Plan Query page is displayed.
     *
     * @return true if Unlimited Plan Query page is displayed.
     */
    public boolean isUnlimitedPlanQueryPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
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
     * Checks if Plans table is displayed.
     *
     * @return true if Plans table is displayed.
     */
    public boolean isPlansTable() {
        return CommonActions.isElementDisplayed(tblRates);
    }

    /**
     * Checks if no data displayed in Plans table.
     *
     * @return true if no data displayed.
     */
    public boolean isNoData() {
        return CommonActions.isElementDisplayed(txtNoData);
    }

    /**
     * Finds plans in Unlimited Plan Query page.
     *
     * @return a list of Maps which represents plan info found on Unlimited Plan Query page.
     */
    public List<Map<String, String>> findPlanData() {
        CommonActions.waitFor(1);
        List<Map<String, String>> plans = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.XPATH, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> planMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            planMap.put("Plan ID", matCell.get(0).getText());
            planMap.put("Plan Name / Description", matCell.get(1).getText());
            planMap.put("Price", matCell.get(2).getText());
            planMap.put("Included Location", matCell.get(3).getText());
            planMap.put("Excluded Location", matCell.get(4).getText());
            plans.add(planMap);
        }
        return plans;
    }
}
