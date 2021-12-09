package idt.custcare.ui.utils;

import java.util.Random;

/**
 * This class includes common functions.
 */
public final class UtilityFunctions {

    /**
     * Get the random number of specified length.
     *
     * @param length Length of number as Integer
     * @return returns random number as String
     */
    public static String getRandomNumberString(final String length) {
        String maxNumber = "";
        for (int i = 0; i < Integer.parseInt(length); i++) {
            maxNumber += String.valueOf(9);
        }

        Random random = new Random();
        int number = random.nextInt(Integer.parseInt(maxNumber));
        return String.format("%06d", number);
    }
}
