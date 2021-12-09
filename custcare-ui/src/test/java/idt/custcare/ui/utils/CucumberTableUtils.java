package idt.custcare.ui.utils;

import idt.custcare.ui.entity.BaseEntity;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.DataTableType;

import java.util.LinkedList;
import java.util.List;

/**
 * Cucumber Table Utility Class.
 */
public class CucumberTableUtils {
    /**
     * Convert DataTable to entity.
     * Convert only DataTable where first column is names of entity fields
     * Example:
     * When The following info displayed on Login page
     * | ani     | 654321 |
     * | comment | Test   |
     * <p>
     * class Comment extends BaseEntity{
     * private String ani;
     * private String comment;
     * }
     *
     * @param table  cucumber table
     * @param entity entity instance
     * @return entity instance with data from table
     */
    public static <T extends BaseEntity> T tableByFirstColumnToEntity(DataTable table, T entity) {
        for (int index = 0; index < table.height(); index++) {
            List<String> row = table.row(index);
            String fieldName = row.get(0);
            String fieldValue = row.get(1);
            entity.setFieldValue(fieldName, fieldValue);
        }
        return entity;
    }

    /**
     * Convert DataTable to list of entities where header is name of entity fields.
     * Example:
     * When The following info displayed on Login page
     * | ani        | comment         |
     * | ani value  | comment value   |
     * | ani value1 | comment value1  |
     * <p>
     * class Comment extends BaseEntity{
     * private String ani;
     * private String comment;
     * }
     *
     * @param table       cucumber table
     * @param entityClass entity type
     * @return list of entities with data from table
     */
    public static <T extends BaseEntity> List<T> tableByHeaderToEntity(DataTable table, Class<T> entityClass) {

        List<String> header = table.row(0);
        List<T> result = new LinkedList<T>();
        for (int index = 1; index < table.height(); index++) {
            T entity = getInstance(entityClass);
            List<String> currentRow = table.row(index);
            for (int columnIndex = 0; columnIndex < header.size(); columnIndex++) {
                entity.setFieldValue(header.get(columnIndex), currentRow.get(columnIndex));
            }
            result.add(entity);
        }

        return result;
    }

    public static <T extends BaseEntity> T getInstance(Class<T> entityClass) {
        try {
            return entityClass.newInstance();
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

}
