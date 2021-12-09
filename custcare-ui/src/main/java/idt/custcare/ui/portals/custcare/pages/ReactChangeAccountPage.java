package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.HashMap;
import java.util.Map;

/**
 * Manages elements and actions on React Search Result page.
 */
public class ReactChangeAccountPage extends ReactBasePage {

    private static final String POPUP_HEADER = "//div[contains(text(),'%s')]";
    private static final String ACCEPT_ACTION = "//div[@class='ant-modal-footer']//button[@type='button'][./span[contains(text(),'%s')]]";
    private static final String CANCEL_ACTION = "//button[./span[contains(text(),'%s')]]/following-sibling::button";
    private static final String SUCCESS_MESSAGE = "//div[@class = 'ant-notification-notice-message'][contains(.,'%s')]";

    @FindBy(xpath = "//button[@type='button'][./span[contains(text(),'Suspend')]]")
    private WebElement btnSuspend;

    @FindBy(xpath = "//button[@type='button'][./span[contains(text(),'Reactivate')]]")
    private WebElement btnReactivate;

    @FindBy(xpath = "//button[@type='button'][./span[contains(text(),'Disconnect')]]")
    private WebElement btnDisconnect;

    @FindBy(xpath = "//button[@type='button'][./span[contains(text(),'Unlock')]]")
    private WebElement btnUnlock;

    @FindBy(css = "span.ant-notification-close-x")
    private WebElement btnClosePopup;

    /**
     * Clicks OK button in Success pop up.
     */
    public void closeSuccessMessagePopUp() {
        CommonActions.clickElement(btnClosePopup);
    }

    /**
     * Checks if OK button displayed in popup.
     *
     * @return true if element displayed.
     */
    public boolean isOkButtonDisplayed() {
        return CommonActions.isElementDisplayed(btnClosePopup);
    }

    /**
     * Checks if header with appropriate name displayed.
     *
     * @param expectedParameter as String.
     * @return true if element displayed.
     */
    public boolean isHeaderDisplayed(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(POPUP_HEADER, expectedParameter)));
        return CommonActions.isElementDisplayed(expectedValue);
    }

    /**
     * Clicks accept button.
     *
     * @param expectedParameter as String.
     */
    public void acceptAction(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(ACCEPT_ACTION, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Clicks cancel button.
     *
     * @param expectedParameter as String.
     */
    public void cancelAction(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(CANCEL_ACTION, expectedParameter)));
        CommonActions.clickElement(expectedValue);
    }

    /**
     * Checks if success message with appropriate text displayed.
     *
     * @param expectedParameter as String.
     * @return true if element displayed.
     */
    public boolean isSuccessMessageDisplayed(String expectedParameter) {
        WebElement expectedValue = getDriver().findElement(
                By.xpath(String.format(SUCCESS_MESSAGE, expectedParameter)));
        return CommonActions.isElementDisplayed(expectedValue);
    }

    /**
     * Checks if appropriate element displayed.
     *
     * @return true if element displayed.
     */
    public boolean isElementDisplayed(String option) {
        WebElement element = getPageElement(option);
        return CommonActions.isElementDisplayed(element);
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
        pageElementsMap.put("SUSPEND", btnSuspend);
        pageElementsMap.put("DISCONNECT", btnDisconnect);
        pageElementsMap.put("REACTIVATE", btnReactivate);
        pageElementsMap.put("UNLOCK", btnUnlock);
        pageElementsMap.put("CLOSE SUCCESS MESSAGE POPUP", btnClosePopup);
        return pageElementsMap.get(elementName.toUpperCase());
    }
}
