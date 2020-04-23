package com.icloud.modules.bsactivity.service;

import com.icloud.modules.bsactivity.entity.BsactivityOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.icloud.basecommon.service.BaseServiceImpl;
import com.icloud.modules.bsactivity.dao.BsactivityOrderMapper;

/**
 * 
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2020-04-17 15:11:04
 */
@Service
@Transactional
public class BsactivityOrderService extends BaseServiceImpl<BsactivityOrderMapper,BsactivityOrder> {

    @Autowired
    private BsactivityOrderMapper bsactivityOrderMapper;

    public String getLastOrderNo() {
        return bsactivityOrderMapper.getOrderNo();
    }
}

