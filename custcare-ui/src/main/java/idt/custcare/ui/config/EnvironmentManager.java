package idt.custcare.ui.config;

import idt.custcare.ui.base.login.PortalWeb;
import idt.custcare.ui.base.login.UserTypes;
import idt.custcare.ui.database.DataBases;
import idt.custcare.ui.mail.Conn;
import idt.custcare.ui.utils.JsonFileReader;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

/**
 * Sets up Environment data for test execution.
 */
public final class EnvironmentManager {
    private static final String ENVIRONMENT_CONFIGURATIONS_FILE_PATH =
            "../custcare-ui/src/main/resources/Environment.json";
    private static EnvironmentManager instance = null;
    private UiConfig uiConfig;
    private JSONObject environmentConfig;
    private JSONObject portalConfig;
    private JSONObject userConfig;
    private JSONObject apiConfig;
    private List<Conn> mails;

    /**
     * Initializes an instance of {@link EnvironmentManager}.
     */
    private EnvironmentManager() {
        uiConfig = UiConfig.getInstance();
        setEnvironmentConfig();
    }

    /**
     * Initializes a singleton Environment Manager instance.
     *
     * @return singleton instance of {@link EnvironmentManager}.
     */
    public static EnvironmentManager getInstance() {
        if (Objects.isNull(instance)) {
            instance = new EnvironmentManager();
        }
        return instance;
    }

    /**
     * Configures Portal and User data according received values.
     *
     * @param portalWeb the portal web name.
     * @param userType  the user type name.
     */
    public void configureEnvironmentSettings(final PortalWeb portalWeb, final UserTypes userType) {
        setPortalConfig(portalWeb);
        setUserConfig(userType);
    }

    /**
     * Sets the global user config in a Json object.
     *
     * @param userType UserType enum value.
     */
    private void setUserConfig(final UserTypes userType) {
        userConfig = JsonFileReader.getJsonElementFromJsonArray(portalConfig, ReservedWords.USERS.val(),
                ReservedWords.TYPE.val(), userType.toString());
    }

    /**
     * Sets the global portal config in a Json object.
     *
     * @param portalName PortalWeb enum value.
     */
    private void setPortalConfig(final PortalWeb portalName) {
        portalConfig = JsonFileReader.getJsonElementFromJsonArray(environmentConfig, ReservedWords.PORTALS.val(),
                ReservedWords.NAME.val(), portalName.toString());
    }

    /**
     * Sets the global environment config in a Json object.
     */
    private void setEnvironmentConfig() {
        environmentConfig = JsonFileReader.getJsonElementFromJsonArray(
                JsonFileReader.loadJsonObjectFromFile(ENVIRONMENT_CONFIGURATIONS_FILE_PATH),
                ReservedWords.ENVIRONMENTS.val(), ReservedWords.NAME.val(), uiConfig.getEnvironment());
        setMails();
    }

    /**
     * Gets the base URL from environment config file.
     *
     * @return Base Url string.
     */
    public String getBaseUrl() {
        return (String) portalConfig.get(ReservedWords.BASE_URL.val());
    }

    /**
     * Gets the Login base URL from environment config file.
     *
     * @return Login Base Url string.
     */
    public String getBaseLoginUrl() {
        return (String) portalConfig.get(ReservedWords.BASE_LOGIN_URL.val());
    }

    /**
     * Gets the username from environment config file.
     *
     * @return username string.
     */
    public String getUsername() {
        return (String) userConfig.get(ReservedWords.USERNAME.val());
    }

    /**
     * Gets the password from environment config file.
     *
     * @return password string.
     */
    public String getPassword() {
        return (String) userConfig.get(ReservedWords.PASSWORD.val());
    }

    /**
     * Gets the ServiceUrl from environment config file.
     *
     * @return ServiceUrl string.
     */
    public String getServiceUrl() {
        return (String) apiConfig.get(ReservedWords.SERVICE_URL.val());
    }

    public String getIsWrapped(){
        return (String) apiConfig.get(ReservedWords.IS_WRAPPED.val());
    }

    /**
     * Gets configuration from a specific database from environment config file.
     *
     * @param dataBaseName the database name to get the data.
     * @return database configuration in a JSONObject.
     */
    public JSONObject getDatabaseConfig(final DataBases dataBaseName) {
        return JsonFileReader.getJsonElementFromJsonArray(environmentConfig, ReservedWords.DBs.val(),
                ReservedWords.NAME.val(), dataBaseName.toString());
    }

    /**
     * Gets mail connections list.
     *
     * @return mail connections list.
     */
    public List<Conn> getMails() {
        return mails;
    }

    /**
     * Sets mail connections list.
     */
    private void setMails() {
        List<Conn> listConn = new ArrayList<>();
        ((JSONArray) environmentConfig.get("mails")).forEach(array -> {
            HashMap<String, String> mailConn = (HashMap<String, String>) array;
            Conn conn = new Conn();
            conn.setPort(mailConn.get("port"));
            conn.setHost(mailConn.get("host"));
            conn.setName(mailConn.get("name"));
            conn.setPass(mailConn.get("pass"));
            conn.setUser(mailConn.get("user"));
            listConn.add(conn);
        });
        this.mails = listConn;
    }
}
