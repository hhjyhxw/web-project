package com.icloud.modules.bsactivity.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.icloud.modules.wx.entity.WxUser;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author zdh
 * @email yyyyyy@cm.com
 * @date 2020-04-17 16:59:00
 */
@Data
@TableName("t_bsactivity_goodsqcode")
public class BsactivityGoodsqcode implements Serializable {
	private static final long serialVersionUID = 1L;

   	   /*  */
       @TableId(value="id", type= IdType.AUTO)
       private Long id;
   	   	   /* 关联商品id */
       @TableField("goodsid")
       private Long goodsid;
   	   	   /* 同一时空唯一key */
       @TableField("qcode")
       private String qcode;
        /* md5签名后的qcode */
        @TableField("signqcode")
        private String signqcode;
   	   	   /* 使用状态(0未使用，1已使用) */
       @TableField("status")
       private Integer status;
   	   	   /* 生成时间 */
       @TableField("create_time")
       private Date createTime;
   	   	   /* 消费时间 */
       @TableField("modify_time")
       private Date modifyTime;
   	   	   /* 消费用户id */
       @TableField("userid")
       private Long userid;
    /* 二维码下载路径 */
    @TableField("imgpath")
    private String imgpath;

    /*关联商品*/
    @TableField(exist = false)
    private BsactivityGoods bsactivityGoods;
    /*消费用户*/
    @TableField(exist = false)
    private WxUser wxUser;
   	
}
