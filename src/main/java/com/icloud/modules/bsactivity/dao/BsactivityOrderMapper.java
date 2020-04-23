package com.icloud.modules.bsactivity.dao;

import com.icloud.modules.bsactivity.entity.BsactivityOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 
 * 
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2020-04-17 15:11:04
 */
public interface BsactivityOrderMapper extends BaseMapper<BsactivityOrder> {
    /**
     * 获取唯一订单编号后缀
     * @return
     */
    public String getOrderNo();
}
