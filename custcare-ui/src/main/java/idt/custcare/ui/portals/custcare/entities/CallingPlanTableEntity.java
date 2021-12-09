package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Calling Plan details.
 */
public class CallingPlanTableEntity extends BaseEntity {
    private String planTitle;
    private String planDescription;
    private String startingDate;
    private String planStatus;
    private String enrollmentStatus;
    private String autoRenewText;
    private String restrictedMessage;
    private String planNote;

    public CallingPlanTableEntity() {
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    public String getPlanDescription() {
        return planDescription;
    }

    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }

    public String getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(String startingDate) {
        this.startingDate = startingDate;
    }

    public String getPlanStatus() {
        return planStatus;
    }

    public void setPlanStatus(String planStatus) {
        this.planStatus = planStatus;
    }

    public String getEnrollmentStatus() {
        return enrollmentStatus;
    }

    public void setEnrollmentStatus(String enrollmentStatus) {
        this.enrollmentStatus = enrollmentStatus;
    }

    public String getAutoRenewText() {
        return autoRenewText;
    }

    public void setAutoRenewText(String autoRenewText) {
        this.autoRenewText = autoRenewText;
    }

    public String getRestrictedMessage() {
        return restrictedMessage;
    }

    public void setRestrictedMessage(String restrictedMessage) {
        this.restrictedMessage = restrictedMessage;
    }

    public String getPlanNote() {
        return planNote;
    }

    public void setPlanNote(String planNote) {
        this.planNote = planNote;
    }
}
