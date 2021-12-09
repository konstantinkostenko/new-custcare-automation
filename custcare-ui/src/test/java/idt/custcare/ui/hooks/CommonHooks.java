package idt.custcare.ui.hooks;

import idt.custcare.ui.driver.DriverManager;
import idt.custcare.ui.utils.CommonActions;
import idt.custcare.ui.utils.Context;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.Given;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.SkipException;

import java.io.FileNotFoundException;
import java.util.Objects;

/**
 * Hooks used for custcare tests.
 */
public class CommonHooks {

    private static final Logger LOGGER = LoggerFactory.getLogger(CommonHooks.class);
    @Given("I add Logs to the Scenario")
    public void iAddLogsToTheScenario() {
        LOGGER.error("Error Log");
        LOGGER.debug("Debug Log");
        LOGGER.info("Info Log");
        LOGGER.trace("Trace Log");
        LOGGER.warn("Warn Log");
    }

    /**
     * Skips scenario.
     *
     * @param scenario to skip.
     */
    @Before(value = "@skipped")
    public void skip(final Scenario scenario) {
        String scenarioTitle = scenario.getName();
        if (scenarioTitle.contains("(")) {
            scenarioTitle = scenarioTitle.substring(scenarioTitle.indexOf("(") + 1);
            scenarioTitle = scenarioTitle.substring(0, scenarioTitle.indexOf(")"));
        } else {
            scenarioTitle = "skipped scenario without information";
        }
        throw new SkipException(scenarioTitle);
    }

    /**
     * Quits Web Driver after test is finish.
     */
    @After(value = "@quitWebDriverAfterTest")
    public void quitWebDriverAfterTest() {
        if (!Objects.isNull(DriverManager.getInstance().getWebDriver())) {
            CommonActions.resetWebDriver();
        }
    }

    /**
     * Runs on priority 1 and takes screenshot after scenario.
     *
     * @param scenario Scenario
     * @throws FileNotFoundException throws fileNotFoundException.
     */
    @After(order = 1)
    public void takeScreenshotAfterScenario(final Scenario scenario) throws FileNotFoundException {
        takeScreenshot(scenario);
    }

    /**
     * Clears the store.
     */
    @After(order = 0)
    public void clearStore() {
        Context.getInstance().clear();
    }

    /**
     * Takes the screenshot.
     *
     * @param scenario Scenario
     * @throws FileNotFoundException throws fileNotFoundException.
     */
    public void takeScreenshot(final Scenario scenario) throws FileNotFoundException {
        if (scenario.isFailed() && DriverManager.getInstance().getWebDriver() != null) {
            WebDriver driver = DriverManager.getInstance().getWebDriver();
            final byte[] screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot, "image/png", "Screenshot");
        }
    }
}
