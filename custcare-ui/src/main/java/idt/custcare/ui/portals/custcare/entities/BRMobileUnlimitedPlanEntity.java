package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;
/**
 * This class describes the BRMobileUnlimitedPlanEntity details.
 */
public class BRMobileUnlimitedPlanEntity extends BaseEntity {
    private String planTitle;
    private String planDescription;
    private String startDate;
    private String planStatus;
    private String enrollmentStatus;
    private String autoRenewText;
    private String restrictedMessage;
    private String planNote;
    private String endDate;

    /**
     * Gets the plan title.
     * @return String
     */
    public String getPlanTitle() {
        return planTitle;
    }

    /**
     * Sets the plan title.
     * @param planTitle as String
     */
    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    /**
     * gets the plan description.
     * @return String
     */
    public String getPlanDescription() {
        return planDescription;
    }

    /**
     * sets the plan description.
     * @param planDescription as String
     */
    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }

    /**
     * gets the starting date.
     * @return String
     */
    public String getStartingDate() {
        return startDate;
    }

    /**
     * sets the starting date.
     * @param startingDate as String
     */
    public void setStartingDate(String startingDate) {
        this.startDate = startingDate;
    }

    /**
     * gets the plan status.
     * @return String
     */
    public String getPlanStatus() {
        return planStatus;
    }

    /**
     * sets the plan status.
     * @param planStatus String
     */
    public void setPlanStatus(String planStatus) {
        this.planStatus = planStatus;
    }

    /**
     * gets the enrollment status.
     * @return String
     */
    public String getEnrollmentStatus() {
        return enrollmentStatus;
    }

    /**
     * sets the enrollment status
     * @param enrollmentStatus as String
     */
    public void setEnrollmentStatus(String enrollmentStatus) {
        this.enrollmentStatus = enrollmentStatus;
    }

    /**
     * gets the auto renew text.
     * @return String
     */
    public String getAutoRenewText() {
        return autoRenewText;
    }

    /**
     * sets the auto renew text.
     * @param autoRenewText as String
     */
    public void setAutoRenewText(String autoRenewText) {
        this.autoRenewText = autoRenewText;
    }

    /**
     * gets the restricted message.
     * @return String
     */
    public String getRestrictedMessage() {
        return restrictedMessage;
    }

    /**
     * sets the restricted message.
     * @param restrictedMessage as String
     */
    public void setRestrictedMessage(String restrictedMessage) {
        this.restrictedMessage = restrictedMessage;
    }

    /**
     * gets the plan note.
     * @return String
     */
    public String getPlanNote() {
        return planNote;
    }

    /**
     * sets the plan note.
     * @param planNote as String
     */
    public void setPlanNote(String planNote) {
        this.planNote = planNote;
    }

    /**
     * gets the end date.
     * @return String
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * sets the end date.
     * @param endDate as String
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
