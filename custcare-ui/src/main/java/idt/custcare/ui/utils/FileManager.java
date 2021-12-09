package idt.custcare.ui.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Performs different action with files.
 */
public final class FileManager {
    private static final Logger LOGGER = LogManager.getLogger(FileManager.class.getName());
    private static final String ENCODING = "UTF-8";
    private static final String FILE_EDITED_MSG = "File '%s' edited successfully";

    /**
     * Private constructor for {@link FileManager} utility class.
     */
    private FileManager() {
    }

    /**
     * Gets the text from a file.
     *
     * @param filePath as String.
     * @return text contained in the file as a List of Strings.
     */
    public static List<String> getFileText(final String filePath) {
        Path path = Paths.get(filePath);
        List<String> fileText = new ArrayList<>();
        try {
            fileText = Files.readAllLines(path.toAbsolutePath());
        } catch (IOException e) {
            LOGGER.error("Error when trying reading file.");
            LOGGER.error(e.getMessage());
        }
        return fileText;
    }

    /**
     * Writes a file based in the list of Strings.
     *
     * @param filePath    as String.
     * @param fileContent as a List of Strings.
     */
    public static void writeFile(final String filePath, final List<String> fileContent) {
        try {
            File file = new File(PathUtils.getAbsolutePath(filePath));
            FileUtils.writeLines(file, ENCODING, fileContent);
            LOGGER.info(String.format(FILE_EDITED_MSG, filePath));
        } catch (IOException e) {
            LOGGER.error("Error in file writing");
            LOGGER.error(e.getMessage());
        }
    }

    /**
     * Deletes a file inside a directory.
     *
     * @param filePath as String..
     */
    public static void deleteFile(final String filePath) {
        Path path = Paths.get(filePath);
        try {
            Files.delete(path.toAbsolutePath());
        } catch (IOException e) {
            LOGGER.error("Error when trying to delete file.");
            LOGGER.error(e.getMessage());
        }
    }

    /**
     * Extracts a pattern from a file name.
     *
     * @param filePath  as String.
     * @param pattern   as String.
     * @param extension as String.
     * @return a pattern extracted from the file name.
     */
    public static String extractPatternFromFileWithExtension(final String filePath, final String pattern,
                                                             final String extension) {
        String filteredFiles = getFileNamesWithExtension(filePath, extension);
        String sequenceNumber = "";
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(filteredFiles);
        if (m.find()) {
            sequenceNumber = m.group().replaceAll("\\D", "");
        }
        return sequenceNumber;
    }

    /**
     * Gets file names with a specific extension.
     *
     * @param filePath  as String.
     * @param extension as String.
     * @return file name joined as String.
     */
    private static String getFileNamesWithExtension(final String filePath, final String extension) {
        List<String> fileNames = new ArrayList<>();
        waitForFile(filePath);
        Path path = Paths.get(PathUtils.getAbsolutePath(filePath));
        try (Stream<Path> files = Files.list(path)) {
            fileNames = files.map(Path::getFileName).map(Path::toString).collect(Collectors.toList());
        } catch (IOException e) {
            LOGGER.error("Path doesn't exist.");
            LOGGER.error(e.getMessage());
        }
        return fileNames.stream().filter(e -> e.contains(extension)).collect(Collectors.joining());
    }

    /**
     * Gets all the files a directory has.
     *
     * @param filePath as String.
     * @return a Stream of Paths that represents the paths of all files in the directory.
     */
    private static Stream<Path> getListOfFiles(final String filePath) {
        Path path = Paths.get(PathUtils.getAbsolutePath(filePath));
        try {
            return Files.list(path);
        } catch (IOException e) {
            LOGGER.error("Path doesn't exist.");
            LOGGER.error(e.getMessage());
        }
        return null;
    }

    /**
     * Method waits until file download gets completed.
     *
     * @param filePath as String.
     */
    private static void waitForFile(final String filePath) {
        int maxTries = 20;
        do {
            maxTries--;
            retry();
        } while (Objects.requireNonNull(getListOfFiles(filePath)).count() <= 2 && maxTries <= 20);
    }

    /**
     * Sleeps for one second before search for a file inside a directory.
     */
    private static void retry() {
        try {
            TimeUnit.SECONDS.sleep(1);
        } catch (InterruptedException e) {
            LOGGER.error("Error executing Thread.");
            LOGGER.error(e.getMessage());
            Thread.currentThread().interrupt();
        }
    }
}
