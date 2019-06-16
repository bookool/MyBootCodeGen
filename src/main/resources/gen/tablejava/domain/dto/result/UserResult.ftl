package ${packageName}.domain.dto.result;

import ${packageName}.domain.dto.BaseResult;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * ${table.tableName} ${table.tableComment} 结果传输对象
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ${table.javaName}Result extends BaseResult {

// #####################以下为自动生成的代码############################################################

<#list table.columns as column>
    /**
    * ${column.colComment}
    */
    private ${column.colJavaType} ${column.javaName};

</#list>

// ^^^^^^^^^^^^^^^^^^^^^以上为自动生成的代码^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

}
