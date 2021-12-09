package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.BasePage;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.constants.DateFormat;
import idt.custcare.ui.utils.constants.SearchBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Manages elements and actions on Mtu Transactions page.
 */
public class ReactMtuTransactionsPage extends BasePage {

    private static final String MAT_ROWS_LOCATOR = "//tbody//tr[contains(@class,'ant-table-row ant-table-row-level-0')]";
    private static final String MAT_CELL_LOCATOR = "ant-table-cell";

    @FindBy(xpath = "//div[@class='ant-empty-description'][contains(text(),'No Data')]")
    private WebElement txtNoData;

    @FindBy(xpath = "//th[@class='ant-table-cell ant-table-column-has-sorters'][4]//span[@role='button']")
    private WebElement btnMobileOperatorSearch;

    @FindBy(xpath = "//th[@class='ant-table-cell ym-hide-content ant-table-column-has-sorters']//span[@role='button']")
    private WebElement btnDestinationSearch;

    @FindBy(xpath = "//input[@placeholder='Search mobOperator']")
    private WebElement txtMobOperatorSearchField;

    @FindBy(xpath = "//input[@placeholder='Search destPhone']")
    private WebElement txtDestinationPhoneSearchField;

    @FindBy(xpath = "//button//span[contains(text(),'Search')]")
    private WebElement btnSearch;

    @FindBy(xpath = "//button//span[contains(text(),'Reset')]")
    private WebElement btnReset;

    @FindBy(xpath = "//li[@title='Next Page']")
    private WebElement btnNextPage;

    @FindBy(xpath = "//li[@title='Previous Page']")
    private WebElement btnPreviousPage;

    @FindBy(xpath = "//h3[contains(text(),'Transactions')]")
    private WebElement lblTransactions;

    @FindBy(id = "rc-tabs-3-tab-dtcInfo")
    private WebElement dtcInfoTab;

    @FindBy(id = "rc-tabs-3-tab-mtu")
    private WebElement mtuDetailsTab;

    @FindBy(xpath = "//div[./input[@placeholder='Search mobOperator']]//span[contains(text(),'Search')]")
    private WebElement btnSearchMobOp;

    @FindBy(xpath = "//div[./input[@placeholder='Search destPhone']]//span[contains(text(),'Search')]")
    private WebElement btnSearchDestPhone;


    /**
     * Checks if Transactions page is displayed.
     *
     * @return true if Transactions page is displayed.
     */
    public boolean isTransactionsPage() {
        return CommonActions.isElementDisplayed(lblTransactions);
    }

    /**
     * Gets text of element
     *
     * @return as String.
     */
    public String isNoTransactionsDisplayed() {
        return CommonActions.getTextElement(txtNoData);
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
        pageElementsMap.put("NO DATA", txtNoData);
        pageElementsMap.put("MOBILE OPERATOR SEARCH", btnMobileOperatorSearch);
        pageElementsMap.put("DESTINATION PHONE SEARCH", btnDestinationSearch);
        pageElementsMap.put("MOBILE OPERATOR SEARCH FIELD", txtMobOperatorSearchField);
        pageElementsMap.put("DESTINATION PHONE SEARCH FIELD", txtDestinationPhoneSearchField);
        pageElementsMap.put("SEARCH MOBILE OPERATOR", btnSearchMobOp);
        pageElementsMap.put("SEARCH DESTINATION PHONE", btnSearchDestPhone);
        pageElementsMap.put("SEARCH", btnSearch);
        pageElementsMap.put("RESET", btnReset);
        pageElementsMap.put("NEXT PAGE", btnNextPage);
        pageElementsMap.put("PREVIOUS PAGE", btnPreviousPage);
        return pageElementsMap.get(elementName.toUpperCase());
    }

    /**
     * Click web element.
     *
     * @param dateField as String.
     */
    public void clickWebElement (final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        CommonActions.clickElement(dateElement);
    }

    /**
     * Sets date field with a specific date.
     *
     * @param date      as String.
     * @param dateField as String.
     */
    public void setDateField(final String date, final String dateField) {
        WebElement dateElement = getPageElement(dateField);
        CommonActions.setInputField(dateElement, date);
    }

    /**
     * Finds transactions in MTU Transactions page.
     *
     * @return a list of Maps which represents transactions info found on page.
     */
    public List<Map<String, String>> findTransactionData() {
        CommonActions.waitFor(1);
        List<Map<String, String>> transactions = new ArrayList<>();
        List<WebElement> matRow = CommonActions.findElementsBy(SearchBy.XPATH, MAT_ROWS_LOCATOR);
        for (WebElement webElement : matRow) {
            Map<String, String> transactionMap = new HashMap<>();
            List<WebElement> matCell = webElement.findElements(By.className(MAT_CELL_LOCATOR));
            transactionMap.put("Date", matCell.get(1).getText());
            transactionMap.put("Product", matCell.get(2).getText());
            transactionMap.put("Country", matCell.get(3).getText());
            transactionMap.put("Mobile Operator", matCell.get(4).getText());
            transactionMap.put("Sender Phone", matCell.get(5).getText());
            transactionMap.put("Destination Phone", matCell.get(6).getText());
            transactionMap.put("Amount", matCell.get(7).getText());
            transactionMap.put("Status", matCell.get(8).getText());
            transactions.add(transactionMap);
        }
        return transactions ;
    }
}
