package com.icloud.modules.bsactivity.controller;

import java.util.Arrays;
import java.util.Map;
import com.icloud.basecommon.model.Query;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.icloud.modules.bsactivity.entity.BsactivityAd;
import com.icloud.modules.bsactivity.service.BsactivityAdService;
import com.icloud.basecommon.model.Query;
import com.icloud.common.PageUtils;
import com.icloud.common.R;
import com.icloud.common.validator.ValidatorUtils;


/**
 * 
 *
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2020-04-26 16:19:44
 * 菜单主连接： modules/bsactivity/bsactivityad.html
 */
@RestController
@RequestMapping("bsactivity/bsactivityad")
public class BsactivityAdController {
    @Autowired
    private BsactivityAdService bsactivityAdService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bsactivity:bsactivityad:list")
    public R list(@RequestParam Map<String, Object> params){
        Query query = new Query(params);
        PageUtils page = bsactivityAdService.findByPage(query.getPageNum(),query.getPageSize(), query);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bsactivity:bsactivityad:info")
    public R info(@PathVariable("id") Long id){
        BsactivityAd bsactivityAd = (BsactivityAd)bsactivityAdService.getById(id);

        return R.ok().put("bsactivityAd", bsactivityAd);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bsactivity:bsactivityad:save")
    public R save(@RequestBody BsactivityAd bsactivityAd){
        bsactivityAdService.save(bsactivityAd);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bsactivity:bsactivityad:update")
    public R update(@RequestBody BsactivityAd bsactivityAd){
        ValidatorUtils.validateEntity(bsactivityAd);
        bsactivityAdService.updateById(bsactivityAd);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bsactivity:bsactivityad:delete")
    public R delete(@RequestBody Long[] ids){
        bsactivityAdService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
