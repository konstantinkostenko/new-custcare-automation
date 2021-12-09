package idt.custcare.ui.utils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * It is in charge to perform actions with generated files.
 */
public final class FileUtils {

    private static final Logger LOGGER = LogManager.getLogger(FileUtils.class.getName());
    private static final String ENCODING = "UTF-8";
    private static final String GIT_IGNORE_FILE = ".gitignore";
    private static final String SUCCESSFUL_FILE_DELETE_MSG = "File '%s' deleted successfully";
    private static final String UNSUCCESSFUL_FILE_DELETE_MSG = "File '%s' has not been deleted successfully";

    /**
     * Private constructor for {@link FileUtils} utility class.
     */
    private FileUtils() {
        // Default constructor.
    }

    /**
     * Reads a file and return all the lines as a list of Strings.
     *
     * @param filePath filename partial path.
     * @return file content as list of Strings.
     */
    public static List<String> readFile(final String filePath) {
        try {
            File file = new File(filePath);
            return org.apache.commons.io.FileUtils.readLines(file, ENCODING);
        } catch (IOException e) {
            LOGGER.error("Error in file reading");
            LOGGER.error(e.getMessage());
        }
        return new ArrayList<>();
    }

    /**
     * Deletes all the files in a specific absolute path.
     *
     * @param folder folder partial path.
     */
    public static void deleteDirFiles(final String folder) {
        File[] files = getDirectoryFiles(folder);
        if (!Objects.isNull(files)) {
            deleteDirectoryFiles(files);
        }
    }

    /**
     * Deletes an array of files.
     *
     * @param files array of file objects.
     */
    private static void deleteDirectoryFiles(final File[] files) {
        for (File file : files) {
            String filename = file.getName();
            if (!file.getName().equalsIgnoreCase(GIT_IGNORE_FILE)) {
                LOGGER.info(file.delete()
                        ? String.format(SUCCESSFUL_FILE_DELETE_MSG, filename)
                        : String.format(UNSUCCESSFUL_FILE_DELETE_MSG, filename));
            }
        }
    }

    /**
     * Gets files of specific directory as an array of File objects.
     *
     * @param folder partial folder path String.
     * @return file array.
     */
    private static File[] getDirectoryFiles(final String folder) {
        File directory = new File(folder);
        return directory.listFiles();
    }
}
