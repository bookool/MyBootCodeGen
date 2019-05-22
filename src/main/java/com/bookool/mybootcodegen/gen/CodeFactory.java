package com.bookool.mybootcodegen.gen;

import freemarker.template.*;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import static freemarker.template.Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS;

/**
 * 代码生成
 *
 * @author Tommy
 */
public class CodeFactory {
    public static final String ROOT_PATH = "rootPath";
    public static final String AUTHOR = "author";
    public static final String PACKAGE_NAME = "packageName";
    public static final String DB_URL = "dbUrl";
    public static final String DB_USERNAME = "dbUsername";
    public static final String DB_PASSWORD = "dbPassword";
    public static final String DB_NAME = "dbName";
    public static final String TABLE_PREFIX = "tablePrefix";

    static Map<String, String> javaSqlTypeTransferMap;

    private static Properties prop;
    Connection connection = null;

    static {
    }

    public void gen(String[] args) {
        if (args.length == 0) {
            System.out.println("生成完整项目：");
            System.out.println("java -jar MyBootCodeGen.jar [配置文件名]");
            System.out.println("生成单张表相关：");
            System.out.println("java -jar MyBootCodeGen.jar [配置文件名] [表名]");
            return;
        }
        String pName = args[0];
        String tName = null;
        if (args.length == 2) {
            tName = args[1];
        }
        javaSqlTypeTransferMap = new HashMap<>();
        javaSqlTypeTransferMap.put("int", "java.lang.Integer");
        javaSqlTypeTransferMap.put("varchar", "java.lang.String");
        javaSqlTypeTransferMap.put("char", "java.lang.String");
        javaSqlTypeTransferMap.put("decimal", "java.math.BigDecimal");
        javaSqlTypeTransferMap.put("datetime", "java.util.Date");
        javaSqlTypeTransferMap.put("timestamp", "java.util.Date");
        javaSqlTypeTransferMap.put("text", "java.lang.String");
        javaSqlTypeTransferMap.put("tinyint", "java.lang.Integer");
        javaSqlTypeTransferMap.put("longtext", "java.lang.String");
        javaSqlTypeTransferMap.put("bigint", "java.lang.Long");
        javaSqlTypeTransferMap.put("mediumtext", "java.lang.String");
        javaSqlTypeTransferMap.put("smallint", "java.lang.Integer");
        javaSqlTypeTransferMap.put("float", "java.lang.Float");
        javaSqlTypeTransferMap.put("double", "java.lang.Double");

        prop = new Properties();

        System.out.println("读取配置文件：" + pName);
        if (tName != null) {
            System.out.println("生成单张表相关：" + tName);
        }
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(pName));
            prop.load(bufferedReader);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }
        if (tName == null) {
            // 建立完整的项目
            File file = new File(prop.getProperty(ROOT_PATH));
            if (file.exists()) {
                File[] fs = file.listFiles();
                if (fs != null && fs.length > 0) {
                    System.out.println("建立完整项目，但是目录不为空！");
                    return;
                }
            }
            // 生成项目通用文件
            genCommonJava();
            // 生成表相关文件
            genTableJava(null);
        } else {
            // 生成表相关文件
            genTableJava(tName);
        }

    }

    private void genTableJava(String genTableName) {
        try {
            String dbUrl = prop.getProperty(DB_URL);
            String dbUsername = prop.getProperty(DB_USERNAME);
            String dbPassword = prop.getProperty(DB_PASSWORD);
            String dbName = prop.getProperty(DB_NAME);
            connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(
                    "SELECT DISTINCT TABLE_NAME " +
                            "FROM INFORMATION_SCHEMA.COLUMNS " +
                            "WHERE table_schema = '" + dbName + "'");
            String prefix = prop.getProperty(TABLE_PREFIX);
            while (resultSet.next()) {
                String tableName = resultSet.getString("TABLE_NAME");
                if (genTableName == null ||
                        genTableName.equals(tableName)) {
                    String javaName;
                    if (StringUtils.isNotBlank(prefix)) {
                        int i = tableName.indexOf(prefix);
                        if (i > -1) {
                            javaName = tableName.substring(i + 1);
                        } else {
                            javaName = tableName;
                        }
                    } else {
                        javaName = tableName;
                    }
                    javaName = nameUtils.camelCaseNameUp(javaName);
                    String javaNameLow = javaName.substring(0, 1).toLowerCase() + javaName.substring(1);
                    Table table = new Table(connection, dbName, tableName, javaName, javaNameLow);

                    // *** entity ***
                    String pathHead = "domain"
                            + File.separatorChar
                            + "entity"
                            + File.separatorChar;
                    Gener gener = new Gener(prop,
                            pathHead + table.getJavaName() + ".java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "User.ftl");

                    // *** param ***
                    pathHead = "domain"
                            + File.separatorChar
                            + "dto"
                            + File.separatorChar
                            + "param"
                            + File.separatorChar;
                    gener = new Gener(prop,
                            pathHead + table.getJavaName() + "Param.java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "UserParam.ftl");

                    // *** result ***
                    pathHead = "domain"
                            + File.separatorChar
                            + "dto"
                            + File.separatorChar
                            + "result"
                            + File.separatorChar;
                    gener = new Gener(prop,
                            pathHead + table.getJavaName() + "Result.java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "UserResult.ftl");

                    // *** mapper ***
                    pathHead = "mapper"
                            + File.separatorChar;
                    gener = new Gener(prop,
                            pathHead + table.getJavaName() + "Mapper.java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "UserMapper.ftl");

                    // *** service ***
                    pathHead = "service"
                            + File.separatorChar;
                    gener = new Gener(prop,
                            pathHead + table.getJavaName() + "Service.java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "UserService.ftl");

                    // *** service impl***
                    pathHead = "service"
                            + File.separatorChar
                            + "impl"
                            + File.separatorChar;
                    gener = new Gener(prop,
                            pathHead + table.getJavaName() + "ServiceImpl.java", table);
                    pathHead = "tablejava" + File.separatorChar + pathHead;
                    genOne(gener, pathHead + "UserServiceImpl.ftl");

                    // *** mapper xml***
                    String[] zstrs = prop.getProperty(PACKAGE_NAME).split("\\.");
                    StringBuilder zb = new StringBuilder().append(File.separatorChar)
                            .append("src").append(File.separatorChar)
                            .append("main").append(File.separatorChar)
                            .append("resources").append(File.separatorChar);
                    for (String zstr : zstrs) {
                        zb.append(zstr).append(File.separatorChar);
                    }
                    zb.append("mapper").append(File.separatorChar)
                            .append(table.getJavaName())
                            .append("Mapper.xml");
                    gener = new Gener(prop, zb.toString(), table);
                    pathHead = "resources" + File.separatorChar + "UserMapper.ftl";
                    genOne(gener, pathHead);

                }
            }

            resultSet.close();
            st.close();
            connection.close();
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

    // 生成通用的项目文件
    private void genCommonJava() {
        File f = new File(this.getClass().getName());
        String pathRoot = f.getAbsolutePath();
        pathRoot = pathRoot.substring(0, pathRoot.lastIndexOf(File.separatorChar))
                + File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "gen";
        String commonJavaPath = pathRoot + File.separatorChar + "commonjava";
        List<File> filesList = new ArrayList<>();
        initSetFile(filesList, new File(commonJavaPath));
        for (File file : filesList) {
            try {
//                System.out.println("getAbsolutePath:" + file.getAbsolutePath());
//                System.out.println("getCanonicalPath:" + file.getCanonicalPath());
//                System.out.println("getName:" + file.getName());
//                System.out.println("getParent:" + file.getParent());
//                System.out.println("getPath:" + file.getPath());
//                System.out.println("-----");
                int rootNum = commonJavaPath.length() + 1;
                String pathHead;
                if (rootNum < file.getParent().length()) {
                    pathHead = file.getParent().substring(rootNum) + File.separatorChar;
                } else {
                    pathHead = "";
                }
                String fileName = file.getName();
                rootNum = fileName.indexOf('.');
                if (rootNum > -1) {
                    fileName = fileName.substring(0, rootNum);
                }
                Gener gener = new Gener(prop, pathHead + fileName + ".java", null);
                genOne(gener, File.separatorChar + "commonjava" + File.separatorChar + pathHead + fileName + ".ftl");
            } catch (Exception e) {
                //
            }
        }

        Map<String, String> map = new HashMap<>();
        String packageName = prop.getProperty(PACKAGE_NAME);
        int i = packageName.lastIndexOf('.');
        String groupId = packageName.substring(0, i);
        String artifactId = packageName.substring(i + 1);
        map.put("groupId", groupId);
        map.put("artifactId", artifactId);
        map.put("dbUrl", prop.getProperty(DB_URL));
        map.put("dbUserName", prop.getProperty(DB_USERNAME));
        map.put("dbPassword", prop.getProperty(DB_PASSWORD));

        String otherPath = File.separatorChar + "pomxml" + File.separatorChar + "pom.ftl";
        String pathHead = File.separatorChar + "pom.xml";
        Gener gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

        otherPath = File.separatorChar + "resources"
                + File.separatorChar + "application.ftl";
        pathHead = File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "application.yml";
        gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

        otherPath = File.separatorChar + "resources"
                + File.separatorChar + "application-develop.ftl";
        pathHead = File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "application-develop.yml";
        gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

        otherPath = File.separatorChar + "resources"
                + File.separatorChar + "application-production.ftl";
        pathHead = File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "application-production.yml";
        gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

        otherPath = File.separatorChar + "resources"
                + File.separatorChar + "logback-boot-develop.ftl";
        pathHead = File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "logback-boot-develop.xml";
        gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

        otherPath = File.separatorChar + "resources"
                + File.separatorChar + "logback-boot-production.ftl";
        pathHead = File.separatorChar + "src"
                + File.separatorChar + "main"
                + File.separatorChar + "resources"
                + File.separatorChar + "logback-boot-production.xml";
        gener = new Gener(prop, pathHead, null);
        gener.setTempMap(map);
        genOne(gener, otherPath);

    }

    // 遍历目录
    private void initSetFile(List<File> listFile, File file) {
        File[] files = file.listFiles();
        if (files == null) {
            return;
        }
        for (File liFile : files) {
            if (liFile.isDirectory()) {
                initSetFile(listFile, liFile);
            } else if (liFile.isFile()) {
                listFile.add(liFile);
            }
        }
    }

    //根据一个模板生成一个目标文件
    private void genOne(Gener gener, String templateName) {
        try {
            Template template = this.getTemplateCfg().getTemplate(templateName, Locale.CHINESE, "UTF-8");
            template.setOutputEncoding("UTF-8");
            File file = new File(gener.getFilePath());
            if (file.exists()) {
                String tempPath = gener.getFilePath();
                String exName = tempPath.substring(tempPath.lastIndexOf("."));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                tempPath = gener.getFilePath() + "." + sdf.format(new Date()) + exName;
                file = new File(tempPath);
                while (file.exists()) {
                    Thread.sleep(1);
                    tempPath = gener.getFilePath() + "." + sdf.format(new Date()) + exName;
                    file = new File(tempPath + "." + sdf.format(new Date()));
                }
                gener.setFilePath(tempPath);
            }
            File fp = file.getParentFile();
            if (!fp.exists()) {
                if (!fp.mkdirs()) {
                    throw new RuntimeException(fp.getAbsolutePath() + " 文件创建失败！");
                }
            }
            FileOutputStream fileoutput = new FileOutputStream(new File(gener.getFilePath()));
            Writer writer = new OutputStreamWriter(fileoutput, StandardCharsets.UTF_8);
            template.process(gener, writer);
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Configuration getTemplateCfg() {
        // Initialize configuration;
        Configuration cfg = new Configuration(DEFAULT_INCOMPATIBLE_IMPROVEMENTS);

        try {
            File f = new File(this.getClass().getName());
            String path = f.getAbsolutePath();
            path = path.substring(0, path.lastIndexOf(File.separatorChar))
                    + File.separatorChar + "src"
                    + File.separatorChar + "main"
                    + File.separatorChar + "resources"
                    + File.separatorChar + "gen";
            cfg.setDirectoryForTemplateLoading(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        cfg.setTemplateUpdateDelayMilliseconds(0);
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        //Use beans wrapper (recommmended for most applications)
        //cfg.setObjectWrapper(ObjectWrapper.BEANS_WRAPPER);
        cfg.setObjectWrapper(new DefaultObjectWrapper(DEFAULT_INCOMPATIBLE_IMPROVEMENTS));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setEncoding(Locale.CHINESE, "UTF-8");
        //charset of the output
        cfg.setOutputEncoding("UTF-8");
        //default locale
        cfg.setLocale(Locale.CHINESE);
        return cfg;
    }

}
