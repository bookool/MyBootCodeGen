package ${packageName}.domain.entity;

import ${packageName}.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;
import java.util.Date;

/*

@Data相当于@Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode这5个注解的合集。
当使用@Data注解时，则有了@EqualsAndHashCode注解，那么就会在此类中存在equals(Object other) 和 hashCode()方法，
且不会使用父类的属性，这就导致了可能的问题。
比如，有多个类有相同的部分属性，把它们定义到父类中，恰好id（数据库主键）也在父类中，那么就会存在部分对象在比较时，它们并不相等，
却因为lombok自动生成的equals(Object other) 和 hashCode()方法判定为相等，从而导致出错。

修复此问题的方法很简单：
1. 使用@Getter @Setter @ToString代替@Data并且自定义equals(Object other) 和 hashCode()方法，
比如有些类只需要判断主键id是否相等即足矣。
2. 或者使用在使用@Data时同时加上@EqualsAndHashCode(callSuper=true)注解。

@NoArgsConstructor: 自动生成无参数构造函数。
@AllArgsConstructor: 自动生成全参数构造函数。

 */

/**
 * ${table.tableName} ${table.tableComment}
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "${table.tableName}")
public class ${table.javaName} extends BaseEntity {

<#list table.columns as column>
    /**
     * ${column.colComment}
     */
    @Column(name = "${column.colName}")
    private ${column.colJavaType} ${column.javaName};

</#list>

}
