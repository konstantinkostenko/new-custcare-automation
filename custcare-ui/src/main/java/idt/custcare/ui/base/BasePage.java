package idt.custcare.ui.base;

import idt.custcare.ui.driver.DriverManager;
import idt.custcare.ui.entity.BaseEntity;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.DateUtils;
import idt.custcare.ui.utils.SmartWait;
import idt.custcare.ui.utils.constants.SearchBy;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * Represents and encapsulates common pages objects attributes.
 */
public abstract class BasePage {
    private WebDriver driver;
    private WebDriverWait driverWait;
    protected static final Logger LOGGER = LogManager.getLogger(CommonActions.class.getSimpleName());
    /**
     * Initializes an instance of {@link BasePage}.
     */
    public BasePage() {
        setDriver(DriverManager.getInstance().getWebDriver());
        setDriverWait(DriverManager.getInstance().getWebDriverWait());
        PageFactory.initElements(getDriver(), this);
    }

    /**
     * Moves scroll bar down until get end of page.
     */
    public static void reachBottomPage() {
        CommonActions.scrollDownPageUntilBottom();
    }

    /**
     * Accepts windows alert.
     */
    public static void acceptTransaction() {
        CommonActions.acceptAlert();
    }

    /**
     * Gets the title.
     *
     * @return the String title.
     */
    public String getTitle() {
        return DriverManager.getInstance().getCurrentPageTitle();
    }

    /**
     * Gets the driver.
     *
     * @return driver property
     */
    protected WebDriver getDriver() {
        return driver;
    }

    /**
     * Sets a value in driver.
     *
     * @param driver value to set in driver property
     */
    protected void setDriver(final WebDriver driver) {
        this.driver = driver;
    }

    /**
     * Gets the driverWait.
     *
     * @return driverWait property
     */
    protected WebDriverWait getDriverWait() {
        return driverWait;
    }

    /**
     * Sets a value in driverWait.
     *
     * @param driverWait value to set in driverWait property
     */
    protected void setDriverWait(final WebDriverWait driverWait) {
        this.driverWait = driverWait;
    }

    /**
     * Gets message value of alert box displayed.
     *
     * @return alert box message
     */
    public String getAlertBoxMessage() {
        return CommonActions.getAlertMessage();
    }

    /**
     * Gets a web element locator on page.
     *
     * @param elementName as String, represents element whose locator will be returned.
     * @return a specific web element locator.
     */
    protected abstract WebElement getPageElement(final String elementName);

    /**
     * Gets text value displayed in web element.
     *
     * @param field Web Element
     * @return returns text displayed in web element
     */
    public String getText(final String field) {
        WebElement fieldLocator = getPageElement(field);
        return CommonActions.getTextElement(fieldLocator).replace("\n", "");
    }

    /**
     * Selects option from select element if option is not null.
     *
     * @param selectField Name of Select Web Element
     * @param option      Option of Select Element as String
     */
    public void selectIfOptionNotNull(final String selectField, final String option) {
        if (option != null) {
            WebElement selectElement = getPageElement(selectField);
            CommonActions.selectOption(selectElement, option);
        }
    }

    /**
     * Sets new value to Text box field.
     *
     * @param field    Web Element
     * @param newValue value to fill in text
     */
    public void fillFieldIfValueNotNull(final String field, final String newValue) {
        if (newValue != null) {
            WebElement webElement = getPageElement(field);
            CommonActions.clearTextFieldForReact(webElement);
            CommonActions.clearAndSetInputField(webElement, newValue);
        }
    }

    /**
     * Clicks the web element on Speed Dial Codes page.
     *
     * @param fieldName Name of Web Element.
     */
    public void clickElement(final String fieldName) {
        WebElement webElement = getPageElement(fieldName);
        CommonActions.clickElement(webElement);
    }


    /**
     * Verifies if web element is displayed.
     * @param fieldName as String
     * @return true if web element is displayed, otherwise false.
     */
    public boolean isElementDisplayed(final String fieldName){
        WebElement element = getPageElement(fieldName);
        return CommonActions.isElementDisplayed(element);
    }

    /**
     * Verifies if column data displayed is ascending or descending.
     * @param columnData String Array
     * @param n Length of Array to check
     * @param format DateTime Format
     * @return 1 if column data is descending, otherwise false.
     * @throws ParseException Unable to parse Date String.
     */
    public int isColumnDataDescending(String columnData[], int n, String format) throws ParseException {
        if (n == 1 || n == 0)
            return 1;

        if (DateUtils.getDateFromString(columnData[n - 1],format).after(DateUtils.getDateFromString(columnData[n - 2],format)))
            return 0;

        return isColumnDataDescending(columnData, n - 1, format);
    }

    /**
     * Verifies if entities are equal or not.
     *
     * @param expectedEntity as instance of BaseEntity
     * @param actualEntity   as instance of BaseEntity
     * @return true if entities matches, otherwise false.
     */
    public boolean areEntitiesEquals(final BaseEntity expectedEntity, final BaseEntity actualEntity) {
        Stream<String> fieldNames = expectedEntity.getFieldNames().stream().filter(name -> expectedEntity.getFieldValue(name) != null);
        Object[] fields = fieldNames.toArray();
        for (int i = 0; i < fields.length; i++) {
            // If only need to check not empty
            if (expectedEntity.getFieldValue(fields[i].toString()).equals("NOT_EMPTY")) {
                if (actualEntity.getFieldValue(fields[i].toString()).toString().length() == 0) {
                    return false;
                }
            } else if (expectedEntity.getFieldValue(fields[i].toString()).equals("EMPTY")) {

                if (actualEntity.getFieldValue(fields[i].toString()) != null) {
                    return false;
                }
            } else if (expectedEntity.getFieldValue(fields[i].toString()) != null) {
                if (!expectedEntity.getFieldValue(fields[i].toString()).
                        equals(actualEntity.getFieldValue(fields[i].toString()))) {
                    return false;
                }
            }
        }

        return true;
    }

    /**
     * Gets the table headers as list.
     * @param tableName as String
     * @return List<String> for headers displayed in table.
     */
    public List<String> getTableHeaders(final String tableName){
        List<String> tableHeaders = new ArrayList<>();
        WebElement tableElement = getPageElement(tableName);
        WebElement rowElement = tableElement.findElements(By.tagName("tr")).get(0);
        List<WebElement> headerCellElements = rowElement.findElements(By.tagName("td"));
        for (WebElement headerCellElement : headerCellElements) {
            tableHeaders.add(headerCellElement.getText().trim());
        }

        return tableHeaders;
    }


    /**
     * Set the state of radio button to checked by name and value
     * @param fieldName as String
     * @param fieldValue as String
     */
    public void checkRadioButtonByName(String fieldName, String fieldValue){
        List<WebElement>radioButtonElements = CommonActions.findElementsBy(SearchBy.XPATH,
                String.format("//input[@name='%s']", fieldName));
        for (WebElement radioButtonElement : radioButtonElements) {
            if (radioButtonElement.getAttribute("value").equals(fieldValue)){
                radioButtonElement.click();
            }
        }
    }
}
