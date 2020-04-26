package com.icloud.config.global;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@ConfigurationProperties(prefix="mypros")//加载自定义属性
@Configuration
public class MyPropertitys {

    //项目路径
    private String service_domain;
    //文件上传目录前缀
    private String uploadpath;
    //判断是在本地调试还是发布服务器
    private String activein;
    //微信公众号参数配置
    private Wx wx;
    //龙币接口相关参数
    private LongCoin longcoin;


    @Data
    public static class Wx{
        private String appid;
        private String appsecret;
        private String getUserInfo;//第三方登陆接口
        private String hostnumber;//gh号 用于区分不同公众号的id
        private String infokey;//登陆接口签名Key
        private String jssdk_key;//获取jssdk对象key
    }

    @Data
    public static class LongCoin{
        private String sid;
        private String key;
        private String rechargetype;//
        private String consumetype;//
        private String queryUrl;//
        private String rechargeUrl;//
        private String consumeUrl;//
        private String sid_signup;//
        private String key_signup;//
    }
}
