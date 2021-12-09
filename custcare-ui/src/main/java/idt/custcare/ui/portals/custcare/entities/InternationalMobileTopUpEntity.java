package idt.custcare.ui.portals.custcare.entities;

import idt.custcare.ui.entity.BaseEntity;

/**
 * This class describes the International Mobile Top Up details.
 */
public class InternationalMobileTopUpEntity extends BaseEntity {
    private String topUpPin;
    private String telephoneTopUpPin;
    private String carrierCountry;

    /**
     *  Gets the Top Up Pin.
     * @return Top Up Pin as String.
     */
    public String getTopUpPin() {
        return topUpPin;
    }

    /**
     * sets the Top Up Pin.
     * @param topUpPin as String
     */
    public void setTopUpPin(String topUpPin) {
        this.topUpPin = topUpPin;
    }

    /**
     * gets the Telephone Top Up Pin as String.
     * @return Telephone Top Up Pin as String
     */
    public String getTelephoneTopUpPin() {
        return telephoneTopUpPin;
    }

    /**
     * sets the Telephone Top Up Pin as String.
     * @param telephoneTopUpPin as String
     */
    public void setTelephoneTopUpPin(String telephoneTopUpPin) {
        this.telephoneTopUpPin = telephoneTopUpPin;
    }

    /**
     * gets the carrier country as String.
     * @return Carrier Country as String
     */
    public String getCarrierCountry() {
        return carrierCountry;
    }

    /**
     * Sets the Carrier Country.
     * @param carrierCountry as String.
     */
    public void setCarrierCountry(String carrierCountry) {
        this.carrierCountry = carrierCountry;
    }
}
