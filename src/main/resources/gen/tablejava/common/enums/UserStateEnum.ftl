package ${packageName}.common.enums;

import com.ccgx360.crm.common.base.CommonEnum;
import org.jetbrains.annotations.Contract;

import java.util.HashMap;
import java.util.Map;

/**
 * 枚举：${enumGener.column.colComment}
 * ${table.tableName} ${table.tableComment}
 * ${enumGener.column.colName} ${enumGener.column.colComment}
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public enum ${enumGener.enumName}Enum implements CommonEnum<Integer> {
    <#list enumGener.enumList as enum>
${enum}

    </#list>

    private final Integer code;

    private final String message;

    ${enumGener.enumName}Enum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    /**
     * 取得枚举代码
     *
     * @return 枚举代码
     */
    @Contract(pure = true)
    @Override
    public Integer code() {
        return code;
    }

    /**
     * 取得枚举信息
     *
     * @return 枚举信息
     */
    @Contract(pure = true)
    @Override
    public String message() {
        return message;
    }

    private static final Map<Integer, ${enumGener.enumName}Enum> LOOKUP_MAP = new HashMap<>();

    static {
        for (${enumGener.enumName}Enum e : ${enumGener.enumName}Enum.values()) {
            LOOKUP_MAP.put(e.code, e);
        }
    }

    /**
     * 通过枚举代码取得枚举
     *
     * @param code 枚举代码
     * @return 枚举
     */
    public static ${enumGener.enumName}Enum getEnumByCode(Integer code) {
        return LOOKUP_MAP.get(code);
    }

    /**
     * 通过枚举代码取得枚举信息
     *
     * @param code 枚举代码
     * @return 枚举信息
     */
    public static String getMessateByCode(Integer code) {
        return LOOKUP_MAP.get(code).message;
    }

}
