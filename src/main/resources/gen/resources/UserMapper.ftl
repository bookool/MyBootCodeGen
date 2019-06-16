<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!-- 用户基础信息表 -->
<mapper namespace="${packageName}.mapper.${table.javaName}Mapper">

    <!-- #####################以下为自动生成的代码############################################################ -->

    <resultMap id="BaseResultMap" type="${packageName}.domain.dto.result.${table.javaName}Result">
        <!-- id -->
        <id column="id" property="id"/>
        <!-- 创建时间 -->
        <result column="gmt_create" property="gmtCreate"/>
        <!-- 修改时间 -->
        <result column="gmt_modified" property="gmtModified"/>
        <#list table.columns as column>
        <!-- ${column.colComment} -->
        <result column="${column.colName}" property="${column.javaName}"/>
        </#list>
    </resultMap>

    <!-- 分页语句 -->
    <sql id="BaseSqlPage">
        <!-- 通用分页 -->
        <if test="pageParam!=null and pageParam.offset!=null and pageParam.rows!=null and pageParam.pageSize!=null">
            LIMIT ${r'#{pageParam.offset}'}, ${r'#{pageParam.rows}'}
        </if>
        <!-- 快速更新分页 -->
        <if test="pageParam!=null and (pageParam.roundMinId!=null or pageParam.roundMaxId!=null) and pageParam.pageSize!=null">
            LIMIT ${r'#{pageParam.pageSize}'}
        </if>
    </sql>

    <!-- 基础输出字段 -->
    <sql id="BaseSqlColumnList">
        `id`
        , `gmt_create`
        , `gmt_modified`
        <#list table.columns as column>
        , ${column.colName}
        </#list>
	</sql>

    <!-- 基础输出字段(手动分页专用) -->
    <sql id="BaseSqlColumnListCustomPage">
        `ta`.`id`
        , `ta`.`gmt_create`
        , `ta`.`gmt_modified`
        <#list table.columns as column>
        , `ta`.`${column.colName}`
        </#list>
	</sql>

    <!-- 基础查询条件 -->
    <sql id="BaseSqlWhere">
        <trim prefix="WHERE" prefixOverrides="AND|OR">
            <if test="id!=null">
                AND `id` = ${r'#{id}'}
            </if>
            <#list table.columns as column>
            <if test="${column.javaName}!=null">
                AND `${column.colName}` = ${r'#{'}${column.javaName}${r'}'}
            </if>
            </#list>
            <!-- 快速更新分页,分两段进行查询，先查id大于给定id的部分(用户翻页过程中，新增的部分) -->
            <if test="pageParam!=null and pageParam.roundMaxId!=null and pageParam.pageSize!=null">
                AND `id` &gt; ${r'#{pageParam.roundMaxId}'}
            </if>
            <!-- 快速更新分页,分两段进行查询，再查id小于给定id的部分 -->
            <if test="pageParam!=null and pageParam.roundMinId!=null and pageParam.pageSize!=null">
                AND `id` &lt; ${r'#{pageParam.roundMinId}'}
            </if>
        </trim>
    </sql>

    <!-- 基础模板 取得符合条件的 ${table.tableName} 的记录个数 -->
    <select id="getListCount" resultType="java.lang.Long"
            parameterType="${packageName}.domain.dto.param.${table.javaName}Param">
        SELECT COUNT(*)
        FROM ${table.tableName}
        <include refid="BaseSqlWhere"/>
    </select>

    <!-- 基础模板 取得符合条件的 ${table.tableName} 列表手动分页 -->
    <select id="getListPage" resultMap="BaseResultMap"
            parameterType="${packageName}.domain.dto.param.${table.javaName}Param">
        SELECT
        <include refid="BaseSqlColumnListCustomPage"/>
        FROM `${table.tableName}` `ta`
        INNER JOIN
        (
            SELECT `id`
            FROM `${table.tableName}`
            <include refid="BaseSqlWhere"/>
            <include refid="BaseSqlPage"/>
        ) `tb`
        ON `ta`.`id` = `tb`.`id`
    </select>

    <!-- 基础模板 取得符合条件的 ${table.tableName} 列表 -->
    <select id="getList" resultMap="BaseResultMap"
            parameterType="${packageName}.domain.dto.param.${table.javaName}Param">
        SELECT
        <include refid="BaseSqlColumnList"/>
        FROM `${table.tableName}`
        <include refid="BaseSqlWhere"/>
        <!-- 快速更新分页,分两段进行查询，先查id大于给定id的部分(id正向排序) -->
        <if test="pageParam!=null and pageParam.roundMaxId!=null and pageParam.pageSize!=null">
            ORDER BY `id`
        </if>
        <!-- 快速更新分页,分两段进行查询，再查id小于给定id的部分(id反向排序) -->
        <if test="pageParam!=null and pageParam.roundMinId!=null and pageParam.pageSize!=null">
            ORDER BY `id` DESC
        </if>
        <include refid="BaseSqlPage"/>
    </select>

    <!-- ^^^^^^^^^^^^^^^^^以上为自动生成代码^^^^^^^^^^^^^^^^^^^^^^ -->

</mapper>