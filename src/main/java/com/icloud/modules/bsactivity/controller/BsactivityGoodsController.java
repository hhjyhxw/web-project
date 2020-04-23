package com.icloud.modules.bsactivity.controller;

import com.alibaba.fastjson.JSON;
import com.icloud.basecommon.model.Query;
import com.icloud.common.ConfigUtil;
import com.icloud.common.PageUtils;
import com.icloud.common.R;
import com.icloud.common.validator.ValidatorUtils;
import com.icloud.modules.bsactivity.entity.BsactivityGoods;
import com.icloud.modules.bsactivity.entity.BsactivityGoodsqcode;
import com.icloud.modules.bsactivity.service.BsactivityGoodsService;
import com.icloud.modules.bsactivity.service.BsactivityGoodsqcodeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


/**
 * 
 *
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2020-04-17 15:11:05
 * 菜单主连接： modules/bsactivity/bsactivitygoods.html
 */
@RestController
@RequestMapping("bsactivity/bsactivitygoods")
public class BsactivityGoodsController {

    private Logger log = LoggerFactory.getLogger(getClass());


    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;
    @Autowired
    private BsactivityGoodsService bsactivityGoodsService;
    @Autowired
    private BsactivityGoodsqcodeService bsactivityGoodsqcodeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bsactivity:bsactivitygoods:list")
    public R list(@RequestParam Map<String, Object> params){
        Query query = new Query(params);
        PageUtils page = bsactivityGoodsService.findByPage(query.getPageNum(),query.getPageSize(), query);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bsactivity:bsactivitygoods:info")
    public R info(@PathVariable("id") Long id){
        BsactivityGoods bsactivityGoods = (BsactivityGoods)bsactivityGoodsService.getById(id);

        return R.ok().put("bsactivityGoods", bsactivityGoods);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bsactivity:bsactivitygoods:save")
    public R save(@RequestBody BsactivityGoods bsactivityGoods){
        bsactivityGoodsService.save(bsactivityGoods);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bsactivity:bsactivitygoods:update")
    public R update(@RequestBody BsactivityGoods bsactivityGoods){
        ValidatorUtils.validateEntity(bsactivityGoods);
        bsactivityGoodsService.updateById(bsactivityGoods);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bsactivity:bsactivitygoods:delete")
    public R delete(@RequestBody Long[] ids){
        bsactivityGoodsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    /**
     * 创建二维
     */
    @RequestMapping("/creatGoodsQcode")
    @RequiresPermissions("bsactivity:bsactivitygoods:update")
    public R creatGoodsQcode(@RequestBody BsactivityGoods bsactivityGoods){
        log.info("creatGoodsQcode_bsactivityGoods="+ JSON.toJSONString(bsactivityGoods));
        String basepath = request.getSession().getServletContext().getRealPath(ConfigUtil.get("uploadpath"))+"/"+bsactivityGoods.getId();
        File file = new File(basepath);
        if(!file.exists()){
            file.mkdirs();
        }
        List<BsactivityGoodsqcode> list = bsactivityGoodsqcodeService.createQcodeList(bsactivityGoods,ConfigUtil.get("uploadpath"),basepath);
        log.info("creatGoodsQcode_list="+ JSON.toJSONString(list));
        bsactivityGoodsqcodeService.saveBatch(list);
        return R.ok();
    }

}
