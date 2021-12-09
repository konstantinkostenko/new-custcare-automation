package idt.custcare.ui.driver;

import idt.custcare.ui.config.UiConfig;
import idt.custcare.ui.utils.PathUtils;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.CapabilityType;

import java.util.HashMap;
import java.util.Map;

/**
 * Initializes an instance of a Chrome web driver.
 */
public class ChromeBrowser implements Browser {
    private static final String DOWNLOAD_PATH = PathUtils.getAbsolutePath("custcare-ui/src/main/resources/download");
    private static final String PROFILE_DEFAULT_CONTENT_SETTINGS_POPUPS = "profile.default_content_settings.popups";
    private static final String DOWNLOAD_DEFAULT_DIRECTORY = "download.default_directory";
    private static final String ALLOW_INSECURE_LOCALHOST = "--allow-insecure-localhost";
    private static final String ALLOW_RUNNING_INSECURE_CONTENT= "--allow-running-insecure-content";
    private static final String IGNORE_CERTIFICATE_ERRORS = "--ignore-certificate-errors";
    private static final String PREFS = "prefs";
    private static final boolean TRUE = true;
    private static final int PROFILE_CDE = 0;

    private ChromeOptions options;

    /**
     * Initializes an instance of {@link ChromeBrowser}.
     */
    public ChromeBrowser() {
        options = buildChromeOptions();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public WebDriver getDriver() {
        WebDriverManager.chromedriver().version(UiConfig.getInstance().getChromeDriverVersion()).setup();
        return new ChromeDriver(options);
    }

    /**
     * Build Chrome options.
     *
     * @return chrome objects object.
     */
    private ChromeOptions buildChromeOptions() {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.setExperimentalOption(PREFS, getPrefsMap());
        chromeOptions.setCapability(CapabilityType.ACCEPT_SSL_CERTS, TRUE);
        chromeOptions.setCapability(ChromeOptions.CAPABILITY, chromeOptions);
        chromeOptions.addArguments(ALLOW_INSECURE_LOCALHOST);
        chromeOptions.addArguments(ALLOW_RUNNING_INSECURE_CONTENT);
        chromeOptions.addArguments(IGNORE_CERTIFICATE_ERRORS);
        return chromeOptions;
    }

    /**
     * Builds Chrome preferences map.
     *
     * @return Chrome preferences map.
     */
    private Map<String, Object> getPrefsMap() {
        HashMap<String, Object> chromePrefs = new HashMap<>();
        chromePrefs.put(PROFILE_DEFAULT_CONTENT_SETTINGS_POPUPS, PROFILE_CDE);
        chromePrefs.put(DOWNLOAD_DEFAULT_DIRECTORY, DOWNLOAD_PATH);
        return chromePrefs;
    }
}
