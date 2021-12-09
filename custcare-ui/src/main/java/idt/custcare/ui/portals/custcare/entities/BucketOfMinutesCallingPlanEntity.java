package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Bucket Of Minutes Calling Entity details.
 */
public class BucketOfMinutesCallingPlanEntity extends BaseEntity {
    private String planTitle;
    private String planDescription;
    private String startDate;
    private String planStatus;
    private String enrollmentStatus;
    private String endDate;

    /**
     * Returns plan title
     * @return String
     */
    public String getPlanTitle() {
        return planTitle;
    }

    /**
     * sets the plan title
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
     * gets the start date.
     * @return String
     */
    public String getStartDate() {
        return this.startDate;
    }

    /**
     * sets the start date
     * @param startDate as String
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
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
     * @param planStatus as String
     */
    public void setPlanStatus(String planStatus) {
        this.planStatus = planStatus;
    }

    /**
     * gets the entrollment status.
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
     * gets the end date
     * @return String
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * sets the end date
     * @param endDate as String
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
