package ${packageName}.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger配置
 *
 * @author ${author}
 * @date ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
@Configuration
@EnableSwagger2
@Profile({"develop"})
public class Swagger2 {

    @Bean
    public Docket customDocket() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("${packageName}.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        Contact contact = new Contact("Tommy", "http://bookool.com", "msvbprogrammer@hotmail.com");
        return new ApiInfoBuilder()
                .title("前台API接口")
                .description("<a href='package_readme' target='_blank'>响应数据包说明</a><br />" +
                        "<a href='page_readme' target='_blank'>分页数据包说明</a><br />" +
                        "<a href='code_readme' target='_blank'>响应code说明</a>")
                        .contact(contact)
                .version(VersionUtil.getVersion())
                .build();
    }

}
