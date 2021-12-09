package idt.custcare.ui.mail;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.search.SearchTerm;

/**
 * It is in charged to perform a search in a mail folder based in from and subject terms.
 */
public class CustomSearchTerm extends SearchTerm {

    private static final Logger LOGGER = LogManager.getLogger(CustomSearchTerm.class.getName());
    private static final int FIRST_SENDER_INDEX = 0;

    private String from;
    private String subject;

    /**
     * Initializes an instance of {@link CustomSearchTerm}.
     *
     * @param from    mail sender name.
     * @param subject subject description message.
     */
    public CustomSearchTerm(final String from, final String subject) {
        this.from = from;
        this.subject = subject;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean match(final Message message) {
        try {
            final String sender = message.getFrom()[FIRST_SENDER_INDEX].toString();
            return message.getSubject().equals(subject) && sender.equals(from);
        } catch (MessagingException ex) {
            LOGGER.error("Error when try to get mail sender and subject");
            LOGGER.error(ex.getMessage());
        }
        return false;
    }
}
