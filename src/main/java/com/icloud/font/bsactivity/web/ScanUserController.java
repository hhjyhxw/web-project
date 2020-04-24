package com.icloud.font.bsactivity.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.icloud.common.ConfigUtil;
import com.icloud.common.R;
import com.icloud.modules.wx.entity.WxUser;
import com.icloud.thirdinterfaces.score.entity.LongQueryEntity;
import com.icloud.thirdinterfaces.score.service.LongbiServiceImpl;
import com.icloud.thirdinterfaces.score.utils.LongCoinUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 扫码兑换
 */
@Controller
@RequestMapping("/frontpage/bsactivity/user")
public class ScanUserController {

    private Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;

    @Autowired
    private  LongbiServiceImpl longbiServiceImpl;
    @Autowired
    private LongCoinUtil longCoinUtil;

    /**
     * @return
     */
    @RequestMapping("/userInfo")
    @ResponseBody
    public R userInfo(){
        try {
            WxUser user = (WxUser) request.getSession().getAttribute("wx_user");
            LongQueryEntity entity = new LongQueryEntity();
            entity.setSid(ConfigUtil.get("sid"));
            entity.setSeq(longCoinUtil.getSerialNumber());
            entity.setUseraccount(user.getOpenid());
            entity.setKey(ConfigUtil.get("key"));
            entity.setAccounttype("2");
            entity.setTimestamp(longCoinUtil.getTimeStamp());
            log.info("LongQueryEntity=="+ JSON.toJSONString(entity));
            JSONObject result = longbiServiceImpl.queryLongbi(entity.getRequestParamMap());
            log.info("userInfo_querylongbi=="+ result);
            if(result!=null && result.containsKey("returncode") && "000000".equals(result.getString("returncode"))){
                return R.ok().put("dcurrency",result.getString("dcurrency"));
            }else {
                return R.error(LongbiServiceImpl.getCodeMap().get(result.getString("returncode")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return R.error(e.getMessage());
        }

    }
}