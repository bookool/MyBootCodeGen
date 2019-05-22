package ${packageName}.common.token.user;

/**
 * 是否验证 Token 枚举
 * 在 TokenVerify 注解中使用
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public enum ActionEnum {

    /**
     * 可以跳过Token验证
     */
    SKIP,

    /**
     * 必须验证Token
     */
    VERIFY

}
