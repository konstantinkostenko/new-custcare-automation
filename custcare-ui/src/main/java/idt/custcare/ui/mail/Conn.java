package idt.custcare.ui.mail;

/**
 * It is in charged to group remote client connection common attributes.
 */
public class Conn {

    private String name;
    private String host;
    private String port;
    private String user;
    private String pass;

    /**
     * Gets connection name.
     *
     * @return connection name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets connection name.
     *
     * @param name connection name to be set.
     */
    public void setName(final String name) {
        this.name = name;
    }

    /**
     * Gets host url.
     *
     * @return host url.
     */
    public String getHost() {
        return host;
    }

    /**
     * Sets host url.
     *
     * @param host host url to be set.
     */
    public void setHost(final String host) {
        this.host = host;
    }

    /**
     * Gets port number.
     *
     * @return port number.
     */
    public String getPort() {
        return port;
    }

    /**
     * Sets port number.
     *
     * @param port port number to be set.
     */
    public void setPort(final String port) {
        this.port = port;
    }

    /**
     * Gets username.
     *
     * @return username.
     */
    public String getUser() {
        return user;
    }

    /**
     * Sets username.
     *
     * @param user username to be set.
     */
    public void setUser(final String user) {
        this.user = user;
    }

    /**
     * Gets user's password.
     *
     * @return user's password.
     */
    public String getPass() {
        return pass;
    }

    /**
     * Sets user's password.
     *
     * @param pass user's password.
     */
    public void setPass(final String pass) {
        this.pass = pass;
    }
}
