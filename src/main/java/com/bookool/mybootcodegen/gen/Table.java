package com.bookool.mybootcodegen.gen;

import lombok.Data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 表对象
 *
 * @author Tommy
 */
@Data
public class Table {

    private String tableName;

    private String javaName;

    private String javaNameLow;

    private String tableComment;

    private List<Column> columns;

    Table(Connection connection, String dbName, String tableName, String javaName, String javaNameLow) {
        this.tableName = tableName;
        this.javaName = javaName;
        this.javaNameLow = javaNameLow;
        try {
            Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(
                    "SELECT TABLE_COMMENT " +
                        "FROM INFORMATION_SCHEMA.TABLES " +
                        "WHERE TABLE_SCHEMA = '" + dbName + "' " +
                        "AND TABLE_NAME = '" + tableName + "'");
            if (resultSet.next()) {
                this.tableComment = resultSet.getString("TABLE_COMMENT");
            }
            this.columns = new ArrayList<>();
            resultSet = st.executeQuery(
                    "SELECT DISTINCT COLUMN_NAME, DATA_TYPE, " +
                        "COLUMN_COMMENT, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH " +
                        "FROM INFORMATION_SCHEMA.COLUMNS " +
                        "WHERE TABLE_SCHEMA = '" + dbName + "' " +
                        "AND TABLE_NAME = '" + tableName + "'");
            while (resultSet.next()) {
                String columnName = resultSet.getString("COLUMN_NAME");
                if (!"id".equals(columnName) &&
                        !"gmt_create".equals(columnName) &&
                        !"gmt_modified".equals(columnName)) {
                    Integer maxLength = null;
                    try {
                        maxLength = resultSet.getInt("CHARACTER_MAXIMUM_LENGTH");
                    } catch (Exception e) {
                        //
                    }
                    String dbType = resultSet.getString("DATA_TYPE");
                    String javaType = CodeFactory.javaSqlTypeTransferMap.get(dbType);
                    Column column = new Column(columnName, NameUtils.camelCaseName(columnName),
                            javaType, dbType,
                            resultSet.getString("COLUMN_COMMENT"),
                            resultSet.getString("IS_NULLABLE"),
                            maxLength);
                    columns.add(column);
                }
            }
        } catch (Exception e) {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e1) {
                //
            }
            e.printStackTrace();
        }
    }


}
