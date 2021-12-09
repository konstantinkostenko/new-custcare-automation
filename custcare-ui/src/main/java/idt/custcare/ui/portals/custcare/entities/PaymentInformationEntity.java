package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Payment Information Form as Entity.
 */
public class PaymentInformationEntity extends BaseEntity {
    private String allowMultipleUse;
    private String autoRecharge;
    private String threshold;
    private String amount;
    private String minDays;
    private String midCallRecharge;
    private String rechargePolicy;
    private String paymentType;
    private String bankAccountNumber;
    private String bankRoutingNumber;
    private String bankAccountType;
    private String addressLine1;
    private String firstName;
    private String lastName;
    private String city;
    private String state;
    private String zipCode;

    /**
     * Gets the AllowMultipleUse on Payment Information Page.
     * @return returns AllowMultipleUSe as String
     */
    public String getAllowMultipleUse() {
        return allowMultipleUse;
    }

    /**
     * sets the AllowMultipleUse field on Payment Information Page.
     * @param allowMultipleUse
     */
    public void setAllowMultipleUse(String allowMultipleUse) {
        this.allowMultipleUse = allowMultipleUse;
    }

    /**
     * Gets AutoRecharge field on Payment Information Page.
     * @return AutoRecharge field value on Payment Information Page.
     */
    public String getAutoRecharge() {
        return autoRecharge;
    }

    /**
     * Sets AutoRecharge field value on Payment Information Page.
     * @param autoRecharge AutoRecharge value as String
     */
    public void setAutoRecharge(String autoRecharge) {
        this.autoRecharge = autoRecharge;
    }

    /**
     * Gets Threshold field value on Payment Information Page.
     * @return returns Threshold field value as String
     */
    public String getThreshold() {
        return threshold;
    }

    /**
     * Sets the Threshold field value on Payment Information Page.
     * @param threshold as String
     */
    public void setThreshold(String threshold) {
        this.threshold = threshold;
    }

    /**
     * Gets Amount field value on Payment Information Page.
     * @return Amount as String
     */
    public String getAmount() {
        return amount;
    }

    /**
     * Sets Amount field value on Payment Information Page.
     * @param amount as String
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * gets min day field value on Payment Information Page.
     * @return min day field value as String.
     */
    public String getMinDays() {
        return minDays;
    }

    /**
     * sets min day field value on Payment Information Page.
     * @param minDays as String
     */
    public void setMinDays(String minDays) {
        this.minDays = minDays;
    }

    /**
     * gets mid call recharge field value on Payment Information Page.
     * @return midcall recharge as String
     */
    public String getMidCallRecharge() {
        return midCallRecharge;
    }

    /**
     * sets midcall recharge value on Payment Information Page.
     * @param midCallRecharge as String
     */
    public void setMidCallRecharge(String midCallRecharge) {
        this.midCallRecharge = midCallRecharge;
    }

    /**
     * gets recharge policy field value on Payment Information Page.
     * @return recharge policy value as String.
     */
    public String getRechargePolicy() {
        return rechargePolicy;
    }

    /**
     * sets recharge policy field value on Payment Information Page.
     * @param rechargePolicy as String
     */
    public void setRechargePolicy(String rechargePolicy) {
        this.rechargePolicy = rechargePolicy;
    }

    /**
     * gets payment type field value on Payment Information Page.
     * @return payment type as String
     */
    public String getPaymentType() {
        return paymentType;
    }

    /**
     * sets payment type field value on Payment Information Page.
     * @param paymentType as String
     */
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    /**
     * gets bank account number field value on Payment Information Page.
     * @return bank account number as String
     */
    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    /**
     * sets bank account number field value on Payment Information Page.
     * @param bankAccountNumber as String
     */
    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    /**
     * Gets bank routing number field value on Payment Information Page.
     * @return bank routing number as String
     */
    public String getBankRoutingNumber() {
        return bankRoutingNumber;
    }

    /**
     * sets bank routing number field value on Payment Information Page.
     * @param bankRoutingNumber as String
     */
    public void setBankRoutingNumber(String bankRoutingNumber) {
        this.bankRoutingNumber = bankRoutingNumber;
    }

    /**
     * gets bank account type field value on Payment Information Page.
     * @return bank account type as String
     */
    public String getBankAccountType() {
        return bankAccountType;
    }

    /**
     * sets bank account type field value on Payment Information Page.
     * @param bankAccountType as String
     */
    public void setBankAccountType(String bankAccountType) {
        this.bankAccountType = bankAccountType;
    }

    /**
     * gets address line 1 field value on Payment Information Page.
     * @return address line 1 as String
     */
    public String getAddressLine1() {
        return addressLine1;
    }

    /**
     * sets address line 1 field value on Payment Information Page.
     * @param addressLine1 as String
     */
    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    /**
     * gets the first name field value on Payment Information Page.
     * @return first name as String
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * sets the first name on Payment Information Page.
     * @param firstName as String
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * gets the last name on Payment Information Page.
     * @return last name as String
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * sets the last name on Payment Information Page.
     * @param lastName as String
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * gets the city field value on Payment Information Page.
     * @return city field value as String
     */
    public String getCity() {
        return city;
    }

    /**
     * sets the city field value on Payment Information Page.
     * @param city as String
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * gets the state field value on Payment Information Page.
     * @return State field value as String.
     */
    public String getState() {
        return state;
    }

    /**
     * sets the state field value on Payment Information Page.
     * @param state as String.
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * gets the zipcode field value on Payment Information Page.
     * @return zip code as String.
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * sets the zip code field value on Payment Information Page.
     * @param zipCode as String.
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}
