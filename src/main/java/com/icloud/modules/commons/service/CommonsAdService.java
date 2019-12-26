package com.icloud.modules.commons.service;

import com.icloud.modules.commons.entity.CommonsAd;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.icloud.basecommon.service.BaseServiceImpl;


/**
 * 
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2019-12-26 17:58:04
 */
@Service
@Transactional
public class CommonsAdService extends BaseServiceImpl<CommonsAdMapper,CommonsAd> {

}

