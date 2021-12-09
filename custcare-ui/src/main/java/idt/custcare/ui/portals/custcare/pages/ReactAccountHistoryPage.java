package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.constants.SearchBy;
import org.openqa.selenium.*;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.support.FindBy;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ReactAccountHistoryPage extends ReactBasePage {

    private static final String EXPAND_TRANSACTION = "//tr[./td[contains(text(),'%s')]]//button";
    private static final String MAT_ROWS_LOCATOR = "tbody>tr[class*='ant-table-row ant-table-row-level-0']";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";
    private static final String CHECKBOX_ACCOUNT_HISTORY_XPATH = "//label[contains(.,'%s')]//input[@type='checkbox']";
    private static final String PARAMETER = "//div//span[@class='itemTitle'][./text()='%s']/following-sibling::span";
    private static final String THREE_DOTS = "//tr[./td[contains(text(),'%s')]]//span[@class='anticon styles_icon___7mJr ant-dropdown-trigger']";
    private static final String THREE_DOTS_ITEM = "//span[@class='ant-dropdown-menu-title-content'][contains(text(),'%s')]";
    private static final String IS_POPUP_DISPLAYED = "//div[@class='ant-modal-title'][./text()='%s']";
    private static final String COMMENT_FIELD = "//div[./div[contains(.,'%s')]]/following-sibling::div//textarea[@id='comment']";
    private static final String REFUND = "//div[./div[contains(.,'%s')]]/following-sibling::div//input[@id='refundAmount']";
    private static final String COMMENT_TEXT = "//tr[./td//span[./text()='%s']]//div[./text()='%s']";
    private static final String BUTTON_IN_POPUP = "//div[./div[./text()='%s']]/following-sibling::div//button//span[./text()='%s']";
    private static final String DATE_TIME = "//tr[./td[contains(text(),'%s')]]//td[3]";
    private static final String DESTINATION_LOCATION = "//span[contains(text(),'%s')]";
    private static final String EVENT_DETAILS = "//td[./span//span[contains(.,'%s')]]/following-sibling::td//div";



    @FindBy(xpath = "//a[contains(text(),'History')]")
    private WebElement lnkBtnHistory;

    @FindBy(xpath = "//div//span[@class='itemTitle'][./text()='Status']")
    private WebElement isStatusEvent;

    @FindBy(css = "button[type='submit']")
    private WebElement btnSearch;

    @FindBy(css = "button[name='checkAll']")
    private WebElement btnCheckAll;

    @FindBy(css = "button[name='uncheckAll']")
    private WebElement btnUncheckAll;

    @FindBy(css = "//input[@placeholder='Start date']")
    private WebElement txtStartDate;

    @FindBy(css = "input[placeholder='End date']")
    private WebElement txtEndDate;

    @FindBy(css = "div.ant-collapse-header")
    private WebElement btnExpandDashboard;

    @FindBy(xpath = "//button[contains(text(),'Show more')]")
    private WebElement showMoreDetailLink;

    @FindBy(xpath = "//button[contains(text(),'Show less')]")
    private WebElement showLessDetailLink;

    @FindBy(xpath = "//div//span[@class='itemTitle'][contains(text(),'Balance')]/following-sibling::span")
    private WebElement txtBalance;

    @FindBy(xpath = "//button[@data-testid='debit-call-button']")
    private WebElement btnDebit;

    @FindBy(xpath = "//button[./span[contains(text(),'Debit')]]/following-sibling::button")
    private WebElement btnCancel;

    @FindBy(xpath = "//div[@class='ant-modal-wrap ant-modal-centered'][@style='display: none;']")
    private WebElement popupHidden;

    @FindBy(xpath = "//span[@class='anticon anticon-left']")
    private WebElement btnSearchResult;

    @FindBy(css = "span.ant-modal-close-x")
    private WebElement btnClose;

    /**
     * Get text of date/dime for transaction
     *
     * @param fieldName as String, represents element whose locator will be returned.
     * @return text of date/dime for transaction.
     */
    public String getDateTimeOfTransaction(String fieldName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(DATE_TIME, fieldName)));
        return CommonActions.getTextElement(expectedValue);
    }

    /**
     * Checks if popup displayed.
     *
     * @param condition as String, represents condition for popup.
     * @param fieldName as String, represents element whose locator will be returned.
     * @return true if Account Debit popup displayed.
     */
    public boolean isPopupDisplayed(String condition, String fieldName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(IS_POPUP_DISPLAYED, fieldName)));
        return CommonActions.isElementDisplayed(expectedValue);
    }

    /**
     * Checks if text displayed.
     *
     * @param transaction as String, represents element whose locator will be returned.
     * @param details     as String, represents element whose locator will be returned.
     * @return true if text displayed.
     */
    public boolean isTransactionDisplayed(String transaction, String details) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(COMMENT_TEXT, transaction, details)));
        return CommonActions.isElementDisplayed(expectedValue);
    }

    /**
     * Checks if text displayed.
     *
     * @param event as String, represents element whose locator will be returned.
     * @return true if text displayed.
     */
    public String getTransactionDetails(String event) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(EVENT_DETAILS, event)));
        return CommonActions.getTextElement(expectedValue);
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
        pageElementsMap.put("START DATE", txtStartDate);
        pageElementsMap.put("END DATE", txtEndDate);
        pageElementsMap.put("SEARCH", btnSearch);
        pageElementsMap.put("UNCHECK ALL", btnUncheckAll);
        pageElementsMap.put("CHECK ALL", btnCheckAll);
        pageElementsMap.put("EXPAND DASHBOARD", btnExpandDashboard);
        pageElementsMap.put("SHOW MORE", showMoreDetailLink);
        pageElementsMap.put("SHOW LESS", showLessDetailLink);
        pageElementsMap.put("DEBIT", btnDebit);
        pageElementsMap.put("CANCEL", btnCancel);
        pageElementsMap.put("SEARCH RESULT", btnSearchResult);
        pageElementsMap.put("CLOSE", btnClose);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Click on link button History.
     */
    public void clickOnHistoryLinkButton() {
        CommonActions.clickElement(lnkBtnHistory);
    }

    /**
     * Finds Events in Account History page.
     *
     * @return a list of Maps which represents events info found on page.
     */
    public List<Map<String, String>> findEvents() {
        CommonActions.waitFor(1);
        List<Map<String, String>> events = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.CSS, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> eventMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            eventMap.put("Date/Time", matCell.get(2).getText());
            eventMap.put("Event", matCell.get(3).getText());
            eventMap.put("Amount", matCell.get(4).getText());
            eventMap.put("Balance", matCell.get(5).getText());
            eventMap.put("Details", matCell.get(6).getText());
            events.add(eventMap);
        }
        return events;
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
     * Set checkboxes on Account History Page.
     *
     * @param checkboxAccountHistory as String, represents option that are on Account History page.
     * @param checkBoxState          as String, represents the status of the checkboxes.
     */
    public void setCheckboxAccountHistory(final String checkboxAccountHistory, final String checkBoxState) {
        WebElement checkBox = getDriver().findElement(By.xpath(String.format(CHECKBOX_ACCOUNT_HISTORY_XPATH, checkboxAccountHistory)));
        CommonActions.setCheckboxStateWithoutWait(checkBox, checkBoxState.equals("checked"));
    }

    /**
     * Expands transaction on Account History Page.
     *
     * @param fieldName as String.
     */
    public void expandTransaction(String fieldName) {
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(EXPAND_TRANSACTION, fieldName)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Click 3 dots for transaction.
     *
     * @param fieldName as String.
     */
    public void clickThreeDots(String fieldName) {
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(THREE_DOTS, fieldName)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Click 3 dots for transaction.
     *
     * @param fieldName as String.
     */
    public boolean isThreeDotsDisplayed(String fieldName) {
        CommonActions.waitFor(2);
        try {
            WebElement expectedValue = getDriver().findElement(
                    By.xpath(String.format(THREE_DOTS, fieldName)));
            return CommonActions.isElementDisplayed(expectedValue);
        } catch (NoSuchElementException | StaleElementReferenceException | TimeoutException e) {
            return false;
        }
    }

    /**
     * Choose option from 3 dots menu.
     *
     * @param fieldName as String.
     */
    public void clickOnOptionFromThreeDotsMenu(String fieldName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(THREE_DOTS_ITEM, fieldName)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Choose option from 3 dots menu.
     *
     * @param popupName  as String.
     * @param buttonName as String.
     */
    public void clickButtonInPopup(String buttonName, String popupName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(BUTTON_IN_POPUP, popupName, buttonName)));
        CommonActions.clickElement(expectedValue);
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
        if (expectedParameter.equals("Status")) {
            return CommonActions.getTextElement(expectedValue).replaceAll(" info_outline", "");
        } else {
            return CommonActions.getTextElement(expectedValue).replaceAll("help_outline", "");
        }
    }


    /**
     * Sets refund field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setRefundField(final String date, final String dateField) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(REFUND, dateField)));
        CommonActions.clearTextFieldForReact(expectedValue);
        CommonActions.setInputField(expectedValue, date);
    }

    /**
     * Sets comment field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setCommentField(final String date, final String dateField) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(COMMENT_FIELD, dateField)));
        CommonActions.clearTextFieldForReact(expectedValue);
        CommonActions.setInputField(expectedValue, date);
    }

    /**
     * Checks if Status displayed.
     *
     * @return true if Status displayed.
     */
    public boolean isStatusDisplayed() {
        return CommonActions.isElementDisplayed(isStatusEvent);
    }

    /**
     * Checks if Show More link displayed.
     *
     * @return true if Show More link displayed.
     */
    public boolean isShowMoreDisplayed() {
        return CommonActions.isElementDisplayed(showMoreDetailLink);
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
     * Click destination phone number.
     *
     * @param fieldName as String.
     */
    public void clickDestinationPhoneNumber(String fieldName) {
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(DESTINATION_LOCATION, fieldName)));
        CommonActions.clickElement(expectedValue);
    }
}
