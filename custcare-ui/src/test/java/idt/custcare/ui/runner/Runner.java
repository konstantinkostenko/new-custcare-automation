package idt.custcare.ui.runner;

import idt.custcare.ui.driver.DriverManager;
import io.cucumber.junit.Cucumber;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.junit.runner.RunWith;
import org.testng.annotations.AfterTest;

import java.util.Objects;

/**
 * Executes the features.
 */
@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty", "com.epam.reportportal.cucumber.ScenarioReporter"},
        monochrome = true,
        features = {"src/test/resources/features/"},
        glue = {"idt.custcare.ui"})

public class Runner extends AbstractTestNGCucumberTests {

    /**
     * Quits the Web Driver instance.
     */
    @AfterTest
    public void quitWebDriver() {
        if (!Objects.isNull(DriverManager.getInstance().getWebDriver())) {
            DriverManager.getInstance().quitDriver();
        }
    }
}
