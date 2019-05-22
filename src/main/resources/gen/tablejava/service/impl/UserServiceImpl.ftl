package ${packageName}.service.impl;

import ${packageName}.common.base.fastpageresult.FastPageList;
import ${packageName}.common.base.pageresult.BasePageList;
import ${packageName}.common.base.pageresult.PageList;
import ${packageName}.common.enums.response.base.CommonResponseEnum;
import ${packageName}.common.exception.response.ResponseException;
import ${packageName}.common.utils.CachedBeanCopier;
import ${packageName}.mapper.${table.javaName}Mapper;
import ${packageName}.domain.dto.param.${table.javaName}Param;
import ${packageName}.domain.dto.result.${table.javaName}Result;
import ${packageName}.domain.entity.${table.javaName};
import ${packageName}.service.${table.javaName}Service;

import ${packageName}.service.impl.base.FastPageListImpl;
import ${packageName}.service.impl.base.PageListImplByCustom;
import ${packageName}.service.impl.base.PageListImplByPageHelper;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.weekend.Weekend;
import tk.mybatis.mapper.weekend.WeekendCriteria;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * ${table.javaName}ServiceImpl ${table.tableComment} Service 实现
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@Service("${table.javaName}Service")
public class ${table.javaName}ServiceImpl implements ${table.javaName}Service {

    @Resource
    private ${table.javaName}Mapper ${table.javaNameLow}Mapper;

    // #####################以下为自动生成的基础模板代码############################################################

    /**
     * 基础模板 取得符合条件的记录个数
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 符合条件的记录个数
     */
    @Override
    public long getListCount(${table.javaName}Param ${table.javaNameLow}Param) {
        return ${table.javaNameLow}Mapper.getListCount(${table.javaNameLow}Param);
    }

    /**
     * 基础模板 取得符合条件的记录列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 符合条件的记录列表
     */
    @Override
    public List<${table.javaName}Result> getList(${table.javaName}Param ${table.javaNameLow}Param) {
        //虽然不分页，但必须避免请求巨大的结果集，由PAGE_SIZE_MAX限制
        ${table.javaNameLow}Param.getPageParam().setPageNum(BasePageList.PAGE_NUM_MIN);
        ${table.javaNameLow}Param.getPageParam().setPageSize(BasePageList.PAGE_SIZE_MAX);
        return ${table.javaNameLow}Mapper.getList(${table.javaNameLow}Param);
    }

    /**
     * 基础模板 取得 ${table.javaName} 分页列表
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 分页列表对象
     */
    @Override
    public PageList<${table.javaName}Result> getListPageByCustom(${table.javaName}Param ${table.javaNameLow}Param) {
        /*
         使用PageListByCustom创建分页对象，
         第一个参数：传递查询条件对象，如果需要分页，必须设置pageNum和pageSize参数；
         可以不分页，则pageNum和pageSize参数必须为空，且返回记录总数必须小于BasePageList.PAGE_SIZE_MAX，则返回符合条件的全部；
         第二个参数：设置返回符合条件记录总数的方法；
         第三个参数：设置返回符合条件列表的方法；
         上述两个方法会在PageListByCustom.Builder.builder中，根据实际需要执行。
         */
        return new PageListImplByCustom<>(${table.javaNameLow}Param,
                t -> ${table.javaNameLow}Mapper.getListCount(t),
                t -> ${table.javaNameLow}Mapper.getListPage(t));
    }

    /**
     * 基础模板 取得 ${table.javaName} 分页列表，通过 PageHelper
     *
     * @${table.javaNameLow}Param 查询条件对象
     * @return 分页列表对象
     */
    @Override
    public PageList<${table.javaName}Result> getListPageByPageHelper(${table.javaName}Param ${table.javaNameLow}Param) {
        /*
         使用PageListImplByPageHelper创建分页对象，
         第一个参数：传递查询条件对象，必须设置pageNum和pageSize参数；
         第二个参数：设置返回符合条件列表的方法；
         此方法自动调用PageHelper完成分页，并自动填充分页结果。
         */
        return new PageListImplByPageHelper<>(${table.javaNameLow}Param, t -> ${table.javaNameLow}Mapper.getList(t));
    }

    /**
    * 基础模板 取得 ${table.javaName} 快速更新分页列表
    *
    * @${table.javaNameLow}Param 查询条件对象
    * @return 分页列表对象
    */
    @Override
    public FastPageList<${table.javaName}Result> getListFastPage(${table.javaName}Param ${table.javaNameLow}Param) {
        /*
         使用FastPageListImpl创建分页对象，
         第一个参数：传递查询条件对象，必须设置roundMinId、roundMaxId和pageSize参数；
         第二个参数：设置返回符合条件列表的方法
         */
        return new FastPageListImpl<>(${table.javaNameLow}Param, t -> ${table.javaNameLow}Mapper.getList(t));
    }

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
    @Override
    public int insertSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException {
        try {
            return ${table.javaNameLow}Mapper.insertSelectiveGenerate(${table.javaNameLow}Param, ${table.javaName}.class);
        } catch (DuplicateKeyException ex) {
            throw new ResponseException(CommonResponseEnum.DATA_DUPLICATE);
        }
    }

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
    @Override
    public int insertWithIdSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException {
        try {
            return ${table.javaNameLow}Mapper.insertWithIdSelectiveGenerate(${table.javaNameLow}Param, ${table.javaName}.class);
        } catch (DuplicateKeyException ex) {
            throw new ResponseException(CommonResponseEnum.DATA_DUPLICATE);
        }
    }

    /**
    * 基础模板 编辑 ${table.javaName} 利用Weekend传递条件参数，此处传主键id
    * 这是一个例子，主要是演示Weekend条件用法，具体业务请仿照此例子添加新方法
    *
    * @${table.javaNameLow}Param 要更新的记录
    * @param id    要更新的主键id值
    * @return 数据库执行完毕影响的行数
    * @throws ResponseException 传递异常
    */
    @Override
    public int updateSelective(${table.javaName}Param ${table.javaNameLow}Param, long id) throws ResponseException {
        Weekend<${table.javaName}> weekend = new Weekend<>(${table.javaName}.class);
        WeekendCriteria<${table.javaName}, Object> criteria = weekend.weekendCriteria();
        criteria.andEqualTo(${table.javaName}::getId, id);
        /// 如果需要更复杂的带括号的逻辑条件，可以用如下方式组合条件
        /// WeekendCriteria<${table.javaName}, Object> criteria1 = weekend.createCriteriaAddOn();
        /// criteria1.andEqualTo(${table.javaName}::getId, id).orGreaterThan(${table.javaName}::getId, id);
        /// weekend.and(criteria1);
        try {
            return ${table.javaNameLow}Mapper.updateByWeekendSelectiveGenerate(${table.javaNameLow}Param, ${table.javaName}.class, weekend);
        } catch (DuplicateKeyException ex) {
            throw new ResponseException(CommonResponseEnum.DATA_DUPLICATE);
        }
    }

    /**
     * 基础模板 编辑 ${table.javaName} 通过主键id，id直接包含在传参对象内
     *
     * @${table.javaNameLow}Param 要更新的记录
     * @return 数据库执行完毕影响的行数
     * @throws ResponseException 传递异常
     */
    @Override
    public int updateByIdSelective(${table.javaName}Param ${table.javaNameLow}Param) throws ResponseException {
        try {
            return ${table.javaNameLow}Mapper.updateByPrimaryKeySelectiveGenerate(${table.javaNameLow}Param, ${table.javaName}.class);
        } catch (DuplicateKeyException ex) {
            throw new ResponseException(CommonResponseEnum.DATA_DUPLICATE);
        }
    }

    // ^^^^^^^^^^^^^^^^^^^^^以上为自动生成的基础模板代码^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

}
