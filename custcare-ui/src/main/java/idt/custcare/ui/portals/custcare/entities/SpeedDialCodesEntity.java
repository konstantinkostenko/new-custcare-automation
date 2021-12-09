package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the Speed Dial Codes as Entity.
 */
public class SpeedDialCodesEntity extends BaseEntity {
    private String phoneNumber;
    private String description;
    private String code;

    /**
     * Gets the phone number field value on Speed Dial Codes Page.
     *
     * @return phone number as String
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * sets the phone number field value on Speed Dial Codes Page.
     *
     * @param phoneNumber as String
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * gets the description field value on Speed Dial Codes Page.
     *
     * @return description as String
     */
    public String getDescription() {
        return description;
    }

    /**
     * sets the description field value on Speed Dial Codes Page.
     *
     * @param description as String
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * gets the code field value on Speed Dial Code Page.
     *
     * @return code as String
     */
    public String getCode() {
        return code;
    }

    /**
     * sets the code field value on Speed Dial Codes Page
     *
     * @param code as String
     */
    public void setCode(String code) {
        this.code = code;
    }
}
