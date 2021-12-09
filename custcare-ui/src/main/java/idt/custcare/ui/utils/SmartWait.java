package idt.custcare.ui.utils;

import java.util.function.Supplier;

/**
 * This class includes smart wait functionality.
 */
public class SmartWait {

    private final static int DEFAULT_TIMEOUT_IN_SECONDS = 60;
    private final static int DEFAULT_POLLING_INTERVAL_IN_SECONDS = 2;
    private final static boolean DEFAULT_RAISE_EXCEPTION = false;
    private final static int MILLISECONDS_IN_SECONDS = 1000;

    /**
     * Wait until supplier return true(action finished correct).
     *
     * @param supplier action for execute
     * @return returns state true if action executed correct and on time
     */
    public static boolean waitUntil(Supplier<Boolean> supplier){
        return waitUntil(supplier, DEFAULT_TIMEOUT_IN_SECONDS, DEFAULT_POLLING_INTERVAL_IN_SECONDS, DEFAULT_RAISE_EXCEPTION);
    }

    /**
     * Wait until supplier return true(action finished correct).
     *
     * @param supplier action for execute
     * @param timeoutInSeconds timeout
     * @param pollingIntervalInSeconds polling Interval In Second
     * @return returns state true if action executed correct and on time
     */
    public static boolean waitUntil(Supplier<Boolean> supplier, int timeoutInSeconds, int pollingIntervalInSeconds){
        return waitUntil(supplier, timeoutInSeconds, pollingIntervalInSeconds, DEFAULT_RAISE_EXCEPTION);
    }

    /**
     * Wait until supplier return true(action finished correct).
     *
     * @param supplier action for execute
     * @param timeoutInSeconds timeout
     * @return returns state true if action executed correct and on time
     */
    public static boolean waitUntil(Supplier<Boolean> supplier, int timeoutInSeconds){
        return waitUntil(supplier, timeoutInSeconds, DEFAULT_POLLING_INTERVAL_IN_SECONDS, DEFAULT_RAISE_EXCEPTION);
    }

    /**
     * Wait until supplier return true(action finished correct).
     *
     * @param supplier action for execute
     * @param timeoutInSeconds timeout
     * @param pollingIntervalInSeconds polling Interval In Second
     * @param raiseException set true if raise exception if action finished not at time
     * @return returns state true if action executed correct and on time
     */
    public static boolean waitUntil(Supplier<Boolean> supplier, int timeoutInSeconds, int pollingIntervalInSeconds, boolean raiseException){
        int timeLeftInSeconds = 0;
        while (timeLeftInSeconds < timeoutInSeconds){
            if(catchException(supplier)){
                return true;
            }
            sleep(pollingIntervalInSeconds);
            timeLeftInSeconds += pollingIntervalInSeconds;
        }

        if(raiseException){
            throw new RuntimeException("Smart wait timeout exception");
        }

        return false;
    }

    /**
     * Catch exception return false if get exception, true if not
     *
     * @param supplier action for execute (must be return true if finished correct)
     * @return return false if get exception, true if not
     */
    private static boolean catchException(Supplier<Boolean> supplier){
        try {
            return supplier.get();
        }catch (Exception error){
            return false;
        }
    }


    /**
     * Sleep thread
     *
     * @param seconds value in seconds for sleep
     */
    private static void sleep(int seconds){
        try {
            Thread.sleep(seconds * MILLISECONDS_IN_SECONDS);
        } catch (Exception error){
            throw new RuntimeException(error);
        }
    }
}
