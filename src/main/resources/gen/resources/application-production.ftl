myboot:
  #UserToken
  user-token:
    # UserToken密钥
    secret: 3d990d2276917dfac04467df11fff26d
    # UserToken过期时间
    expire: 30
    # UserToken重新颁发时间
    renewal: 20

  #生成唯一id
  snowflake:
    #数据中心id
    datacenterid: 1
    #工作机器id
    workerid: 1

logging:
  config: classpath:logback-boot-production.xml
  level:
    com.bookool.myboot.mapper: debug

spring:
  datasource:
    druid:
      url: ${tempMap.dbUrl}
      username: ${tempMap.dbUserName}
      password: ${tempMap.dbPassword}
      driver-class-name: com.mysql.jdbc.Driver
      #初始化连接大小
      initial-size: 5
      #最小空闲连接数
      min-idle: 5
      #最大连接数
      max-active: 1000
      #查询超时时间
      query-timeout: 6000
      #事务查询超时时间
      transaction-query-timeout: 6000
      #关闭空闲连接超时时间
      remove-abandoned-timeout: 1800
      filters: stat,wall
      validation-query: select 1
      validation-query-timeout: 1
      test-on-borrow: true
      test-on-return: true
      test-while-idle: true
  #热部署
  devtools:
    livereload:
      #是否支持livereload
      enabled: false
    restart:
      #是否支持热部署
      enabled: false
