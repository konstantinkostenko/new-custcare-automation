package idt.custcare.ui.stepdefinitions;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import idt.custcare.ui.mail.MailManager;
import idt.custcare.ui.mail.Mails;
import idt.custcare.ui.utils.MailUtils;
import idt.custcare.ui.utils.PathUtils;

import java.util.List;

import static org.testng.Assert.assertTrue;

/**
 * It is in charge to define the step definitions related to Mail client actions.
 */
public class MailSteps {
    private static final String EMAIL_ERROR_MSG = "Email from '%s' and subject '%s' did not arrive.";
    private List<String> attachmentNames;
    private String from;
    private String subject;

    /**
     * Asserts the arrival of incoming email according to 'from', 'subject' and 'sever' feature parameters.
     *
     * @param from    mail sender name.
     * @param subject subject description message.
     * @param server  email server enum value.
     */
    @Then("^Incoming mail from \"([^\"]*)\" with \"([^\"]*)\" subject should arrive to \"([^\"]*)\" mail$")
    public void incomingMailFromWithSubjectShouldArriveEmail(final String from, final String subject,
                                                             final Mails server) {
        this.from = from;
        this.subject = subject;
        assertTrue(MailManager.waitMessageArrive(server, from, subject),
                String.format(EMAIL_ERROR_MSG, from, subject));
    }

    /**
     * Asserts that arrived mail body contains the expected value.
     *
     * @param server   email server enum value.
     * @param filename file name value.
     */
    @Then("^Arrived mail to \"([^\"]*)\" should contain \"([^\"]*)\" value in body$")
    public void mailBodyShouldContainBatchFilename(final Mails server, final String filename) {
        List<String> messageContent = MailManager.getMessageBody(server, from, subject);
        assertTrue(MailUtils.messageBodyContainsTerm(messageContent, filename));
    }

    /**
     * Downloads the attachments of mail according to 'from', 'subject' and 'sever' feature parameters.
     *
     * @param from    mail sender name.
     * @param subject subject description message.
     * @param server  email server enum value.
     */
    @When("^I download attachments of mail from \"([^\"]*)\" with \"([^\"]*)\" subject in \"([^\"]*)\"$")
    public void iDownloadAttachmentsOfMailFromWithSubject(final String from, final String subject,
                                                          final Mails server) {
        String downloadPath = "custcare-ui/src/test/resources/attachments/";
        attachmentNames = MailManager.downloadAttachments(server, from, subject,
                PathUtils.getAbsolutePath(downloadPath));
    }

    /**
     * Asserts the attached file of the arrived email with the value of the filename.
     *
     * @param fileName file name value.
     */
    @Then("^Arrived mail should contain \"([^\"]*)\" file attached$")
    public void arrivedMailShouldContainFileAttached(final String fileName) {
        assertTrue(attachmentNames.contains(fileName));
    }
}
