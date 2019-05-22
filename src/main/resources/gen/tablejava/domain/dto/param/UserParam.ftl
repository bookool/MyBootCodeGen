package ${packageName}.domain.dto.param;

import ${packageName}.domain.dto.BaseParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * ${table.tableName} ${table.tableComment} 参数传输对象
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ${table.javaName}Param extends BaseParam {

<#list table.columns as column>
    /**
    * ${column.colComment}
    */
    private ${column.colJavaType} ${column.javaName};

</#list>

}
