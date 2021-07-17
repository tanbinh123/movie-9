package movie.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置静态资源映射
 **/
@Component
public class WebMvcConfig extends WebMvcConfigurationSupport {

    /**
     * 添加静态资源文件，外部可以直接访问地址
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        //此处还可继续增加目录。。。。
        /**
         * 图片绝对地址与虚拟地址映射
         */
        //原本不允许访问项目外的路径，允许访问以外路径下的文件
        registry.addResourceHandler("/img/**").addResourceLocations("file:/d:/img/");//这里填充的是图片的绝对路径
        super.addResourceHandlers(registry);
    }

}