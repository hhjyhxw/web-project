/**    
  * @package     : com.hyzy.mall.wx.api.model 
  * @description : TODO(用一句话描述该包做什么) 
  * @Copyright   : hyzy Corporation 2015    
  */
package com.icloud.common.util.wx.model;

import com.icloud.common.util.AccessTokenAndJsapiTicketUtil;
import com.icloud.common.util.wx.PayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**   
 * @filename     : JsSDK.java   
 * @description  : TODO JSSDK实体类
 * @version      : V 1.0
 * @author       : FUXING
 * @create       : 2015-3-30 下午5:58:24  
 * @Copyright    : HYZY Corporation 2015    
 * 
 * Modification History:
 * 	Date			Author			Version			Description
 *--------------------------------------------------------------
 *2015-3-30 下午5:58:24
 */
@Component
public class JsSDKUtil  {

    @Autowired
    private AccessTokenAndJsapiTicketUtil accessTokenAndJsapiTicketUtil;

	public JsSDK getJssdk(String appid,String url){

        try {
            JsSDK jssdk = new JsSDK();
            jssdk.setUrl(url);
            jssdk.setJsTick(accessTokenAndJsapiTicketUtil.getJsapiTicket());
            jssdk.setTimeStamp(PayUtil.getTimeStamp());
            jssdk.setNonceStr(PayUtil.getNonceStr());
            jssdk.setSign(PayUtil.createSHA1Sign(PayUtil.getJSApiParams(jssdk)));
            return jssdk;
        } catch (Exception e) {
            e.printStackTrace();
        }
       return null;
    }
}
