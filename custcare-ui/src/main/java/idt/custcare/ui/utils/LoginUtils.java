package idt.custcare.ui.utils;

import idt.custcare.ui.base.login.ILoginPage;
import idt.custcare.ui.base.login.LoginFactory;
import idt.custcare.ui.base.login.PortalWeb;
import idt.custcare.ui.driver.DriverManager;
import idt.custcare.ui.driver.DriverTypes;
import idt.custcare.ui.portals.custcare.dto.EnvironmentConfigDto;
import idt.custcare.ui.portals.custcare.pages.ReactHomePage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;

/**
 * Performs the login to portals.
 */
public final class LoginUtils {
    private static final Logger LOGGER = LogManager.getLogger(LoginUtils.class.getName());
    private static final String LOGIN_KEYS_FORMAT = "%s%s%s";
    private static final int LOGIN_ACTION_TIMEOUT = 20;
    private static boolean loginStatus;

    /**
     * Private constructor for {@link LoginUtils} utility class.
     */
    private LoginUtils() {
    }

    /**
     * Performs the login with custom credentials.
     *
     * @param user        custom username.
     * @param password    custom password.
     * @param loginButton as WebElement type.
     */
    public static void loginToPortal(final String user, final String password, final WebElement loginButton) {
        if (CommonActions.isCurrentBrowser(DriverTypes.CHROME)
                || CommonActions.isCurrentBrowser(DriverTypes.INTERNET_EXPLORER)) {
            loginWithRobot(user, password, loginButton);
        } else {
            loginWithAlert(user, password, loginButton);
        }
    }

    /**
     * Performs the login using the Robot DateUtils class.
     *
     * @param username    username value.
     * @param password    password value.
     * @param loginButton button to press before to login
     */
    private static void loginWithRobot(final String username, final String password, final WebElement loginButton) {
        Thread robotLogin = new Thread(new RobotLoginActions(username, password));
        robotLogin.start();
        try {
            DriverManager.getInstance().setPageLoadTimeWait(LOGIN_ACTION_TIMEOUT);
            CommonActions.clickElement(loginButton);
            setLoginStatus(true);
        } catch (TimeoutException e) {
            LOGGER.error("Login action was not performed successfully");
            LOGGER.error(e.getMessage());
            setLoginStatus(false);
        } finally {
            DriverManager.getInstance().setDefaultTimeWaits();
        }
    }

    /**
     * Performs the login using the alert prompt.
     *
     * @param username    username value.
     * @param password    password value.
     * @param loginButton button to press before to login.
     */
    private static void loginWithAlert(final String username, final String password, final WebElement loginButton) {
        if (!loginStatus) {
            CommonActions.clickElement(loginButton);
            if (CommonActions.isAlertPresent()) {
                Alert alert = DriverManager.getInstance().getWebDriver().switchTo().alert();
                alert.sendKeys(String.format(LOGIN_KEYS_FORMAT, username, Keys.TAB, password));
                alert.accept();
            }
        }
    }

    /**
     * Sets the login status flag.
     *
     * @param status login status to be set.
     */
    public static void setLoginStatus(final boolean status) {
        loginStatus = status;
    }

    /**
     * Gets the login status.
     *
     * @return true if there is a user session already logged, false otherwise.
     */
    public static boolean getLoginStatus() {
        return loginStatus;
    }

    /**
     * Performs login actions as a independent thread.
     */
    private static class RobotLoginActions implements Runnable {

        private String username;
        private String password;

        /**
         * Initializes an instance of {@link RobotLoginActions}.
         *
         * @param username username to be used in login actions.
         * @param password password to be used in login actions.
         */
        RobotLoginActions(final String username, final String password) {
            this.username = username;
            this.password = password;
        }

        /**
         * {@inheritDoc}
         */
        @Override
        public void run() {
            RobotUtils.loginWithCredentials(username, password);
        }
    }

    /**
     * Executes the login actions.
     *
     * @param portalWeb         portal web parameter.
     * @param environmentConfig environment config.
     */
    public static void executeLoginActions(final PortalWeb portalWeb, final EnvironmentConfigDto environmentConfig) {
        ILoginPage loginPage = LoginFactory.createLoginPage(portalWeb);
        loginPage.loginUserInPortal(environmentConfig.getUsername(), environmentConfig.getPassword(),
                environmentConfig.getBaseLoginUrl());
        setLoginStatus(true);
    }

    /**
     * Does the login in the portal according the parameters.
     *
     * @param homePage          home page value.
     * @param portalWeb         portal web value.
     * @param environmentConfig environment config values.
     */
    public static void loginToReactWeb(final ReactHomePage homePage, final PortalWeb portalWeb,
                                       final EnvironmentConfigDto environmentConfig) {
        if (getLoginStatus()) {
            if (!homePage.isUserLogin(environmentConfig.getUsername())) {
                CommonActions.resetWebDriver();
                executeLoginActions(portalWeb, environmentConfig);
            }
        } else {
            executeLoginActions(portalWeb, environmentConfig);
        }
    }
}
