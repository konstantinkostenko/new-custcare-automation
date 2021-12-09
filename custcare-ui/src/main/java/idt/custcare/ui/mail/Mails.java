package idt.custcare.ui.mail;


import idt.custcare.ui.config.EnvironmentManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import java.util.Objects;
import java.util.Properties;

/**
 * Mail servers enum for SVP services.
 */
public enum Mails {
    PRIMARY("PRIMARY"),
    SECONDARY("SECONDARY");

    private static final Logger LOGGER = LogManager.getLogger(Mails.class.getName());
    private static final String MAIL_POP3_HOST = "mail.pop3.host";
    private static final String MAIL_POP3_PORT = "mail.pop3.port";
    private static final String MAIL_POP3_SOCKET_FACTORY_CLASS = "mail.pop3.socketFactory.class";
    private static final String MAIL_POP3_SOCKET_FACTORY_FALLBACK = "mail.pop3.socketFactory.fallback";
    private static final String MAIL_POP3_SOCKET_FACTORY_PORT = "mail.pop3.socketFactory.port";
    private static final String MAIL_PROTOCOL = "pop3";
    private static final String JAVAX_NET_SSL_SOCKET_FACTORY = "javax.net.ssl.SSLSocketFactory";
    private static final String FALSE_PROPERTY = "false";

    private String name;
    private Conn conn;
    private Store store;

    /**
     * Initializes an instance of {@link Mails}.
     *
     * @param name mail client name.
     */
    Mails(final String name) {
        this.name = name;
        conn = getConfig();
    }

    /**
     * Gets mail client store.
     *
     * @return mail client store.
     */
    public Store getStore() {
        if (Objects.isNull(store)) {
            connect();
        }
        return store;
    }

    /**
     * Disconnects email client.
     */
    public void disconnect() {
        if (!Objects.isNull(store)) {
            try {
                store.close();
                store = null;
            } catch (MessagingException e) {
                LOGGER.error("Mail client disconnection error");
                LOGGER.error(e.getMessage());
            }
        }
    }

    /**
     * Connects mail client.
     */
    private void connect() {
        try {
            Session session = Session.getDefaultInstance(setMailProperties(conn));
            store = session.getStore(MAIL_PROTOCOL);
            store.connect(conn.getUser(), conn.getPass());
        } catch (MessagingException e) {
            LOGGER.error("Mail client connection error");
            LOGGER.error(e.getMessage());
        }
    }

    /**
     * Sets the mail client properties.
     *
     * @param conn email conn enum value.
     * @return established properties according de conn parameter.
     */
    private Properties setMailProperties(final Conn conn) {
        Properties properties = new Properties();
        properties.put(MAIL_POP3_HOST, conn.getHost());
        properties.put(MAIL_POP3_PORT, String.valueOf(conn.getPort()));
        properties.setProperty(MAIL_POP3_SOCKET_FACTORY_CLASS, JAVAX_NET_SSL_SOCKET_FACTORY);
        properties.setProperty(MAIL_POP3_SOCKET_FACTORY_FALLBACK, FALSE_PROPERTY);
        properties.setProperty(MAIL_POP3_SOCKET_FACTORY_PORT, String.valueOf(conn.getPort()));
        return properties;
    }

    /**
     * Gets mail configuration from environment.
     *
     * @return mail configuration.
     */
    private Conn getConfig() {
        return EnvironmentManager.getInstance().getMails().stream().filter(mail -> mail.getName().equals(name))
                .findFirst().orElse(new Conn());
    }
}
