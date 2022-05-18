package com.project.cherry;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class loginfilter {
	@Around("execution(org.springframework.web.servlet.ModelAndView auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args=joinPoint.getArgs();
		for(Object tmp:args) {
			if(tmp instanceof HttpServletRequest) {
				HttpServletRequest request=(HttpServletRequest) tmp;
				String id=(String)request.getSession().getAttribute("id");
				if(id==null) {
					String url = request.getRequestURI();
					String query=request.getQueryString();
					String encodeUrl;
					if (query==null) {
						encodeUrl=URLEncoder.encode(url);
					}else {
						encodeUrl=URLEncoder.encode(url+"?"+query);
					}
					ModelAndView mView=new ModelAndView();
					mView.setViewName("redirect:/loginform.do?url="+encodeUrl);
					return mView;
				}
			}
		}
		Object obj=joinPoint.proceed();
		return obj;
	}
	
}
