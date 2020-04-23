//package com.icloud;
//
//import com.alibaba.fastjson.JSON;
//import com.icloud.common.ConfigUtil;
//import com.icloud.thirdinterfaces.score.entity.LongChargeEntity;
//import com.icloud.thirdinterfaces.score.service.LongbiServiceImpl;
//import com.icloud.thirdinterfaces.score.utils.LongCoinUtil;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest(classes= Application.class)
//public class LongCoinChargeTest {
//
//    @Autowired
//    private LongbiServiceImpl longbiServiceImpl;
//    @Autowired
//    private LongCoinUtil longCoinUtil;
//
//    @Test
//    public void apiTest(){
//        try {
//            LongChargeEntity entity = new LongChargeEntity();
////            entity.setSid(ConfigUtil.get("sid"));
////            entity.setKey(ConfigUtil.get("key"));
//            entity.setSid(ConfigUtil.get("sid_signup"));
//            entity.setKey(ConfigUtil.get("key_signup"));
//            entity.setSeq(longCoinUtil.getSerialNumber_signup());
//            entity.setUseraccount("ocoMKt2a_9XrLt2NBG5CupS6THE48");
//            entity.setAccounttype("2");
//            entity.setRechargetype(longCoinUtil.getRechargetype());
//            entity.setRechargeamount("12");
//            entity.setTimestamp(longCoinUtil.getTimeStamp());
//
//            System.out.println("LongQueryEntity=="+ JSON.toJSONString(entity));
//
//            longbiServiceImpl.recharge(entity.getRequestParamMap());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//
//}
