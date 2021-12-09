package idt.custcare.ui.utils;

import idt.custcare.ui.utils.constants.DateFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

/**
 * Contains useful methods to use while performing different operations.
 */
public final class DateUtils {
    private static final Logger LOGGER = LogManager.getLogger(CommonActions.class.getSimpleName());
    /**
     * Private Constructor.
     */
    private DateUtils() {
    }

    /**
     * Gets a current date in a specified format.
     *
     * @param format as DateFormat enum type.
     * @return formatted current date.
     */
    public static String getCurrentDate(final DateFormat format) {
        LocalDateTime now = LocalDateTime.now();
        return now.format(DateTimeFormatter.ofPattern(format.toString()));
    }

    /**
     * Gets the Date from specified date string
     * @param dateString as String
     * @param dateFormat specified format
     * @return
     */
    public static Date getDateFromString(final String dateString, final String dateFormat) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(dateFormat, Locale.ENGLISH);
            System.out.println("DATE : " + formatter.parse(dateString));
            return formatter.parse(dateString);
        } catch (ParseException parseException) {
            LOGGER.warn(parseException.getMessage());
            return null;
        }
    }
}
