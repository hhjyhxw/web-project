package com.icloud.config.interceptor;

import com.icloud.config.resolver.LoginUserHandlerMethodArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
class InterceptorsStack implements WebMvcConfigurer {


    @Autowired
    private LoginUserHandlerMethodArgumentResolver loginUserHandlerMethodArgumentResolver;
    @Autowired
    private XcxLoginInterceptor xcxLoginInterceptor;
    @Autowired
    private PermissionsInterceptor permissionsInterceptor;
    @Autowired
    private WxUserLoginInterceptor wxUserLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new XssCsrfInterceptor()).addPathPatterns(new String[] { "/**" }).excludePathPatterns(new String[] { "/thirdInterfacePath/**" })
//                .excludePathPatterns(new String[] { "/beanGoods/goodsDetail" })
//                .excludePathPatterns(new String[] { "/checkToken/removeToken" })
//                .excludePathPatterns(new String[] { "/backpage/setting/beforeUpdate" })
//                .excludePathPatterns(new String[] { "/backpage/setting/update" });
        registry.addInterceptor(permissionsInterceptor).addPathPatterns(new String[] { "/sys/**" });
//        registry.addInterceptor(new AddTokenInterceptor()).addPathPatterns(new String[] { "/beanGoods/goodsDetail" });
//        registry.addInterceptor(new RemoveTokenInterceptor()).addPathPatterns(new String[] { "/checkToken/removeToken" });
        registry.addInterceptor(xcxLoginInterceptor).addPathPatterns(new String[]{"/xcxpath/**"}).excludePathPatterns(new String[]{"/xcxpath/xcxUserLogin/**"});
//        registry.addInterceptor(new ThirdInterfaceInterceptor()).addPathPatterns(new String[] { "/thirdInterfacePath/**" });
        //h5端拦截器
        registry.addInterceptor(wxUserLoginInterceptor).addPathPatterns(new String[]{"/frontpage/**"});
    }

    /**
     * 参数处理拦截
     *
     * @param argumentResolvers
     */
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(loginUserHandlerMethodArgumentResolver);
    }

    /**
     * 静态资源处理
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/statics/**").addResourceLocations("classpath:/statics/");
    }



//    @Bean
//    public InternalResourceViewResolver viewResolver() {
//        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//        viewResolver.setViewClass(HandleResourceViewExists.class); //设置检查器
//        viewResolver.setPrefix("/");
//        viewResolver.setSuffix(".ftl");
//        viewResolver.setOrder(1);
//        viewResolver.setContentType("text/html;charset=UTF-8");
//        return viewResolver;
//    }
}
