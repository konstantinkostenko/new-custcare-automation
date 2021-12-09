package idt.custcare.ui.hooks;

import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.automation.TestUtils;

/**
 * It is in charge to define the skip test scenario actions.
 */
public class SkipHook {

    private static final Logger LOGGER = LogManager.getLogger(SkipHook.class.getName());
    private static final String SKIPPED_MSG = "The scenario '%s'";
    private static final int FIRST_EXECUTION_ORDER_VALUE = 0;

    /**
     * Skips the test scenario.
     *
     * @param scenario cucumber test scenario.
     */
    @Before(value = "@skipTest", order = FIRST_EXECUTION_ORDER_VALUE)
    public void skipScenario(final Scenario scenario) {
        LOGGER.info(String.format(SKIPPED_MSG, scenario.getName()));
        TestUtils.skipCucumberScenario(String.format(SKIPPED_MSG, scenario.getName()));
    }
}
