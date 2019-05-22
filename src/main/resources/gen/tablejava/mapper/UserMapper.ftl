package ${packageName}.mapper;

import ${packageName}.domain.dto.param.${table.javaName}Param;
import ${packageName}.domain.dto.result.${table.javaName}Result;
import ${packageName}.domain.entity.${table.javaName};
import ${packageName}.common.base.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ${table.tableName} ${table.tableComment} Mapper
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@Mapper
public interface ${table.javaName}Mapper extends BaseMapper<${table.javaName}, ${table.javaName}Param> {

    // #####################以下为自动生成的基础模板代码############################################################

    /**
     * 基础模板 取得符合条件的 ${table.tableName} 的记录个数
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 列表数量
     */
    Long getListCount(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得符合条件的 ${table.tableName} 列表手动分页
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return ${table.javaName}列表
     */
    List<${table.javaName}Result> getListPage(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得符合条件的 ${table.tableName} 列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return ${table.javaName}列表
     */
    List<${table.javaName}Result> getList(${table.javaName}Param ${table.javaNameLow}Param);

    // ^^^^^^^^^^^^^^^^^^^^^以上为自动生成的基础模板代码^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

}
