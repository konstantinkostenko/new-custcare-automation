package idt.custcare.ui.entity;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Base Entity Class.
 */
public abstract class BaseEntity {
    /**
     * Gets the list of Field Names.
     *
     * @return List of String as field names
     */
    public List<String> getFieldNames() {
        Field[] fields = this.getClass().getDeclaredFields();
        return Stream.of(fields).map(field -> field.getName()).collect(Collectors.toList());
    }

    /**
     * Get the value of field.
     * @param fieldName Name of field
     * @return Returns value of field as object
     */
    public Object getFieldValue(final String fieldName) {
        try {
            String nameOfField = getFieldNameInCorrectRegister(fieldName);
            Field field = this.getClass().getDeclaredField(nameOfField);
            field.setAccessible(true);
            return field.get(this);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Sets value to field using name of field.
     * @param fieldName Name of field
     * @param fieldValue Value to set in field
     */
    public void setFieldValue(final String fieldName, final Object fieldValue) {
        try {
            String nameOfField = getFieldNameInCorrectRegister(fieldName);
            Field field = this.getClass().getDeclaredField(nameOfField);
            field.setAccessible(true);
            field.set(this, fieldValue);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Gets the correct name of field in correct register.
     * @param fieldNameWithIncorrectRegister Name of field to search in correct register
     * @return returns field name as String
     */
    protected String getFieldNameInCorrectRegister(final String fieldNameWithIncorrectRegister) {
        List<String> resultList = getFieldNames().stream()
                .filter(fieldName -> fieldName.equalsIgnoreCase(fieldNameWithIncorrectRegister))
                .collect(Collectors.toList());
        return resultList.size() > 0 ? resultList.get(0) : fieldNameWithIncorrectRegister;
    }
}
