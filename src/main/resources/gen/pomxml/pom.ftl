<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <!-- 声明项目描述符遵循哪一个POM模型版本。
         模型本身的版本很少改变，虽然如此，但它仍然是必不可少的，
         这是为了当Maven引入了新的特性或者其他模型变更的时候，确保稳定性。 -->
    <modelVersion>4.0.0</modelVersion>

    <!-- 以值替代名称，Properties可以在整个POM中使用，
         也可以作为触发条件（见settings.xml配置文件里activation元素的说明）。
         格式是<name>value</name>。 -->
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <java.version>1.8</java.version>
        <junit-jupiter-api.version>5.5.1</junit-jupiter-api.version>
        <spring-security-web.version>5.1.6.RELEASE</spring-security-web.version>
        <commons-beanutils.version>1.9.4</commons-beanutils.version>
        <commons-io.version>2.6</commons-io.version>
        <commons-codec.version>1.13</commons-codec.version>
        <commons-lang3.version>3.9</commons-lang3.version>
        <okhttp.version>4.1.0</okhttp.version>
        <okio.version>2.3.0</okio.version>
        <druid-spring-boot-starter.version>1.1.18</druid-spring-boot-starter.version>
        <mysql-connector-java.version>8.0.17</mysql-connector-java.version>
        <mariadb-java-client.version>2.4.3</mariadb-java-client.version>
        <postgresql.version>42.2.6</postgresql.version>
        <mybatis-spring-boot-starter.version>2.1.0</mybatis-spring-boot-starter.version>
        <pagehelper-spring-boot-starter.version>1.2.12</pagehelper-spring-boot-starter.version>
        <mapper-spring-boot-starter.version>2.1.5</mapper-spring-boot-starter.version>
        <quartz.version>2.3.1</quartz.version>
        <nimbus-jose-jwt.version>7.8</nimbus-jose-jwt.version>
        <freemarker.version>2.3.29</freemarker.version>
        <json-path.version>2.4.0</json-path.version>
        <springfox-swagger2.version>2.9.2</springfox-swagger2.version>
        <springfox-swagger-ui.version>2.9.2</springfox-swagger-ui.version>
        <fastjson.version>1.2.59</fastjson.version>
        <aspectjweaver.version>1.9.4</aspectjweaver.version>
        <spring-kafka.version>2.2.8.RELEASE</spring-kafka.version>
        <rocketmq-client.version>4.5.2</rocketmq-client.version>
        <guava.version>28.0-jre</guava.version>
        <jest.version>6.3.1</jest.version>
        <jna.version>5.4.0</jna.version>
        <lombok.version>1.18.8</lombok.version>
        <mapstruct.version>1.3.0.Final</mapstruct.version>
        <mapstruct-processor.version>1.3.0.Final</mapstruct-processor.version>
        <jdom.version>2.0.2</jdom.version>
        <cglib.version>3.3.0</cglib.version>
        <maven-model.version>3.6.1</maven-model.version>
        <annotations.version>RELEASE</annotations.version>
        <kotlin-stdlib.version>1.3.50</kotlin-stdlib.version>
    </properties>

    <!--父项目的坐标。如果项目中没有规定某个元素的值，那么父项目中的对应值即为项目的默认值。
        坐标包括group ID，artifact ID和 version。-->
    <parent>
        <!--被继承的父项目的全球唯一标识符-->
        <groupId>org.springframework.boot</groupId>
        <!--被继承的父项目的构件标识符-->
        <artifactId>spring-boot-starter-parent</artifactId>
        <!--被继承的父项目的版本-->
        <version>2.1.7.RELEASE</version>
        <!--父项目的pom.xml文件的相对路径。相对路径允许你选择一个不同的路径。默认值是../pom.xml。
            Maven首先在构建当前项目的地方寻找父项目的pom，其次在文件系统的这个位置（relativePath位置），
            然后在本地仓库，最后在远程仓库寻找父项目的pom。-->
        <!--<relativePath/>-->
    </parent>

    <!--项目的全球唯一标识符，通常使用全限定的包名区分该项目和其他项目。
        并且构建时生成的路径也是由此生成，
        如com.mycompany.app生成的相对路径为：/com/mycompany/app-->
    <groupId>${tempMap.groupId}</groupId>

    <!--构件的标识符，它和group ID一起唯一标识一个构件。
        换句话说，你不能有两个不同的项目拥有同样的artifact ID和groupID；在某个特定的group ID下，artifact ID也必须是唯一的。
        构件是项目产生的或使用的一个东西，Maven为项目产生的构件包括：JARs，源码，二进制发布和WARs等。-->
    <artifactId>${tempMap.artifactId}</artifactId>

    <!--项目产生的构件类型，例如jar、war、ear、pom。
        插件可以创建他们自己的构件类型，所以前面列的不是全部构件类型-->
    <packaging>jar</packaging>

    <!--项目当前版本，格式为:主版本.次版本.增量版本-限定版本号-->
    <version>1.0-SNAPSHOT</version>

    <!--项目的名称, Maven产生的文档用-->
    <name>${tempMap.artifactId}</name>

    <!--项目主页的URL, Maven产生的文档用-->
    <url>http://www.bookool.com/</url>

    <!--项目的详细描述, Maven 产生的文档用。
        当这个元素能够用HTML格式描述时（例如，CDATA中的文本会被解析器忽略，就可以包含HTML标签）， 不鼓励使用纯文本描述。
        如果你需要修改产生的web站点的索引页面，你应该修改你自己的索引页文件，而不是调整这里的文档。-->
    <description>Demo project for Spring Boot</description>

    <dependencies>

        <!-- 单元测试 -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>${r'${junit-jupiter-api.version}'}</version>
            <scope>test</scope>
        </dependency>

        <!-- spring boot -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <!-- 排除默认的tomcat -->
            <exclusions>
                <exclusion>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-tomcat</artifactId>
                </exclusion>
            </exclusions>
        </dependency>

        <!-- 使用jetty -->
        <!--
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jetty</artifactId>
        </dependency>
        -->

        <!-- undertow:高性能web服务 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-undertow</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>

        <!-- 热部署 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <optional>true</optional>
        </dependency>

        <!-- 配置 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-configuration-processor</artifactId>
            <optional>true</optional>
        </dependency>

        <!-- aop框架 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-aop</artifactId>
        </dependency>
        <!--
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjweaver</artifactId>
            <version>${r'${aspectjweaver.version}'}</version>
        </dependency>
        -->

        <!-- AMQP -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-amqp</artifactId>
        </dependency>

        <!-- spring kafka 消息 -->
        <dependency>
            <groupId>org.springframework.kafka</groupId>
            <artifactId>spring-kafka</artifactId>
            <version>${r'${spring-kafka.version}'}</version>
        </dependency>

        <!-- Rocket MQ -->
        <dependency>
            <groupId>org.apache.rocketmq</groupId>
            <artifactId>rocketmq-client</artifactId>
            <version>${r'${rocketmq-client.version}'}</version>
        </dependency>

        <!-- es -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-elasticsearch</artifactId>
        </dependency>

        <!-- jdbc -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jdbc</artifactId>
        </dependency>

        <!-- Spring安全 -->
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-web</artifactId>
            <version>${r'${spring-security-web.version}'}</version>
        </dependency>

        <!-- bean工具类动态bean -->
        <dependency>
            <groupId>commons-beanutils</groupId>
            <artifactId>commons-beanutils</artifactId>
            <version>${r'${commons-beanutils.version}'}</version>
        </dependency>

        <!-- 帮助开发IO功能的实用工具库 -->
        <dependency>
            <groupId>commons-io</groupId>
            <artifactId>commons-io</artifactId>
            <version>${r'${commons-io.version}'}</version>
        </dependency>

        <!-- 提供通用编码器和解码器的实现 -->
        <dependency>
            <groupId>commons-codec</groupId>
            <artifactId>commons-codec</artifactId>
            <version>${r'${commons-codec.version}'}</version>
        </dependency>

        <!-- 提供了许多辅助工具，特别是字符串操作方法、基本数值方法、对象反射、并发、创建和序列化和系统属性 -->
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
            <version>${r'${commons-lang3.version}'}</version>
        </dependency>

        <!-- okhttp -->
        <dependency>
            <groupId>com.squareup.okhttp3</groupId>
            <artifactId>okhttp</artifactId>
            <version>${r'${okhttp.version}'}</version>
        </dependency>

        <!-- 更加方便，快速的访问、存储和处理你的数据 -->
        <dependency>
            <groupId>com.squareup.okio</groupId>
            <artifactId>okio</artifactId>
            <version>${r'${okio.version}'}</version>
        </dependency>

        <!-- 数据库连接池 -->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid-spring-boot-starter</artifactId>
            <version>${r'${druid-spring-boot-starter.version}'}</version>
        </dependency>

        <!-- mysql连接器 -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>${r'${mysql-connector-java.version}'}</version>
        </dependency>

        <!-- mariadb -->
        <!--<dependency>-->
        <!--<groupId>org.mariadb.jdbc</groupId>-->
        <!--<artifactId>mariadb-java-client</artifactId>-->
        <!--<version>${r'${mariadb-java-client.version}'}</version>-->
        <!--</dependency>-->

        <!-- postgresql -->
        <!--<dependency>-->
        <!--<groupId>org.postgresql</groupId>-->
        <!--<artifactId>postgresql</artifactId>-->
        <!--<version>${r'${postgresql.version}'}</version>-->
        <!--</dependency>-->

        <!-- mybatis -->
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>${r'${mybatis-spring-boot-starter.version}'}</version>
        </dependency>

        <!-- mybatis分页插件 -->
        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper-spring-boot-starter</artifactId>
            <version>${r'${pagehelper-spring-boot-starter.version}'}</version>
        </dependency>

        <!-- tk mapper -->
        <dependency>
            <groupId>tk.mybatis</groupId>
            <artifactId>mapper-spring-boot-starter</artifactId>
            <version>${r'${mapper-spring-boot-starter.version}'}</version>
        </dependency>

        <!-- 开源作业调度框架 -->
        <dependency>
            <groupId>org.quartz-scheduler</groupId>
            <artifactId>quartz</artifactId>
            <version>${r'${quartz.version}'}</version>
        </dependency>

        <!-- jwt -->
        <dependency>
            <groupId>com.nimbusds</groupId>
            <artifactId>nimbus-jose-jwt</artifactId>
            <version>${r'${nimbus-jose-jwt.version}'}</version>
        </dependency>

        <!-- 生成/输出文本的通用工具 -->
        <dependency>
            <groupId>org.freemarker</groupId>
            <artifactId>freemarker</artifactId>
            <version>${r'${freemarker.version}'}</version>
        </dependency>

        <!-- json解析非常强大 -->
        <dependency>
            <groupId>com.jayway.jsonpath</groupId>
            <artifactId>json-path</artifactId>
            <version>${r'${json-path.version}'}</version>
        </dependency>

        <!-- swagger -->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>${r'${springfox-swagger2.version}'}</version>
        </dependency>

        <!-- swagger-ui -->
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>${r'${springfox-swagger-ui.version}'}</version>
        </dependency>

        <!-- json处理 -->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>${r'${fastjson.version}'}</version>
        </dependency>

        <!-- 方便编码，并减少编码错误 -->
        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
            <version>${r'${guava.version}'}</version>
        </dependency>

        <!-- 前端测试 -->
        <dependency>
            <groupId>io.searchbox</groupId>
            <artifactId>jest</artifactId>
            <version>${r'${jest.version}'}</version>
        </dependency>

        <!-- 在运行期动态访问系统本地库 -->
        <dependency>
            <groupId>net.java.dev.jna</groupId>
            <artifactId>jna</artifactId>
            <version>${r'${jna.version}'}</version>
        </dependency>

        <!-- 减少很多重复代码的书写 -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>${r'${lombok.version}'}</version>
            <scope>provided</scope>
        </dependency>

        <!-- 将某几种类型的对象映射为另外一种类型 -->
        <dependency>
            <groupId>org.mapstruct</groupId>
            <artifactId>mapstruct</artifactId>
            <version>${r'${mapstruct.version}'}</version>
        </dependency>

        <!-- 注解处理器，根据注解自动生成mapper的实现 -->
        <dependency>
            <groupId>org.mapstruct</groupId>
            <artifactId>mapstruct-processor</artifactId>
            <version>${r'${mapstruct-processor.version}'}</version>
        </dependency>

        <!-- 读写及操作XML的一套组件 -->
        <dependency>
            <groupId>org.jdom</groupId>
            <artifactId>jdom</artifactId>
            <version>${r'${jdom.version}'}</version>
        </dependency>

        <!-- CGLIB是一个强大的高性能的代码生成包 -->
        <dependency>
            <groupId>cglib</groupId>
            <artifactId>cglib</artifactId>
            <version>${r'${cglib.version}'}</version>
        </dependency>

        <!-- maven相关 -->
        <dependency>
            <groupId>org.apache.maven</groupId>
            <artifactId>maven-model</artifactId>
            <version>${r'${maven-model.version}'}</version>
        </dependency>

        <!-- JetBrains注解库注释你的代码 -->
        <dependency>
            <groupId>org.jetbrains</groupId>
            <artifactId>annotations</artifactId>
            <version>${r'${annotations.version}'}</version>
            <scope>compile</scope>
        </dependency>

        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>
            <artifactId>kotlin-stdlib</artifactId>
            <version>${kotlin-stdlib.version}</version>
        </dependency>


    </dependencies>

    <!--在列的项目构建profile，如果被激活，会修改构建处理-->
    <profiles>

        <!--根据环境参数或命令行参数激活某个构建处理-->
        <profile>

            <!--构建配置的唯一标识符。即用于命令行激活，也用于在继承时合并具有相同标识符的profile。-->
            <id>develop</id>

            <!--自动触发profile的条件逻辑。Activation是profile的开启钥匙。
            profile的力量来自于它能够在某些特定的环境中自动使用某些特定的值；
            这些环境通过activation元素指定。
            activation元素并不是激活profile的唯一方式。-->
            <activation>

                <!--profile默认是否激活的标志-->
                <activeByDefault>true</activeByDefault>

            </activation>

            <!--以值替代名称，Properties可以在整个POM中使用，
            也可以作为触发条件（见settings.xml配置文件里activation元素的说明）。
            格式是<name>value</name>。-->
            <properties>
                <profileActive>develop</profileActive>
            </properties>

        </profile>

        <profile>

            <!--构建配置的唯一标识符。即用于命令行激活，也用于在继承时合并具有相同标识符的profile。-->
            <id>production</id>

            <!--以值替代名称，Properties可以在整个POM中使用，
            也可以作为触发条件（见settings.xml配置文件里activation元素的说明）。
            格式是<name>value</name>。-->
            <properties>
                <profileActive>production</profileActive>
            </properties>

        </profile>

    </profiles>

    <!--构建项目需要的信息-->
    <build>
        <!--产生的构建的文件名，默认值是${r'${artifactId}'}-${r'${version}'}。-->
        <finalName>${tempMap.artifactId}</finalName>

        <!--当filtering开关打开时，使用到的过滤器属性文件列表-->
        <filters>
            <filter>src/main/resources/application.yml</filter>
            <filter>src/main/resources/application-develop.yml</filter>
        </filters>

        <!--这个元素描述了项目相关的所有资源路径列表，例如和项目相关的属性文件，这些资源被包含在最终的打包文件里。-->
        <resources>

            <!--这个元素描述了项目相关或测试相关的所有资源路径-->
            <resource>

                <!--是否使用参数值代替参数名。参数值取自properties元素或者文件里配置的属性，文件在filters元素里列出。-->
                <filtering>true</filtering>

                <!--描述存放资源的目录，该路径相对POM路径-->
                <directory>src/main/resources</directory>

                <!--包含的模式列表，例如**/*.xml.-->
                <includes>
                    <include>application.yml</include>
                    <include>application-${r'${profileActive}'}.yml</include>
                    <include>com/**</include>
                    <include>note/**</include>
                    <include>*.xml</include>
                    <include>*.json</include>
                    <!--<include>*.json</include>-->
                    <!--<include>*.properties</include>-->
                    <!--<include>*.txt</include>-->
                    <!--<include>*.rule</include>-->
                </includes>

                <!--排除的模式列表，例如**/*.xml-->
                <!--<excludes/>-->

            </resource>

        </resources>

        <!--使用的插件列表-->
        <plugins>

            <!--参见build/pluginManagement/plugins/plugin元素-->
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <!-- 将Spring Boot应用打包为可执行的jar或war文件，
                然后以通常的方式运行Spring Boot应用 -->
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <layout>JAR</layout>
                    <!-- 如果没有该配置，devtools不会生效 -->
                    <fork>true</fork>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <!-- 操作jar包 -->
                <artifactId>maven-dependency-plugin</artifactId>
                <executions>
                    <execution>
                        <id>unpack</id>
                        <phase>package</phase>
                        <goals>
                            <goal>unpack</goal>
                        </goals>
                        <configuration>
                            <artifactItems>
                                <artifactItem>
                                    <groupId>${tempMap.groupId}</groupId>
                                    <artifactId>${tempMap.artifactId}</artifactId>
                                    <version>1.0-SNAPSHOT</version>
                                </artifactItem>
                            </artifactItems>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <!-- maven编译 -->
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>${r'${java.version}'}</source>
                    <target>${r'${java.version}'}</target>
                </configuration>
            </plugin>

            <plugin>
                <groupId>org.jetbrains.kotlin</groupId>
                <artifactId>kotlin-maven-plugin</artifactId>
                <version>${kotlin-stdlib.version}</version>
                <executions>
                    <execution>
                        <id>compile</id>
                        <phase>process-sources</phase>
                        <goals>
                            <goal>compile</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

        </plugins>
    </build>

</project>