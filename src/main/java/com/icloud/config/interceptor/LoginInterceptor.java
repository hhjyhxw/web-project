//package com.icloud.config.interceptor;
//
//
//import com.icloud.common.ConfigUtil;
//import com.icloud.common.SpringContextHolder;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.BeanFactory;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//
///**
// * 手机端全局拦截器
// * zdh
// */
//public class LoginInterceptor implements HandlerInterceptor{
//
//	public final static Logger log = LoggerFactory.getLogger(LoginInterceptor.class);
//	private HyWxuserService hyWxuserService = SpringContextHolder.getBean(HyWxuserService.class);
//
//	@Override
//	public void afterCompletion(HttpServletRequest reqeust, HttpServletResponse response, Object arg2, Exception arg3)
//			throws Exception {
//		// TODO Auto-generated method stub
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest reqeust, HttpServletResponse response, Object arg2, ModelAndView arg3)
//			throws Exception {
//
//	}
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
//	    request.setAttribute("pictureVisitUrl", ConfigUtil.get("pictureVisitUrl"));
//        HttpSession session = request.getSession();
//        HyWxuser user = (HyWxuser) session.getAttribute("wx_user");
//        if(null==user){
//            HyWxuser users = hyWxuserService.selectByOpenId("oipdjuhlzhsjfahfieohlasjf");
//            session.setAttribute("wx_user",users);
//            session.setAttribute("wx_user",users);
//        }
//
//
//        return true;
//	}
//
//	public Object getBean(String beanName,HttpServletRequest request){
//		BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
//	    return factory.getBean(beanName);
//	}
//
//}
