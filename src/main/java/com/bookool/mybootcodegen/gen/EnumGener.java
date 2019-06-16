package com.bookool.mybootcodegen.gen;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 枚举对象
 *
 * @author Tommy
 */
@Data
public class EnumGener {
    private String enumName;
    private Column column;
    private List<String> enumList;

    public EnumGener(Column column) {
        this.column = column;
        this.enumName = NameUtils.camelCaseNameUp(column.getColName());
        this.enumList = new ArrayList<>();
        Pattern pattern = Pattern.compile("(\\d+)\\-([a-zA-Z0-9_\\u4e00-\\u9fa5]+)");
        Matcher matcher = pattern.matcher(column.getColComment());
        while (matcher.find()) {
            String enumString = "    /**\n" +
                    "     * " + matcher.group(2) + "\n" +
                    "     */\n" +
                    "    // TODO 修改枚举名称\n" +
                    "    // " + matcher.group(2) + "("  + matcher.group(1) +  ", \"" + matcher.group(2) + "\"),";
            enumList.add(enumString);
        }
    }
}
