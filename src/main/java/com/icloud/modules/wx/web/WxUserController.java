package com.icloud.modules.wx.web;

import com.icloud.common.MapEntryUtils;
import com.icloud.modules.wx.entity.WxUser;
import com.icloud.modules.wx.service.WxUserService;

import com.icloud.basecommon.web.BaseIdLongController;
import com.icloud.basecommon.model.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Map;
import com.github.pagehelper.PageInfo;

/**
 * @author Mr.Z
 * @email 512162086@qq.com
 * @date 2019-11-01 21:46:51
 * 菜单主连接： ./backpage/wxUser/list
 */
@Controller
@RequestMapping(value = "${backPath}/wxUser")
public class WxUserController extends BaseIdLongController<WxUserService, WxUser> {

    @Override
	public String list(WxUser t, @RequestParam Map<String, Object> params) {

        Query query =  new Query(params);
		PageInfo<WxUser> page = baseService.findByPage(query.getPageNum(), query.getPageSize(), query);
		request.setAttribute("page", page);
		request.setAttribute("record", t);
        return "wx/wx_user_list";
	}

	@Override
	public String toinput(Long id) {
		Object wxUser = baseService.getById(id);
		request.setAttribute("record", wxUser);
		return "wx/wx_user_input";
	}
}