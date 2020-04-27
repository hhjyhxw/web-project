/**
 * @author
 * @version
 * 2018年8月15日 下午4:41:31
 */
package com.icloud.basecommon.web;

import com.icloud.common.util.wx.model.JsSDK;
import com.icloud.common.util.wx.model.JsSDKUtil;
import com.icloud.config.global.MyPropertitys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 类名称: JsSdkConfigController
 * 类描述: 
 * 创建人: zhangdehai
 * 创建时间:2018年8月15日 下午4:41:31
 */
@Controller
@RequestMapping(value = "/frontpage/jsSdkConfig")
public class JsSdkConfigController {

    @Autowired
    private MyPropertitys myPropertitys;
    @Autowired
    private JsSDKUtil jsSDKUtil;

	@RequestMapping("/getJsSdkConfig")
	@ResponseBody
	public JsSDK getJsSdkConfig(String url){
	
		try{
			return jsSDKUtil.getJssdk(myPropertitys.getWx().getAppid(),url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}
