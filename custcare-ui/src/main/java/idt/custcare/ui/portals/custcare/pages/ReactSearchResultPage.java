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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Manages elements and actions on React Search Result page.
 */
public class ReactSearchResultPage extends ReactBasePage {

    private static final String PARAMETER = "//div//span[@class='itemTitle'][contains(text(),'%s')]/following-sibling::span";
    private static final String INFO = "//div//span[@class='toolTipTitle'][contains(text(),'%s')]/following-sibling::span";
    private static final String MAT_ROWS_LOCATOR = "//tbody//tr[contains(@class,'ant-table-row ant-table-row-level-0')]";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";
    private static final String USED_PROMO_CODES_PAGINATION = "//li[@title='%s']";
    private static final String CUSTOMER_VALUE_INDICATOR = "//span[@class='ant-tag ant-tag-has-color customerStatus']//span[contains(text(),'%s')]";
    private static final String CUSTOMER_VALUE_INDICATOR_NEW = "//span[@class='ant-tag ant-tag-has-color customerStatus'][contains(text(),'%s')]";

    @FindBy(linkText = "Show all calls")
    private WebElement linkShowAllCalls;

    @FindBy(xpath = "//h3[contains(text(),'Search Result')]")
    private WebElement lblPageTitle;

    @FindBy(xpath = "//div[contains(text(),'Comments')]")
    private WebElement btnComments;

    @FindBy(xpath = "//div[contains(text(),'Used Promo Codes')]")
    private WebElement btnUsedPromoCodes;

    @FindBy(css = ".ant-input")
    private WebElement txtField;

    @FindBy(css = "div.styles_comment__2NpPC > button")
    private WebElement btnAddComment;

    @FindBy(css = "div > div.ant-notification-notice-message")
    private WebElement txtNotificationMessage;

    @FindBy(css = "div:nth-child(2) > div > div > div.ant-notification-notice-message")
    private WebElement txtSecondNotificationMessage;

    @FindBy(css = "tbody > tr:nth-child(1) > td:nth-child(1)")
    private WebElement txtOfNewAddedComment;

    @FindBy(xpath = "//div[contains(text(),'Used Promo Codes')]/following-sibling::div[1]//div[contains(text(),'No Data')]")
    private WebElement txtNoDataUsedPromoCodes;

    @FindBy(css = "div.cardInfoHeader > a")
    private WebElement btnPaymentInfo;

    @FindBy(xpath = "//span[@class='ant-tag ant-tag-has-color customerStatus']")
    private WebElement lblCustomerValueIndicator;

    @FindBy(css = "div#root div:nth-child(1) > span.itemInfo > span")
    private WebElement txtOptIn;

    @FindBy(xpath = "//div//span[@class='itemTitle'][contains(text(),'Balance')]/following-sibling::span")
    private WebElement txtBalance;

    @FindBy(css = "div#root span.itemInfo > i")
    private WebElement balanceIcon;

    @FindBy(css = "div#root span.ml-3")
    private WebElement accountStatus;

    @FindBy(css = "div#root span.material-icons.fs-21.info")
    private WebElement planInfoIcon;

    @FindBy(xpath = "//div[@role = 'menuitem']//span[contains(text(),'Recharge')]")
    private WebElement lnkBtnRecharge;

    @FindBy(xpath = "//span[contains(text(),'Maintenance')]")
    private WebElement lnkMaintenance;

    @FindBy(xpath = "//span[@class='ant-notification-close-x']")
    private WebElement btnCloseAlert;

    /**
     * Checks if Search Result page is displayed.
     *
     * @return true if Search Result page is displayed.
     */
    public boolean isSearchResultPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Checks if No Data displays in Used Promo Codes block.
     *
     * @return true if No Data is displayed.
     */
    public boolean isNoUsedPromoCodes() {
        return CommonActions.isElementDisplayed(txtNoDataUsedPromoCodes);
    }

    /**
     * Clicks page number in Used Promo Codes pagination block.
     *
     * @param expectedParameter as String.
     */
    public void openPageInUsedPromoCodesPaginationBlock(String expectedParameter) {
        WebElement page = getDriver().findElement(
                By.xpath(String.format(USED_PROMO_CODES_PAGINATION, expectedParameter)));
        CommonActions.clickElement(page);
    }

    /**
     * Checks if any label displays in Customer block.
     */
    public boolean isCustomerValueIndicatorLabel() {
        return CommonActions.isElementDisplayed(lblCustomerValueIndicator);
    }

    /**
     * Checks if any label displays in Customer block.
     *
     * @param expectedParameter as String.
     */
    public boolean isCustomerValueIndicator(String expectedParameter) {
        WebElement element;
        if(expectedParameter.contains("New to")) {
            WebElement valueIndicatorNew = getDriver().findElement(
                    By.xpath(String.format(CUSTOMER_VALUE_INDICATOR_NEW, expectedParameter)));
            element = valueIndicatorNew;
        }else{
            WebElement valueIndicator = getDriver().findElement(
                    By.xpath(String.format(CUSTOMER_VALUE_INDICATOR, expectedParameter)));
            element = valueIndicator;
        }
        return CommonActions.isElementDisplayed(element);
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

    /**
     * Get text of element in Info panel.
     *
     * @param expectedParameter as String.
     * @return product value as String.
     */
    public String getTextOfElementValueInInfoPanel(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(INFO, expectedParameter)));
        return CommonActions.getTextElement(expectedValue);
    }

    /**
     * Get text of element.
     *
     * @param expectedParameter as String.
     * @return product value as String.
     */
    public String getTextOfElementValueInPage(String expectedParameter) {
        CommonActions.waitFor(1);
        WebElement expectedValue = getPageElement(expectedParameter);
        return CommonActions.getTextElement(expectedValue);
    }

    /**
     * Get text of added comment.
     */
    public String getCommentText() {
        CommonActions.waitFor(2);
        return CommonActions.getTextElement(txtOfNewAddedComment);
    }

    /**
     * Get text of Balance.
     */
    public String getBalanceValue() {
        return CommonActions.getTextElement(txtBalance).replaceAll("help_outline", "");
    }

    /**
     * Finds recent calls in Search Result page.
     *
     * @return a list of Maps which represents recent calls info found on page.
     */
    public List<Map<String, String>> findRecentCalls() {
        CommonActions.waitFor(1);
        List<Map<String, String>> recentCalls = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.XPATH, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> callsMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            callsMap.put("Date/Time", matCell.get(0).getText());
            callsMap.put("Duration", matCell.get(1).getText());
            callsMap.put("Cost", matCell.get(2).getText());
            callsMap.put("Balance", matCell.get(3).getText());
            callsMap.put("DNIS", matCell.get(4).getText());
            callsMap.put("Destination", matCell.get(5).getText());
            callsMap.put("ANI", matCell.get(6).getText());
            recentCalls.add(callsMap);
        }
        return recentCalls;
    }

    /**
     * Finds used promo codes in Search Result page.
     *
     * @return a list of Maps which represents used promo codes info found on page.
     */
    public List<Map<String, String>> findUsedPromoCodes() {
        CommonActions.waitFor(1);
        List<Map<String, String>> usedPromoCodes = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.XPATH, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> codesMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            codesMap.put("Promo Code", matCell.get(0).getText());
            codesMap.put("Redemption Date", matCell.get(1).getText());
            codesMap.put("Promo State", matCell.get(2).getText());
            codesMap.put("Event", matCell.get(3).getText());
            codesMap.put("Product Purchased", matCell.get(4).getText());
            codesMap.put("Reward", matCell.get(5).getText());
            codesMap.put("Promo Name", matCell.get(6).getText());
            usedPromoCodes.add(codesMap);
        }
        return usedPromoCodes;
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
        pageElementsMap.put("COMMENTS BLOCK", btnComments);
        pageElementsMap.put("ADD COMMENT", btnAddComment);
        pageElementsMap.put("COMMENT TEXT", txtField);
        pageElementsMap.put("SEARCH RESULT", lblPageTitle);
        pageElementsMap.put("NOTIFICATION MESSAGE", txtNotificationMessage);
        pageElementsMap.put("SECOND NOTIFICATION MESSAGE", txtSecondNotificationMessage);
        pageElementsMap.put("NEW ADDED COMMENT", txtOfNewAddedComment);
        pageElementsMap.put("USED PROMO CODES", btnUsedPromoCodes);
        pageElementsMap.put("PAYMENT INFO", btnPaymentInfo);
        pageElementsMap.put("OPT-IN", txtOptIn);
        pageElementsMap.put("BALANCE (?)", balanceIcon);
        pageElementsMap.put("ACCOUNT STATUS", accountStatus);
        pageElementsMap.put("PLAN (I)", planInfoIcon);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Sets date field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setDateField(final String date, final String dateField) {
        CommonActions.waitFor(2);
        WebElement dateElement = getPageElement(dateField);
        CommonActions.setInputField(dateElement, date);
    }


    /**
     * Gets Current Balance value.
     *
     * @return Current Balance value.
     */
    public Double getCurrentBalance() {
        String currentBalance = CommonActions.getTextElement(txtBalance);
        String pattern = "[0-9]+.[0-9]+";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(currentBalance);
        if (m.find()) {
            currentBalance = m.group(0);
        } else {
            currentBalance = "0";
        }
        return Double.parseDouble(currentBalance);
    }

    /**
     * Click on link button Recharge
     */
    public void clickOnRechargeLinkButton() {
        CommonActions.clickElement(lnkBtnRecharge);
    }

    public void openMaintenanceMenu() {
        CommonActions.clickElement(lnkMaintenance);
    }

    /**
     * Click on link Show All Calls
     */
    public void clickShowAllCallsLinkButton() {
        CommonActions.clickElement(linkShowAllCalls);
    }

    /**
     * Checks if Status displayed.
     *
     * @return true if Status displayed.
     */
    public boolean isLinkShowAllCallsIsDisplayed (){
        return CommonActions.isElementDisplayed(linkShowAllCalls);
    }
}
