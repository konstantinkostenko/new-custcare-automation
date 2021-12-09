package idt.custcare.ui.utils;

import java.io.File;
import java.util.regex.Matcher;

/**
 * Performs operations to config data.
 */
public final class PathUtils {
    private static final String CURRENT_DIRECTORY = ".";
    private static final String PATH_REGEX = ".+[/\\\\]custcare-[\\w]{1,7}[/\\\\]\\.$";
    private static final String REPLACE_REGEX = "custcare-[\\w]{1,7}[/\\\\]\\.$";
    private static final String PATH_WINDOWS_REGEX = "^[A-Z]:\\\\.*";
    private static final String EMPTY_STRING = "";
    private static final String SLASH = "/";
    private static final String BACK_SLASH = "\\";
    private static final String REPLACE_DOT_REGEX = "\\.$";

    /**
     * Private constructor.
     */
    private PathUtils() {
    }

    /**
     * Gets the current absolute path of the working directory.
     *
     * @param path as String.
     * @return current absolute path.
     */
    public static String getAbsolutePath(final String path) {
        String currentPath = new File(CURRENT_DIRECTORY).getAbsolutePath();
        String relativePath = currentPath.matches(PATH_REGEX)
                ? currentPath.replaceAll(REPLACE_REGEX, EMPTY_STRING).concat(path)
                : currentPath.replaceAll(REPLACE_DOT_REGEX, EMPTY_STRING).concat(path);
        return relativePath.matches(PATH_WINDOWS_REGEX)
                ? relativePath.replaceAll(SLASH, Matcher.quoteReplacement(BACK_SLASH)) : relativePath;
    }
}
