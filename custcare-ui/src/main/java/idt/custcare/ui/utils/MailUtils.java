package idt.custcare.ui.utils;

import java.util.List;

/**
 * It is in charged to perform actions and retrieve data from mail messages.
 */
public final class MailUtils {

    /**
     * Private constructor for {@link MailUtils} utility class.
     */
    private MailUtils() {
        // Default Constructor.
    }

    /**
     * Verifies if mail message body contains a specific term.
     *
     * @param messageContent complete mail message content.
     * @param term           term that is going to be verified in the body.
     * @return true if the term is contained in the mail message content.
     */
    public static boolean messageBodyContainsTerm(final List<String> messageContent, final String term) {
        for (String body : messageContent) {
            if (body.contains(term)) {
                return true;
            }
        }
        return false;
    }
}
