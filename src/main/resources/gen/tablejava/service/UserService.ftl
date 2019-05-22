package ${packageName}.service;

import ${packageName}.common.base.fastpageresult.FastPageList;
import ${packageName}.common.base.pageresult.PageList;
import ${packageName}.common.exception.response.ResponseException;
import ${packageName}.domain.dto.param.${table.javaName}Param;
import ${packageName}.domain.dto.result.${table.javaName}Result;

import java.util.Date;
import java.util.List;

/**
 * ${table.javaName}Service ${table.tableComment} Service
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${table.javaName}Service {

    // #####################以下为自动生成的基础模板代码############################################################

    /**
     * 基础模板 取得符合条件的记录个数
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 符合条件的记录个数
     */
    long getListCount(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得符合条件的记录列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 符合条件的记录列表
     */
    List<${table.javaName}Result> getList(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得 ${table.javaName} 分页列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 分页列表对象
     */
    PageList<${table.javaName}Result> getListPageByCustom(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得 ${table.javaName} 分页列表，通过 PageHelper
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 分页列表对象
     */
    PageList<${table.javaName}Result> getListPageByPageHelper(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 取得 ${table.javaName} 快速更新分页列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 分页列表对象
     */
    FastPageList<${table.javaName}Result> getListFastPage(${table.javaName}Param ${table.javaNameLow}Param);

    /**
     * 基础模板 添加 ${table.javaName}
     * 本项目不使用数据库自增字段，因此避免使用任何与自增相关的方法
     * 本项目必须使用snowflakeId生产全局ID
     * 此方法自动生成 id、gmtCreate、gmtModified
     * 传入的添加对象应该确保 id、gmtCreate、gmtModified 为空
     *
     * @${table.javaNameLow}Param 要添加的对象
     * @return 影响行数
     * @throws ResponseException 传递异常
     */
    int insertSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException;

    /**
     * 基础模板 添加 ${table.javaName}
     * 本项目不使用数据库自增字段，因此避免使用任何与自增相关的方法
     * 本项目必须使用snowflakeId生产全局ID
     * 此方法要求传入主键 id 值，自动生成 gmtCreate、gmtModified
     * 使用场景：对于某类信息的扩展表，主键id和主表的id保持一致，则不用生成id，直接拿主表id值来添加
     * 传入的添加对象应该确保 id 有值，gmtCreate、gmtModified 为空
     *
     * @${table.javaNameLow}Param 要添加的对象
     * @return 影响行数
     * @throws ResponseException 传递异常
     */
    int insertWithIdSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException;

    /**
     * 基础模板 编辑 ${table.javaName} 利用Weekend传递条件参数，此处传主键id
     * 这是一个例子，主要是演示Weekend条件用法，具体业务请仿照此例子添加新方法
     *
     * @${table.javaNameLow}Param 要更新的记录
     * @param id    要更新的主键id值
     * @return 数据库执行完毕影响的行数
     * @throws ResponseException 传递异常
     */
    int updateSelective(${table.javaName}Param ${table.javaNameLow}Param, long id) throws ResponseException;

    /**
     * 基础模板 编辑 ${table.javaName} 通过主键id，id直接包含在传参对象内
     *
     * @${table.javaNameLow}Param 要更新的记录
     * @return 数据库执行完毕影响的行数
     * @throws ResponseException 传递异常
     */
    int updateByIdSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException;

    // ^^^^^^^^^^^^^^^^^^^^^以上为自动生成的基础模板代码^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

}
