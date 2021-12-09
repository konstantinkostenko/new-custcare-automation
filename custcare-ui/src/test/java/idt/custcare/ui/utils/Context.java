package idt.custcare.ui.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Storage which save data and used for pass data between steps, will clear after each scenario.
 */
public final class Context {
    private static Context instance;
    private Map<String, Object> storage;

    /**
     * Private Constructor for Context Class.
     */
    private Context() {
        storage = new HashMap<>();
    }

    /**
     * Gets the Current Instance of Context Class.
     *
     * @return Returns Context class instance
     */
    public static Context getInstance() {
        if (instance == null) {
            instance = new Context();
        }
        return instance;
    }

    /**
     * Add the key value pair in  storage of Context current instance.
     *
     * @param key   Key to be use to store value in storage
     * @param value value to set
     */
    public void add(final String key, final Object value) {
        storage.put(key, value);
    }

    /**
     * Returns the value to which the specified key is mapped in storage of Current Context.
     *
     * @param key key
     * @return Returns value as Object
     */
    public Object get(final String key) {
        return storage.get(key);
    }

    /**
     * Deletes the value to which the specified key is mapped.
     *
     * @param key key
     */
    public void delete(final String key) {
        storage.remove(key);
    }

    /**
     * Clears the storage of current context.
     */
    public void clear() {
        storage.clear();
    }
}
