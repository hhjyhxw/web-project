//
//package com.icloud.config.interceptor;
//
//import cn.hutool.extra.emoji.EmojiUtil;
//import cn.hutool.http.HttpRequest;
//import org.apache.commons.lang.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.net.URLEncoder;
//import java.util.Date;
//
//
///**
// * 微信端登录拦截器
// *
// * @author user
// *
// */
//@Component
//public class WxUserLoginInterceptor implements HandlerInterceptor {
//
//    public final static Logger log = LoggerFactory.getLogger(WxUserLoginInterceptor.class);
//
//	@Autowired
//	private HyWxuserMapper wxuserMapper;
//
//
//	@Value("${appid}")
//	private String appid ;
//	@Value("${appsecret}")
//	private String secret;
//    @Value("${domain}")
//    private String domain;
//
//	//微信登录方式 请求微信服务器
//	private String code_user = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
//    private String web_access_token = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
//    private String user_info = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
//
//	@Override
//	public boolean preHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler) throws Exception {
//        HttpSession session = request.getSession();
////        HyWxuser user = (HyWxuser) session.getAttribute("wx_user");
//        Object user =  session.getAttribute("wx_user");
//        if(null==user){
//        	String code = request.getParameter("code");
//        	if(StringUtils.isNotBlank(code)){
//        		  user = getUserInfoByCode(code);
//        		  if(null==user){
//        			  sendRedirectToWx(request,response);
//        			  return false;
//        		  }else{
//        			  session.setAttribute("wx_user", user);
//                      session.setAttribute("domain", domain);
//        		  }
//        	}else{
//        		 sendRedirectToWx(request,response);
//        		 return false;
//        	}
//        }
//        HyWxuser users = (HyWxuser)user;
//        log.info("nick==="+users.getNick()+";openid==="+users.getOpenid()+";uri==="+request.getRequestURI());
//         return true;
//	}
//
//
//
//	@Override
//	public void postHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request,
//			HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * 网页授权code获取用户信息
//	 * @param code
//	 * @return
//	 */
//	private HyWxuser getUserInfoByCode(String code) {
//		com.alibaba.fastjson.JSONObject result =
//				com.alibaba.fastjson.JSONObject.parseObject(
//						HttpRequest.get(web_access_token.replace("APPID", appid).replace("SECRET", secret).replace("CODE", code)).execute().body()
//						);
//
//		if(null!=result){
//			if(result.containsKey("openid")){
//			    HyWxuser user = getUserByOpenid(result.getString("openid"));
//			    if(user!=null && (System.currentTimeMillis()-user.getModifyTime().getTime()>7*24*60*60*1000)){
//			    	String userInfo =	HttpRequest.get(user_info.replace("ACCESS_TOKEN", result.getString("access_token")).replace("OPENID", result.getString("openid"))).execute().body();
//					com.alibaba.fastjson.JSONObject userObj = com.alibaba.fastjson.JSONObject.parseObject(userInfo);
//					user.setNick(userObj.containsKey("nickname")?EmojiUtil.toAlias(userObj.getString("nickname")):user.getNick());
//					user.setHeadImg(userObj.containsKey("headimgurl")?userObj.getString("headimgurl"):user.getHeadImg());
//					user.setModifyTime(new Date());
//					wxuserMapper.updateByPrimaryKeySelective(user);
//			    }else if(null==user){
//			    	String userInfo =	HttpRequest.get(user_info.replace("ACCESS_TOKEN", result.getString("access_token")).replace("OPENID", result.getString("openid"))).execute().body();
//			    	com.alibaba.fastjson.JSONObject userObj = com.alibaba.fastjson.JSONObject.parseObject(userInfo);
//			    	user = new HyWxuser();
//					user.setCreateTime(new Date());
//					user.setModifyTime(new Date());
//					user.setOpenid(userObj.getString("openid"));
//					user.setHeadImg(userObj.getString("headimgurl"));
//					user.setNick(EmojiUtil.toAlias(userObj.getString("nickname")));
//					wxuserMapper.insertSelective(user);
//			    }
//			    return  user;
//			}
//			return null;
//		}
//		return null;
//	}
//
//
//	private HyWxuser getUserByOpenid(String openid) {
//		synchronized (openid.intern()) {
//			HyWxuser users = wxuserMapper.selectByOpenId(openid);
//			return users;
//		}
//	}
//	/**
//	 * 微信授权方式 重定向
//	 * @param request
//	 * @param response
//	 * @throws IOException
//	 */
//	private void sendRedirectToWx(HttpServletRequest request ,HttpServletResponse response) throws IOException{
//		StringBuffer sburl = new StringBuffer();
//		sburl.append(request.getScheme() + "://");
//		sburl.append(request.getHeader("host"));
//		sburl.append(request.getRequestURI());
//		if (request.getQueryString() != null)
//			sburl.append("?" + request.getQueryString());
//		 response.sendRedirect(code_user.replace("REDIRECT_URI",URLEncoder.encode(sburl.toString(),"UTF-8")).replace("SCOPE", "snsapi_userinfo").replace("APPID", appid));
//	}
//
//}
