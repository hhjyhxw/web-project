package com.icloud.config.interceptor;

import com.icloud.config.resolver.LoginUserHandlerMethodArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
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

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new XssCsrfInterceptor()).addPathPatterns(new String[] { "/**" }).excludePathPatterns(new String[] { "/thirdInterfacePath/**" })
//                .excludePathPatterns(new String[] { "/beanGoods/goodsDetail" })
//                .excludePathPatterns(new String[] { "/checkToken/removeToken" })
//                .excludePathPatterns(new String[] { "/backpage/setting/beforeUpdate" })
//                .excludePathPatterns(new String[] { "/backpage/setting/update" });
//        registry.addInterceptor(permissionsInterceptor).addPathPatterns(new String[] { "/admin/**" }).addPathPatterns(new String[] { "/backpage/**" });
//        registry.addInterceptor(new AddTokenInterceptor()).addPathPatterns(new String[] { "/beanGoods/goodsDetail" });
//        registry.addInterceptor(new RemoveTokenInterceptor()).addPathPatterns(new String[] { "/checkToken/removeToken" });
        registry.addInterceptor(xcxLoginInterceptor).addPathPatterns(new String[] { "/xcxpath/**" }).excludePathPatterns(new String[] { "/xcxpath/xcxUserLogin/**" });
//        registry.addInterceptor(new ThirdInterfaceInterceptor()).addPathPatterns(new String[] { "/thirdInterfacePath/**" });
    }

    /**
     * 参数处理拦截
     * @param argumentResolvers
     */
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(loginUserHandlerMethodArgumentResolver);
    }
}
