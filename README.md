#  **MyBootCodeGen** 

## 项目介绍
Spring Boot 2 项目框架生成器，可以根据mysql数据库结构生成完整的可运行的项目。  
生成的项目见：https://gitee.com/tommygun/MySpringBoot  
* 可生成完整项目，也可根据需要单为某一张表生成相关代码；
* 使用freemaker模板，可根据需要修改。
## 数据库准备
数据库中每一个表必须包含三个字段，字段名称类型不能变：
```
`id` bigint NOT NULL COMMENT 'id',
`gmt_create` datetime NOT NULL COMMENT '创建时间',
`gmt_modified` datetime NOT NULL COMMENT '修改时间',
```
其中：id为主键，不能是自增类型！！！（项目使用了分布式的id生成器）

## 配置文件准备
配置文件扩展名一般为：properties  
内容如下：
```
#生成项目根路径
rootPath=E:\\codegen\\wxyw
#作者
author=Tommy
#项目包名
packageName=com.ccgx360.agency
#数据库链接
dbUrl=jdbc:mysql://192.168.255.110:3306/bwboot?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&useSSL=false
#数据库用户名
dbUsername=tester
#数据库密码
dbPassword=123456
#数据库库名称
dbName=bwboot
#表名前缀连接符(项目生成时，实体类名删除表前缀，可不填)
tablePrefix=_
```

## 执行
先生成jar文件。  
生成完整的项目：  
```
java -jar mybootcodegen.jar [配置文件路径]
```
只生成某一个表的相关代码：  
```
java -jar mybootcodegen.jar [配置文件路径] [表名]
```

## 更新
### 190530
可以自动生成枚举：字段必须以_state或_status结尾；字段注释举例：用户状态枚举：0-无效，1-有效