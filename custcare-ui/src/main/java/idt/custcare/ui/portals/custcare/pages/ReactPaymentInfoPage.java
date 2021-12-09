package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.SmartWait;
import idt.custcare.ui.utils.constants.SearchBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;


/**
 * Manages elements and actions on React Payment Info page.
 */
public class ReactPaymentInfoPage extends ReactBasePage {

    private static final String PARAMETER = "//div//span[@class='itemTitle'][contains(text(),'%s')]/following-sibling::span";
    private static final String PAYMENT_INFO = "//div[@title='%s']";
    private static final String EXPIRATION_DATE = "//div[contains(text(),'%s')]";
    private static final String MAT_CELL_LOCATOR = "//td[@class = 'ant-table-cell']";
    private static final String STREET_AUTO_COMPLETE = "//div[@class='pac-item']//span[contains(text(), '%s')]";
    private static final String TRANSACTION_AMOUNT_VALUE = "//div[@title='%s']";

    @FindBy(xpath = "//h3[contains(text(),'Payment Info')]")
    private WebElement lblPageTitle;

    @FindBy(css = "div#root button[type=\"submit\"].ant-btn.ant-btn-primary")
    private WebElement btnSave;

    @FindBy(css = "div#root div.paymentInfo_formBtn__1YlbI > button[type=\"button\"]:nth-child(2)")
    private WebElement btnReset;

    @FindBy(css = "input#cardNumber")
    private WebElement txtCardNumber;

    @FindBy(css = "input#expMonth")
    private WebElement txtExpMonth;

    @FindBy(css = "input#expYear")
    private WebElement txtExpYear;

    @FindBy(css = "input#cvv2")
    private WebElement txtCvv2;

    @FindBy(xpath = "//span[.//input[@id='payType']]/following-sibling::span[1]")
    private WebElement txtPaymentType;

    @FindBy(xpath = "//div[@class = 'ant-select-selector'][.//input[@id='payType']]")
    private WebElement lstPaymentType;

    @FindBy(id = "firstName")
    private WebElement txtFirstName;

    @FindBy(id = "lastName")
    private WebElement txtLastName;

    @FindBy(css = "[placeholder='Street1']")
    private WebElement txtStreet1;

    @FindBy(css = "[placeholder='Street2']")
    private WebElement txtStreet2;

    @FindBy(xpath = "//input[@placeholder='City']")
    private WebElement txtCity;

    @FindBy(xpath = "//input[@placeholder='Zip/Post Code']")
    private WebElement txtZip;

    @FindBy(xpath = "//span[contains(text(),'Use customer info')]")
    private WebElement btnUseCustomerInfo;

    @FindBy(xpath = "//span[contains(text(),'Remove account info')]")
    private WebElement btnRemoveAccountInfo;

    @FindBy(xpath = "//input[@id='country']")
    private WebElement lstCountry;

    @FindBy(xpath = "//span[./input[@id= 'country']]/following-sibling::span[1]")
    private WebElement txtCountry;

    @FindBy(xpath = "//input[@id='state']")
    private WebElement lstState;

    @FindBy(xpath = "//span[./input[@id= 'state']]/following-sibling::span[1]")
    private WebElement txtState;

    @FindBy(xpath = "//div[contains(text(), 'Customer info is empty')]")
    private WebElement txtCustomerInfoEmpty;

    @FindBy(xpath = "//div[contains(text(), 'Your data was successfully saved')]")
    private WebElement txtDataSaved;

    @FindBy(id = "multiUse")
    private WebElement btnMultipleUse;

    @FindBy(xpath = "//div[contains(text(), 'Class is being migrated. Try again later.')]")
    private WebElement txtClassMigrated;

    @FindBy(xpath = "//span[./input[@id= 'multiUse']]")
    private WebElement btnAllowMultipleUse;

    @FindBy(xpath = "//span[contains(text(), 'Search result')]")
    private WebElement btnSearchResult;

    @FindBy(xpath = "//div[contains(text(), 'Recharge Settings')]")
    private WebElement btnRechargeSettings;

    @FindBy(css = "p[class='text-center m-0']")
    private WebElement txtTriggerThreshold;

    @FindBy(css = "input[id = 'rechargeAmount']")
    private WebElement txtRechargeAmontField;

    @FindBy(xpath = "//span[./input[@id = 'rechargeAmount']]/following-sibling::span[1]")
    private WebElement txtRechargeAmontList;

    @FindBy(id = "autoRechargeStatus")
    private WebElement btnAllowAutoRecharge;

    @FindBy(css = "button[id = 'midCallRecharge']")
    private WebElement btnMidcallRecharge;

    @FindBy(xpath = "//button[@id = 'midCallRecharge'][@aria-checked = 'true']")
    private WebElement btnMidcallRechargeTrue;

    @FindBy(css = "button[id = 'autoRechargeStatus'][aria-checked = 'true']")
    private WebElement btnAutoRechargeTrue;

    @FindBy(css = "/button[id = 'autoRechargeStatus'][aria-checked = 'false']")
    private WebElement btnAutoRechargeFalse;

    @FindBy(xpath = "//input[@id = 'policyId']")
    private WebElement lstRechargePolicy;

    @FindBy(xpath = "//span[./input[@id= 'policyId']]/following-sibling::span[1]")
    private WebElement txtRechargePolicy;

    @FindBy(css = "input[id = 'minDaysBetween']")
    private WebElement txtMinDaysBetweenRecharges;

    @FindBy(xpath = "//div[./div[@role = 'alert'][contains(text(), 'Please input Amount')]]")
    private WebElement txtPlsInputAmount;

    @FindBy(xpath = "//div[@class='pac-container pac-logo hdpi'][@style = 'width: 338px; position: absolute; left: 740px; top: 685px;']//div")
    private WebElement lstAutoComplete;

    @FindBy(css = "div#root h4 > span")
    private WebElement txtCreditRisk;

    @FindBy(xpath = "//div[contains(text(), 'Recharge')]")
    private WebElement btnRecharge;

    @FindBy(css = "input[id = 'transactionAmount']")
    private WebElement txtTransactionAmount;

    @FindBy(xpath = "//button[span[text()='Apply']]")
    private WebElement btnApply;

    @FindBy(xpath = "//div[@class = 'ant-select-selector'][.//input[@id='transactionAmount']]")
    private WebElement lstTransactionAmount;

    @FindBy(xpath = "//button[span[text()='Apply']]")
    private WebElement txtfailure;


    /**
     * Checks if Payment Info page is displayed.
     *
     * @return true if Payment Info page is displayed.
     */
    public boolean isSearchResultPage() {
        return CommonActions.isElementDisplayed(lblPageTitle);
    }

    /**
     * Checks if "Customer info is empty" displays in Payment Info page
     *
     * @return true if "Customer info is empty" displays in Payment Info page
     */
    public boolean isCustomerInfoEmpty() {
        return CommonActions.isElementDisplayed(txtCustomerInfoEmpty);
    }

    /**
     * Checks if autocomplete displays for Street1 in Payment Info page
     *
     * @return true if autocomplete displays
     */
    public boolean isAutoCompleteDisplayed() {
        return CommonActions.isElementDisplayed(lstAutoComplete);
    }

    /**
     * Checks if appropriate message displayed in Payment Info page
     *
     * @return true if "Your data was successfully saved" displays in Payment Info page
     */
    public boolean isMessageDisplayed(String message) {
        WebElement element = getPageElement(message);
        return CommonActions.isElementDisplayed(element);
    }

    /**
     * Select Payment Type.
     *
     * @param expectedParameter as String.
     */
    public void selectStreetFromAutocomplete(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(STREET_AUTO_COMPLETE, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Select Payment Type.
     *
     * @param expectedParameter as String.
     */
    public void selectPaymentType(String expectedParameter) {
        SmartWait.waitUntil(() -> CommonActions.isElementClickable(lstPaymentType));
        CommonActions.clickElement(lstPaymentType);
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(PAYMENT_INFO, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Selects Expiration Month.
     *
     * @param expectedParameter as String.
     */
    public void selectExpirationMonth(String expectedParameter) {
        CommonActions.clickElement(txtExpMonth);
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(EXPIRATION_DATE, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Select Expiration Year.
     *
     * @param expectedParameter as String.
     */
    public void selectExpirationYear(String expectedParameter) {
        CommonActions.clickElement(txtExpYear);
        CommonActions.waitFor(1);
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(EXPIRATION_DATE, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Chooses text from the element list.
     *
     * @param element as String.
     * @param text    as String.
     */
    public void selectElementFromList(final String element, final String text) {
        switch (element.toUpperCase()) {
            case ("STATE"):
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(lstState));
                lstState.sendKeys(text);
                WebElement state = getDriver().findElement(
                        By.xpath(String.format(PAYMENT_INFO, text)));
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(state));
                CommonActions.clickElement(state);
                break;
            case ("COUNTRY"):
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(lstCountry));
                lstCountry.sendKeys(text);
                WebElement country = getDriver().findElement(
                        By.xpath(String.format(PAYMENT_INFO, text)));
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(country));
                CommonActions.clickElement(country);
                break;
            case ("RECHARGE POLICY"):
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(lstRechargePolicy));
                lstRechargePolicy.sendKeys(text);
                CommonActions.waitFor(1);
                WebElement recharge = getDriver().findElement(
                        By.xpath(String.format(PAYMENT_INFO, text)));
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(recharge));
                CommonActions.clickElement(recharge);
                break;
            case ("TRANSACTION AMOUNT LIST"):
                System.out.println("wait ");
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(lstTransactionAmount));
                CommonActions.clickElement(lstTransactionAmount);
                CommonActions.waitFor(1);
                WebElement expectedValue = getDriver().findElement(
                        By.xpath(String.format(TRANSACTION_AMOUNT_VALUE, text)));
                CommonActions.clickElement(expectedValue);
                break;
            default:
                throw new NoSuchElementException("No element found.");
        }
    }

    /**
     * Get text of elements in dashboard.
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
     * Sets checkbox.
     *
     * @param checkbox as String.
     * @param value    as String.
     */
    public void setCheckbox(final String checkbox, final boolean value) {
        WebElement element = getPageElement(checkbox);
        switch (checkbox) {
            case ("ALLOW MULTIPLE USE"):
                boolean checked = CommonActions.isElementSelected(element);
                if ((checked && !value) || (!checked && value)) {
                    CommonActions.clickElement(btnAllowMultipleUse);
                }
                break;
            default:
                SmartWait.waitUntil(() -> CommonActions.isElementClickable(element));
                String check = CommonActions.getElementAttribute(element, "aria-checked");
                if ((check.equals("true") && !value) || (check.equals("false") && value)) {
                    CommonActions.clickElement(element);
                }
                break;
        }
    }

    /**
     * Gets text of elements in auto recharge block.
     *
     * @return map of auto recharge info.
     */
    public Map<String, String> autoRechargeInfo() {
        Map<String, String> autoRechargeInfo = new HashMap<>();
        if (CommonActions.isElementDisplayed(txtRechargeAmontField)) {
            autoRechargeInfo.put("RECHARGE AMOUNT", CommonActions.getElementAttribute(txtRechargeAmontField, "value"));
        } else {
            autoRechargeInfo.put("RECHARGE AMOUNT", CommonActions.getTextElement(txtRechargeAmontList));
        }
        autoRechargeInfo.put("AUTO RECHARGE", CommonActions.getElementAttribute(btnAllowAutoRecharge, "aria-checked"));
        autoRechargeInfo.put("MIDCALL RECHARGE", CommonActions.getElementAttribute(btnMidcallRecharge, "aria-checked"));
        autoRechargeInfo.put("TRIGGER THRESHOLD", CommonActions.getTextElement(txtTriggerThreshold));
        autoRechargeInfo.put("MIN DAYS BETWEEN RECHARGES", CommonActions.getElementAttribute(txtMinDaysBetweenRecharges, "value"));
        return autoRechargeInfo;
    }

    /**
     * Gets text of elements in Recharge Limits block.
     *
     * @return map of Recharge Limits info.
     */
    public Map<String, String> rechargeLimitsInfo() {
        Map<String, String> rechargeLimitsInfo = new HashMap<>();
        List<WebElement> matCell = CommonActions.findElementsBy(SearchBy.XPATH, MAT_CELL_LOCATOR);
        rechargeLimitsInfo.put("CURRENT RECHARGES", matCell.get(0).getText());
        rechargeLimitsInfo.put("MAX NUMBER RECHARGES", matCell.get(1).getText());
        rechargeLimitsInfo.put("CURRENT RECHARGE AMOUNT", matCell.get(2).getText());
        rechargeLimitsInfo.put("MAX RECHARGE AMOUNT", matCell.get(3).getText());
        return rechargeLimitsInfo;
    }

    /**
     * Finds recharge limits in recharge settings table.
     *
     * @return a Map of recharge limits.
     */
    public Map<String, String> findRechargeLimits() {
        CommonActions.waitFor(1);
        Map<String, String> rechargeLimits = new HashMap<>();
        List<WebElement> matCell = CommonActions.findElementsBy(SearchBy.XPATH, MAT_CELL_LOCATOR);
        rechargeLimits.put("Current Recharges", matCell.get(0).getText());
        rechargeLimits.put("Max Number Recharges", matCell.get(1).getText());
        rechargeLimits.put("Current Recharge Amount", matCell.get(2).getText());
        rechargeLimits.put("Max Recharge Amount", matCell.get(3).getText());
        return rechargeLimits;
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
        pageElementsMap.put("PAYMENT INFO", lblPageTitle);
        pageElementsMap.put("SAVE", btnSave);
        pageElementsMap.put("RESET", btnReset);
        pageElementsMap.put("CARD NUMBER", txtCardNumber);
        pageElementsMap.put("EXPIRATION MONTH", txtExpMonth);
        pageElementsMap.put("EXPIRATION YEAR", txtExpYear);
        pageElementsMap.put("CVV", txtCvv2);
        pageElementsMap.put("PAYMENT TYPE", lstPaymentType);
        pageElementsMap.put("FIRST NAME", txtFirstName);
        pageElementsMap.put("LAST NAME", txtLastName);
        pageElementsMap.put("STREET1", txtStreet1);
        pageElementsMap.put("STREET2", txtStreet2);
        pageElementsMap.put("CITY", txtCity);
        pageElementsMap.put("ZIP", txtZip);
        pageElementsMap.put("USE CUSTOMER INFO", btnUseCustomerInfo);
        pageElementsMap.put("REMOVE ACCOUNT INFO", btnRemoveAccountInfo);
        pageElementsMap.put("COUNTRY", lstCountry);
        pageElementsMap.put("STATE", lstState);
        pageElementsMap.put("ALLOW MULTIPLE USE", btnMultipleUse);
        pageElementsMap.put("SEARCH RESULT", btnSearchResult);
        pageElementsMap.put("RECHARGE SETTINGS", btnRechargeSettings);
        pageElementsMap.put("RECHARGE POLICY", lstRechargePolicy);
        pageElementsMap.put("RECHARGE AMOUNT FIELD", txtRechargeAmontField);
        pageElementsMap.put("MIN DAYS BETWEEN RECHARGES", txtMinDaysBetweenRecharges);
        pageElementsMap.put("TRIGGER THRESHOLD", txtTriggerThreshold);
        pageElementsMap.put("AUTO RECHARGE", btnAllowAutoRecharge);
        pageElementsMap.put("MIDCALL RECHARGE", btnMidcallRecharge);
        pageElementsMap.put("YOUR DATA WAS SUCCESSFULLY SAVED", txtDataSaved);
        pageElementsMap.put("CLASS IS BEING MIGRATED. TRY AGAIN LATER.", txtClassMigrated);
        pageElementsMap.put("PLEASE INPUT AMOUNT", txtPlsInputAmount);
        pageElementsMap.put("CREDIT RISK", txtCreditRisk);
        pageElementsMap.put("RECHARGE", btnRecharge);
        pageElementsMap.put("TRANSACTION AMOUNT", txtTransactionAmount);
        pageElementsMap.put("APPLY", btnApply);
        pageElementsMap.put("FAILURE", txtfailure);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Gets text of elements in payment info page.
     *
     * @return map of credit card info fields.
     */
    public Map<String, String> creditCardInfo() {
        Map<String, String> creditCardInfo = new HashMap<>();
        creditCardInfo.put("PAYMENT TYPE", CommonActions.getTextElement(txtPaymentType));
        creditCardInfo.put("CARD NUMBER", CommonActions.getElementAttribute(txtCardNumber, "value"));
        creditCardInfo.put("EXPIRATION MONTH", CommonActions.getElementAttribute(txtExpMonth, "value"));
        creditCardInfo.put("EXPIRATION YEAR", CommonActions.getElementAttribute(txtExpYear, "value"));
        creditCardInfo.put("CVV", CommonActions.getElementAttribute(txtCvv2, "value"));
        creditCardInfo.put("FIRST NAME", CommonActions.getElementAttribute(txtFirstName, "value"));
        creditCardInfo.put("LAST NAME", CommonActions.getElementAttribute(txtLastName, "value"));
        creditCardInfo.put("STREET1", CommonActions.getElementAttribute(txtStreet1, "value"));
        creditCardInfo.put("STREET2", CommonActions.getElementAttribute(txtStreet2, "value"));
        creditCardInfo.put("CITY", CommonActions.getElementAttribute(txtCity, "value"));
        creditCardInfo.put("ZIP", CommonActions.getElementAttribute(txtZip, "value"));
        creditCardInfo.put("COUNTRY", CommonActions.getTextElement(txtCountry));
        creditCardInfo.put("STATE", CommonActions.getTextElement(txtState));
        return creditCardInfo;
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
        CommonActions.clearTextFieldForReact(dateElement);
        CommonActions.setInputField(dateElement, date);
    }

    public boolean isTextMessageDisplayed(final String message) {
        WebElement element = getDriver().findElement(By.xpath("//div[contains(@class, 'notification') and contains(.,'" + message + "')]"));
        return CommonActions.isElementDisplayed(element);
    }

    /**
     * Get text of elements in Transaction Amount
     */
    public String getValueInRechargeSection() {
        return txtTransactionAmount.getAttribute("value");
    }

    /**
     * Get text for Unable to Recharge text
     *
     * @param message String
     * @return
     */
    public boolean isTextUnableRecharge(final String message) {
        WebElement text = getDriver().findElement(By.xpath("//b[.='Unable to recharge.']"));
        return CommonActions.isElementDisplayed(text);
    }

}
