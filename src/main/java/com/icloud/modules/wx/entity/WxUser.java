package com.icloud.modules.wx.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;


/**
 * 
 * @author Mr.Z
 * @email 512162086@qq.com
 * @date 2019-11-01 21:46:51
 */
@TableName("t_wx_user")
public class WxUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
   	   /*  */
       @TableId(value="id", type= IdType.AUTO)
       private Long id;
   	   	   /*  */
       @TableField("nick_name")
       private String nickName;
   	   	   /*  */
       @TableField("openid")
       private String openid;
   	   	   /*  */
       @TableField("unionid")
       private String unionid;
   	   	   /*  */
       @TableField("headphoto")
       private String headphoto;
   	   	   /*  */
       @TableField("create_time")
       private Date createTime;
   	   	   /*  */
       @TableField("modifty_time")
       private Date modiftyTime;
   	   	   /* 1男 2女 */
       @TableField("sex")
       private Integer sex;
   	   	   /* phone */
       @TableField("phone")
       private String phone;
   	
	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	/**
	 * 获取：
	 */
	public String getNickName() {
		return nickName;
	}
	/**
	 * 设置：
	 */
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	/**
	 * 获取：
	 */
	public String getOpenid() {
		return openid;
	}
	/**
	 * 设置：
	 */
	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	/**
	 * 获取：
	 */
	public String getUnionid() {
		return unionid;
	}
	/**
	 * 设置：
	 */
	public void setHeadphoto(String headphoto) {
		this.headphoto = headphoto;
	}
	/**
	 * 获取：
	 */
	public String getHeadphoto() {
		return headphoto;
	}
	/**
	 * 设置：
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：
	 */
	public void setModiftyTime(Date modiftyTime) {
		this.modiftyTime = modiftyTime;
	}
	/**
	 * 获取：
	 */
	public Date getModiftyTime() {
		return modiftyTime;
	}
	/**
	 * 设置：1男 2女
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	/**
	 * 获取：1男 2女
	 */
	public Integer getSex() {
		return sex;
	}
	/**
	 * 设置：phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 获取：phone
	 */
	public String getPhone() {
		return phone;
	}

    @Override
    public String toString() {
        return "WxUser{" +
                "id=" + id +
                ", nickName='" + nickName + '\'' +
                ", openid='" + openid + '\'' +
                ", unionid='" + unionid + '\'' +
                ", headphoto='" + headphoto + '\'' +
                ", createTime=" + createTime +
                ", modiftyTime=" + modiftyTime +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                '}';
    }
}
