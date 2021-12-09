package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.Given;
import idt.custcare.ui.base.login.PortalWeb;
import idt.custcare.ui.base.login.UserTypes;
import idt.custcare.ui.config.EnvironmentManager;
import idt.custcare.ui.portals.custcare.dto.EnvironmentConfigDto;
import idt.custcare.ui.portals.custcare.pages.ReactHomePage;
import idt.custcare.ui.utils.LoginUtils;

/**
 * Contains steps definition methods for login pages.
 */
public class LoginSteps {
    private EnvironmentConfigDto environmentConfig;
    private ReactHomePage reactHomePage;

    /**
     * Initializes an instance of {@link LoginSteps}.
     *
     * @param environmentConfig as EnvironmentConfigDto type.
     */
    public LoginSteps(final EnvironmentConfigDto environmentConfig) {
        this.environmentConfig = environmentConfig;
    }

    /**
     * Configures Portal and User data according received values.
     *
     * @param portalWeb the portal web name.
     * @param userType  the user type name.
     */
    private void configureEnvironment(final PortalWeb portalWeb, final UserTypes userType) {
        EnvironmentManager environmentManager = EnvironmentManager.getInstance();
        environmentManager.configureEnvironmentSettings(portalWeb, userType);
        environmentConfig.setPortal(portalWeb.toString());
        environmentConfig.setBaseLoginUrl(environmentManager.getBaseLoginUrl());
        environmentConfig.setUserType(userType.toString());
        environmentConfig.setUsername(environmentManager.getUsername());
        environmentConfig.setPassword(environmentManager.getPassword());
    }

    /**
     * Logs a user in a React app.
     *
     * @param portalWeb the portal web to logs the user.
     * @param userType  the user type that will login in the portal.
     */
    @Given("^I login to (.*) application with (.*) credentials$")
    public void loginToReactAppWithCredentials(final PortalWeb portalWeb, final UserTypes userType) {
        configureEnvironment(portalWeb, userType);
        reactHomePage = new ReactHomePage();
        LoginUtils.loginToReactWeb(reactHomePage, portalWeb, environmentConfig);
    }
}
