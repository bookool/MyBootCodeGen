package com.bookool.mybootcodegen.gen;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 列对象
 *
 * @author Tommy
 */
@Data
@AllArgsConstructor
public class Column {
    private String colName;
    private String javaName;
    private String colJavaType;
    private String colDbType;
    private String colComment;
    private String isNullable;
    private Integer charMaxLength;
}
