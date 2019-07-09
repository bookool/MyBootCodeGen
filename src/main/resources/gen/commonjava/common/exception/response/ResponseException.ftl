package ${packageName}.common.exception.response;

import ${packageName}.common.enums.response.base.ResponseEnum;

/**
 * 业务操作异常
 * 配合 ${packageName}.common.enums.response 中的枚举使用
 * 一般在 service 中的 impl 中抛出
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public class ResponseException extends Exception {

    private ResponseEnum responseEnum;

    public ResponseEnum getResponseEnum() {
        return this.responseEnum;
    }

    public ResponseException(ResponseEnum responseEnum) {
        super(responseEnum.getMessage());
        this.responseEnum = responseEnum;
    }

}
