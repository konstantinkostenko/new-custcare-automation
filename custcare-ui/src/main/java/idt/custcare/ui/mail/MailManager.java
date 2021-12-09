package idt.custcare.ui.mail;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.internet.MimeBodyPart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * It is in charged to perform actions with the mail client connection.
 */
public final class MailManager {

    private static final Logger LOGGER = LogManager.getLogger(MailManager.class.getName());
    private static final String MULTIPART_CONTENT_TYPE = "multipart";
    private static final String INBOX_FOLDER = "INBOX";
    private static final boolean DELETE_FLAG = true;
    private static final boolean EXPUNGE_FLAG = true;
    private static final int FIRST_ELEMENT_INDEX = 0;
    private static final long MAX_TIME_WAIT = 250000;
    private static final long TIME_DELAY_RETRY = 2250;

    /**
     * Private constructor for {@link MailManager} utility class.
     */
    private MailManager() {
        // Default Constructor.
    }

    /**
     * Waits until mail message that matches from and subject parameters arrive.
     *
     * @param server  email server enum value.
     * @param from    mail sender name.
     * @param subject subject description message.
     * @return true if the message arrived.
     */
    public static boolean waitMessageArrive(final Mails server, final String from, final String subject) {
        Date date = new Date();
        long maxRetryTime = date.getTime() + MAX_TIME_WAIT;
        while (new Date().getTime() < maxRetryTime) {
            Message[] messages = searchMessages(server, from, subject);
            if (messages.length > 0) {
                return true;
            }
            waitRetry(TIME_DELAY_RETRY);
        }
        return false;
    }

    /**
     * Deletes all the messages in inbox mail folder.
     *
     * @param server email server enum value.
     */
    public static void deleteAllMessages(final Mails server) {
        try {
            Folder emailFolder = server.getStore().getFolder(INBOX_FOLDER);
            emailFolder.open(Folder.READ_WRITE);
            Message[] emailMessages = emailFolder.getMessages();
            for (Message message : emailMessages) {
                message.setFlag(Flags.Flag.DELETED, DELETE_FLAG);
            }
            emailFolder.close(EXPUNGE_FLAG);
        } catch (MessagingException e) {
            LOGGER.error("Messages deletion failed");
            LOGGER.error(e.getMessage());
        }
    }

    /**
     * Gets all the message body contents of an email message that matches from and subject parameters.
     *
     * @param server  email server enum value.
     * @param from    mail sender name.
     * @param subject subject description message.
     * @return list that contains the message body contents.
     */
    public static List<String> getMessageBody(final Mails server, final String from, final String subject) {
        List<String> messageContents = new ArrayList<>();
        try {
            Message[] matchMessages = searchMessages(server, from, subject);
            if (matchMessages.length > 0) {
                messageContents.add((String) matchMessages[0].getContent());
            }
        } catch (MessagingException e) {
            LOGGER.error("Error when trying to retrieve attachments from mail message");
            LOGGER.error(e.getMessage());
        } catch (IOException e) {
            LOGGER.error("Error when trying to write attachment from mail message");
        }
        return messageContents;
    }

    /**
     * Searches for a specific mail message that matches form and subject parameters.
     *
     * @param server  email server enum value.
     * @param from    mail sender name.
     * @param subject subject description message.
     * @return messages array.
     */
    private static Message[] searchMessages(final Mails server, final String from, final String subject) {
        try {
            Folder emailFolder = server.getStore().getFolder(INBOX_FOLDER);
            emailFolder.open(Folder.READ_ONLY);
            CustomSearchTerm searchTerm = new CustomSearchTerm(from, subject);
            return emailFolder.search(searchTerm);
        } catch (MessagingException e) {
            LOGGER.error("Error when trying to filter mail messages");
            LOGGER.error(e.getMessage());
        }
        return new Message[0];
    }

    /**
     * Delays a fixed time before retrying to verify the arrival of mail message.
     *
     * @param timeDelay time delay in milliseconds.
     */
    private static void waitRetry(final long timeDelay) {
        try {
            TimeUnit.MILLISECONDS.sleep(timeDelay);
        } catch (InterruptedException e) {
            LOGGER.error("Wait retry thread interrupted");
        }
    }

    /**
     * Downloads the attachments of mail that matches sender and subject parameters.
     *
     * @param server  email server enum value.
     * @param from    mail sender name.
     * @param subject subject description message.
     * @param path    download folder path.
     * @return list that contains the downloaded filenames.
     */
    public static List<String> downloadAttachments(final Mails server, final String from, final String subject,
                                                   final String path) {
        List<String> filenames = new ArrayList<>();
        try {
            List<Multipart> multiParts = searchMultiParts(server, from, subject);
            if (!multiParts.isEmpty()) {
                filenames = downloadMessageAttachments(multiParts.get(FIRST_ELEMENT_INDEX), path);
            }
        } catch (MessagingException e) {
            LOGGER.error("Error when trying to retrieve attachments from mail message");
            LOGGER.error(e.getMessage());
        } catch (IOException e) {
            LOGGER.error("Error when trying to write attachment from mail message");
        }
        return filenames;
    }

    /**
     * Downloads the attachments of specific mail message object.
     *
     * @param multipart mail messages objects.
     * @param path      download folder path.
     * @return list that contains the downloaded filenames of specific message.
     * @throws MessagingException throws when mail download produces a mail message error.
     * @throws IOException        throws when a mail download produces failed or interrupted output operations.
     */
    private static List<String> downloadMessageAttachments(final Multipart multipart, final String path)
            throws MessagingException, IOException {
        List<String> filenames = new ArrayList<>();
        for (int index = 0; index < multipart.getCount(); index++) {
            Part part = multipart.getBodyPart(index);
            if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
                MimeBodyPart mimePart = (MimeBodyPart) part;
                filenames.add(mimePart.getFileName());
                mimePart.saveFile(path.concat(part.getFileName()));
            }
        }
        return filenames;
    }

    /**
     * Search multipart messages in the mail inbox folder that matches from and subject parameters.
     *
     * @param server  email server enum value.
     * @param from    mail sender name.
     * @param subject subject description message.
     * @return list of multipart objects.
     */
    private static List<Multipart> searchMultiParts(final Mails server, final String from, final String subject) {
        List<Multipart> multiParts = new ArrayList<>();
        try {
            Message[] matchMessages = searchMessages(server, from, subject);
            for (Message message : matchMessages) {
                String contentType = message.getContentType();
                if (contentType.contains(MULTIPART_CONTENT_TYPE)) {
                    multiParts.add((Multipart) message.getContent());
                }
            }
        } catch (MessagingException e) {
            LOGGER.error("Error when trying to filter mail multiParts");
            LOGGER.error(e.getMessage());
        } catch (IOException e) {
            LOGGER.error("Error when trying to get content type from mail message");
            LOGGER.error(e.getMessage());
        }
        return multiParts;
    }
}
