package ${packageName}.service.impl.base;

import ${packageName}.common.base.pageresult.BasePageList;
import ${packageName}.common.base.pageresult.PageListException;
import ${packageName}.domain.dto.BaseParam;
import ${packageName}.domain.dto.BaseResult;
import com.google.common.base.Preconditions;

import java.util.Collections;
import java.util.List;
import java.util.function.Function;

/**
 * 通过手写SQL语句，处理一个分页数据请求，通过PageList接口返回分页数据
 * 对于记录数超过百万的数据表，必须使用此方法进行分页，以提高效率
 * 使用此方法，必须在 mapper 中手写一个获取列表的方法以及一个获取记录总数的方法
 * 具体使用可搜索 getListPageByCustom 方法，很简单
 *
 * @param <T> 请求条件类型
 * @param <R> 返回结果类型
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public class PageListImplByCustom<T extends BaseParam, R extends BaseResult> extends BasePageList<T, R> {

    /**
     * 通过手写SQL语句创建分页列表对象，使用时通过此方法创建一个 PageList 接口对象返回
     *
     * @param param         条件对象
     * @param countFunction 获取符合条件的记录的个数的方法
     * @param listFunction  获取符合条件的记录列表的方法
     */
    public PageListImplByCustom(T param,
                                Function<T, Long> countFunction,
                                Function<T, List<R>> listFunction) {
        Preconditions.checkNotNull(param);
        Preconditions.checkNotNull(countFunction);
        Preconditions.checkNotNull(listFunction);
        // 检查参数
        super.checkParam(param);
        // 装入SQL用参数
        param.getPageParam().setOffset((param.getPageParam().getPageNum() - 1) * param.getPageParam().getPageSize());
        param.getPageParam().setRows(param.getPageParam().getPageSize());
        super.requestPageNum = param.getPageParam().getPageNum();
        super.requestPageSize = param.getPageParam().getPageSize();
        // 先取符合条件记录总数
        super.total = countFunction.apply(param);
        // 如果记录总数为0
        if (super.total == 0) {
            super.pages = 0;
            this.setEmptyList();
        } else { // 记录总数大于0
            // 如果有分页请求
            if (super.getRequestPageNum() != null && super.getRequestPageSize() != null) {
                // 计算所有页数
                super.pages = (int) Math.ceil((float) super.total / super.getRequestPageSize());
                // 如果请求页码在所有页数内
                if (super.getRequestPageNum() <= super.pages) {
                    this.setList(param, listFunction);
                } else { // 如果请求页码不在所有页数内
                    this.setEmptyList();
                }
            } else { // 如果没有分页请求
                // 如果符合条件记录数小于或等于单页请求的最大记录数
                if (super.total <= BasePageList.PAGE_SIZE_MAX) {
                    this.setList(param, listFunction);
                } else { // 如果符合条件记录数大于单页请求的最大记录数，抛出异常
                    throw new PageListException(
                            "Request to return %d records, exceeding the limit. " +
                                    "You can only return up to %d records.",
                            super.total,
                            BasePageList.PAGE_SIZE_MAX);
                }
            }
        }
    }

    /**
     * 设置结果为空列表
     */
    private void setEmptyList() {
        // 设置当前页码置为0
        super.pageNum = 0;
        // 返回空列表
        super.list = Collections.emptyList();
    }

    /**
     * 设置正常结果列表
     */
    private void setList(T pageListParam,
                         Function<T, List<R>> listFunction) {
        // 设置当前页码
        super.pageNum = super.requestPageNum;
        // 取出当页内记录列表
        super.list = listFunction.apply(pageListParam);
    }

}
