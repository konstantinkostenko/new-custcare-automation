package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.BasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.SmartWait;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Manages elements and actions on Mtu Query page.
 */
public class ReactMtuQueryPage extends BasePage {

    private static final String EXPAND_TRANSACTION = "//tr[./td[contains(text(),'%s')]]//button";
    private static final String PARAMETER = "//div[./span[contains(text(),'%s')]]/following-sibling::div//span";
    private static final String PURCHASE_SOURCE = "//div[./span[contains(text(),'Purchase Source')]]/following-sibling::div//div[@class='ant-space-item'][1]//span[@class='ant-typography']";
    private static final String PURCHASE_SOURCE_PORTAL = "//div[./span[contains(text(),'Purchase Source')]]/following-sibling::div//div[@class='ant-space-item'][2]//span[@class='ant-typography']";
    private static final String PURCHASE_SOURCE_COUNTRY = "//div[./span[contains(text(),'Purchase Source')]]/following-sibling::div//div[@class='ant-space-item'][3]//span[@class='ant-typography']";
    private static final String ALERT_MESSAGE = "//div[contains(@class,'item-label') and contains(., '%s')]/..//div[@role='alert']";


    @FindBy(xpath = "//a[@href=\"/mtu\"]")
    private WebElement tabMtu;

    @FindBy(xpath = "//div[contains(text(),'MTU Details')]")
    private WebElement tabMtuDetails;

    @FindBy(id = "phone")
    private WebElement txtPhoneNumber;

    @FindBy(id = "userName")
    private WebElement txtUserName;

    @FindBy(xpath = "//input[@id='date'][@disabled]")
    private WebElement txtDateRateDisabled;

    @FindBy(id = "destinationPhoneNumber")
    private WebElement txtMsisdn;

    @FindBy(id = "pin")
    private WebElement txtPin;

    @FindBy(xpath = "//input[@placeholder='Start date']")
    private WebElement txtStartDate;

    @FindBy(xpath = "//input[@placeholder='End date']")
    private WebElement txtEndDate;

    @FindBy(xpath = "//button[@type='submit']")
    private WebElement btnSearch;

    @FindBy(xpath = "//button[@type='button'][@class = 'ant-btn']")
    private WebElement btnClear;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Today')]")
    private WebElement btnToday;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Yesterday')]")
    private WebElement btnYesterday;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Last 7 days')]")
    private WebElement btnOneWeek;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Last 14 days')]")
    private WebElement btnTwoWeeks;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Last 30 days')]")
    private WebElement btnMonth;

    @FindBy(xpath = "//span[@class = 'ant-tag ant-tag-blue'][contains(text(),'Last 90 days')]")
    private WebElement btnThreeMonth;

    @FindBy(id = "destinationPhoneNumber")
    private WebElement txtdestinationPhoneNumber;

    @FindBy(css = "div > div.ant-tooltip-inner")
    private WebElement txtDestinationLocation;


    /**
     * Gets a web element locator on page.
     *
     * @param elementName as String, represents element whose locator will be returned.
     * @return a specific web element locator.
     */
    @Override
    protected WebElement getPageElement(String elementName) {
        Map<String, WebElement> pageElementsMap = new HashMap<>();
        pageElementsMap.put("MTU", tabMtu);
        pageElementsMap.put("MTU DETAILS", tabMtuDetails);
        pageElementsMap.put("PHONE NUMBER", txtPhoneNumber);
        pageElementsMap.put("USERNAME", txtUserName);
        pageElementsMap.put("MSISDN", txtMsisdn);
        pageElementsMap.put("PIN", txtPin);
        pageElementsMap.put("START DATE", txtStartDate);
        pageElementsMap.put("END DATE", txtEndDate);
        pageElementsMap.put("SEARCH", btnSearch);
        pageElementsMap.put("CLEAR", btnClear);
        pageElementsMap.put("TODAY", btnToday);
        pageElementsMap.put("YESTERDAY", btnYesterday);
        pageElementsMap.put("LAST 7 DAYS", btnOneWeek);
        pageElementsMap.put("LAST 14 DAYS", btnTwoWeeks);
        pageElementsMap.put("LAST 30 DAYS", btnMonth);
        pageElementsMap.put("LAST 90 DAYS", btnThreeMonth);
        pageElementsMap.put("DESTINATION PHONE NUMBER", txtdestinationPhoneNumber);
        pageElementsMap.put("DESTINATION LOCATION", txtDestinationLocation);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Sets date field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setDateField(final String date, final String dateField) {
        CommonActions.waitFor(1);
        WebElement dateElement = getPageElement(dateField);
        CommonActions.clearTextFieldForReact(dateElement);
        CommonActions.setTextFieldForReact(dateElement, date);
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
     * Gets date based on the selection.
     *
     * @param expectedDate as String.
     */
    public String getDate(final String expectedDate) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String actualDate = null;
        switch (expectedDate) {
            case ("TODAY"):
                Date today = cal.getTime();
                actualDate = dateFormat.format(today);
                break;
            case ("YESTERDAY"):
                cal.add(Calendar.DATE, -1);
                Date yesterday = cal.getTime();
                actualDate = dateFormat.format(yesterday);
                break;
            case ("LAST 7 DAYS"):
                cal.add(Calendar.DATE, -6);
                Date oneWeek = cal.getTime();
                actualDate = dateFormat.format(oneWeek);
                break;
            case ("LAST 14 DAYS"):
                cal.add(Calendar.DATE, -13);
                Date twoWeeks = cal.getTime();
                actualDate = dateFormat.format(twoWeeks);
                break;
            case ("LAST 30 DAYS"):
                cal.add(Calendar.DATE, -29);
                Date month = cal.getTime();
                actualDate = dateFormat.format(month);
                break;
            case ("LAST 90 DAYS"):
                cal.add(Calendar.DATE, -89);
                Date threeMonths = cal.getTime();
                actualDate = dateFormat.format(threeMonths);
                break;
            default:
                String message = "'%s' is not a valid option";
                throw new IllegalArgumentException(String.format(message, expectedDate));
        }
        return actualDate;
    }

    /**
     * Chooses specific date from the calendar.
     *
     * @param buttonName as String.
     */
    public void chooseDate(final String buttonName) {
        SmartWait.waitUntil(() -> CommonActions.isElementClickable(txtStartDate));
        CommonActions.clickElement(txtStartDate);
        WebElement btnLocator = getPageElement(buttonName);
        CommonActions.clickElement(btnLocator);
    }

    /**
     * Gets text value displayed in web element.
     *
     * @param field Web Element
     * @return returns text displayed in web element
     */
    public String getTextOfValue(final String field) {
        WebElement fieldLocator = getPageElement(field);
        return CommonActions.getElementAttribute(fieldLocator, "value").replace("\n", "");
    }

    /**
     * Gets Read only state of web element.
     *
     * @param field Web Element
     * @return returns Read only web element
     */
    public String getStateReadOnlyField(final String field) {
        WebElement state = getPageElement(field);
        return CommonActions.getElementAttribute(state, "class");
    }

    /**
     * Expands transaction on Mtu Query Page.
     *
     * @param fieldName as String.
     */
    public void expandTransaction(String fieldName) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(EXPAND_TRANSACTION, fieldName)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Get text of element.
     *
     * @param expectedParameter as String.
     * @return product value as String.
     */
    public String getElementValueInPage(String expectedParameter) {
        switch (expectedParameter) {
            case ("First Purchase Source"):
                WebElement source = getDriver().findElement(
                        By.xpath(String.format(PURCHASE_SOURCE, expectedParameter)));
                return CommonActions.getTextElement(source);
            case ("Second Purchase Source"):
                WebElement portal = getDriver().findElement(
                        By.xpath(String.format(PURCHASE_SOURCE_PORTAL, expectedParameter)));
                return CommonActions.getTextElement(portal);
            case ("Third Purchase Source"):
                WebElement country = getDriver().findElement(
                        By.xpath(String.format(PURCHASE_SOURCE_COUNTRY, expectedParameter)));
                return CommonActions.getTextElement(country);
            default:
                WebElement expectedValue = getDriver().findElement(
                        By.xpath(String.format(PARAMETER, expectedParameter)));
                return CommonActions.getTextElement(expectedValue);
        }
    }

    public String getMessageByField(final String fieldName) {
        return getDriver().findElement(By.xpath(String.format(ALERT_MESSAGE, fieldName))).getText();
    }

    /**
     * Get text of element.
     *
     * @return product value as String.
     */
    public String getDestinationLocation() {
        return CommonActions.getTextElement(txtDestinationLocation);
    }

    /**
     * Is Date Range disabled.
     *
     * @return true if Date Range disabled.
     */
    public boolean isDateRangeDisabled() {
        return CommonActions.isElementDisplayed(txtDateRateDisabled);
    }
}