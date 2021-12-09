package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Current Min Balance Section details of Account Info Page.
 */
public class CurrentMinBalanceTableEntity extends BaseEntity {
    private String minutesBalance;
    private String planName;
    private String expiredDate;
    private String cash;
    private String promo;
    private String currentBalance;

    /**
     * gets the minutes balance.
     * @return String
     */
    public String getMinutesBalance() {
        return minutesBalance;
    }

    /**
     * sets the minutes balance
     * @param minutesBalance as String
     */
    public void setMinutesBalance(String minutesBalance) {
        this.minutesBalance = minutesBalance;
    }

    /**
     * gets the plan name.
     * @return String
     */
    public String getPlanName() {
        return planName;
    }

    /**
     * sets the plan name
     * @param planName as String
     */
    public void setPlanName(String planName) {
        this.planName = planName;
    }

    /**
     * gets the expired date.
     * @return String
     */
    public String getExpiredDate() {
        return expiredDate;
    }

    /**
     * sets the expired date.
     * @param expiredDate as String
     */
    public void setExpiredDate(String expiredDate) {
        this.expiredDate = expiredDate;
    }

    /**
     * gets the cash.
     * @return String
     */
    public String getCash() {
        return cash;
    }

    /**
     * sets the cash.
     * @param cash as String
     */
    public void setCash(String cash) {
        this.cash = cash;
    }

    /**
     * gets the promo
     * @return as String
     */
    public String getPromo() {
        return promo;
    }

    /**
     * sets the promo
     * @param promo as String
     */
    public void setPromo(String promo) {
        this.promo = promo;
    }

    /**
     * gets the current balance
     * @return String
     */
    public String getCurrentBalance() {
        return currentBalance;
    }

    /**
     * sets the current balance.
     * @param currentBalance
     */
    public void setCurrentBalance(String currentBalance) {
        this.currentBalance = currentBalance;
    }
}
