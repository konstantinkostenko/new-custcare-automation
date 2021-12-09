package idt.custcare.ui.utils.constants;

/**
 * Represents different formats to choice when parsing a date.
 */
public enum DateFormat {
    YYYYMMDD("yyyyMMdd");

    private final String format;

    /**
     * Constructor.
     *
     * @param format as String.
     */
    DateFormat(final String format) {
        this.format = format;
    }

    /**
     * {@inheritDoc}.
     */
    @Override
    public String toString() {
        return format;
    }
}
