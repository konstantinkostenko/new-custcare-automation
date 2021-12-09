package idt.custcare.ui.portals.custcare.pages;

import idt.custcare.ui.base.ReactBasePage;
import idt.custcare.ui.utils.CommonActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ReactHomePage extends ReactBasePage {

    private static final String WELCOME_MSG = "//span[@class = 'userName'][contains(text(),'%s')]]";

    @FindBy(xpath = "//div[@class='logo']")
    private WebElement lblHomeTitle;

    @FindBy(className = "userName")
    private WebElement userNameClass;

    @FindBy(xpath = "//span//a[@href='/query']")
    private WebElement queryTab;

    /**
     * Clicks on query tab.
     */
    public void clickOnQueryTab() {
        CommonActions.clickElement(queryTab);
    }

    /**
     * Verifies if React home page is displayed.
     *
     * @param username the username of user logged in the portal.
     * @return true if home page is displayed.
     */
    public boolean isHomePage(final String username) {
        return (isHomeTitleDisplayed() && isWelcomeUserMessageDisplayed(username));
    }

    /**
     * Verifies if home page title is displayed in home page.
     *
     * @return true if home page title is displayed.
     */
    public boolean isHomeTitleDisplayed() {
        return CommonActions.isElementDisplayed(lblHomeTitle);
    }

    /**
     * Verifies if welcome user message is displayed in home page.
     *
     * @param username the username of user logged in the portal.
     * @return true if welcome user message is displayed.
     */
    public boolean isWelcomeUserMessageDisplayed(final String username) {
        WebElement lblWelcomeUserMessage = getDriver().findElement(
                By.xpath(String.format(WELCOME_MSG, username)));
        return CommonActions.isElementDisplayed(lblWelcomeUserMessage);
    }

    /**
     * Verifies if the user name is into Idt Welcome label.
     *
     * @param userName user name to verify.
     * @return true if the user name is the same.
     */
    public boolean isUserLogin(final String userName) {
        String actualUser = CommonActions.getTextElement(userNameClass);
        return actualUser.contains(userName);
    }
}
