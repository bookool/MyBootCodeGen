package com.bookool.mybootcodegen.gen;

import lombok.Data;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.Map;
import java.util.Properties;

/**
 * 生成器对象
 *
 * @author Tommy
 */
@Data
public class Gener {

    private String packageName;

    private String author;

    private String filePath;

    private Map<String, String> tempMap;

    private Table table;

    private EnumGener enumGener;

    Gener(@NotNull Properties prop, String fileName, Table table) {
        this.packageName = prop.getProperty(CodeFactory.PACKAGE_NAME);
        this.author = prop.getProperty(CodeFactory.AUTHOR);
        if (File.separator.equals(fileName.substring(0, 1))) {
            this.filePath = prop.getProperty(CodeFactory.ROOT_PATH) + fileName;
        } else {
            String zpath = prop.getProperty(CodeFactory.ROOT_PATH) +
                    File.separatorChar + "src" +
                    File.separatorChar + "main" +
                    File.separatorChar + "java" + File.separatorChar;
            String[] zstrs = this.packageName.split("\\.");
            StringBuilder zb = new StringBuilder(zpath);
            for (String zstr : zstrs) {
                zb.append(zstr).append(File.separatorChar);
            }
            zb.append(fileName);
            this.filePath = zb.toString();
        }
        this.table = table;
    }

}
