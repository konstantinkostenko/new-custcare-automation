package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Billing History details.
 */
public class BillingHistoryEntity extends BaseEntity {
    private String cost;
    private String duration;
    private String details;
    private String discountPlan;
    private String transactionType;
    private String description;
    private String amount;
    private String dateTime;
    private String user;

    /**
     * Gets the cost value from billing history row.
     * @return cost as String
     */
    public String getCost() {
        return this.cost;
    }

    /**
     * sets the cost in billing history row.
     * @param costValue  cost value to set.
     */
    public void setCost(final String costValue) {
        this.cost = costValue;
    }

    /**
     * gets the duration billing history row.
     * @return durationValue duration value as String.
     */
    public String getDuration() {
        return this.duration;
    }

    /**
     * sets the duration in billing history row.
     * @param durationValue duration value as String
     */
    public void setDuration(final String durationValue) {
        this.duration = durationValue;
    }

    /**
     * Gets the details from billing history row.
     * @return details as String
     */
    public String getDetails() {
        return this.details;
    }

    /**
     * sets the details in billing history row.
     * @param detailsValue detailsValue as String
     */
    public void setDetails(final String detailsValue) {
        this.details = detailsValue;
    }

    /**
     * gets the discount plan in billing history row.
     * @return discountPlan as String
     */
    public String getDiscountPlan() {
        return this.discountPlan;
    }

    /**
     * sets the discountPlan in billing history row.
     * @param discountPlanValue discountPlanValue as String.
     */
    public void setDiscountPlan(final String discountPlanValue) {
        this.discountPlan = discountPlanValue;
    }

    /**
     * gets the transaction type.
     * @return String
     */
    public String getTransactionType() {
        return transactionType;
    }

    /**
     * sets the transaction type.
     * @param transactionType as String
     */
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    /**
     * gets the description.
     * @return String
     */
    public String getDescription() {
        return description;
    }

    /**
     * sets the description.
     * @param description as String
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * gets the amount.
     * @return String
     */
    public String getAmount() {
        return amount;
    }

    /**
     * sets the amount.
     * @param amount as String
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * gets the datetime.
     * @return String
     */
    public String getDateTime() {
        return dateTime;
    }

    /**
     * sets the datetime.
     * @param dateTime as String
     */
    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    /**
     * gets the user.
     * @return String
     */
    public String getUser() {
        return user;
    }

    /**
     * sets the user.
     * @param user as String
     */
    public void setUser(String user) {
        this.user = user;
    }
}
