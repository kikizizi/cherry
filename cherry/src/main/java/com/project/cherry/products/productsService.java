package com.project.cherry.products;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface productsService {
	public void addProduct(productsDto dto,HttpServletRequest req);
	public HashMap<String, Object> getProductList(String category,int num,String search);
	public void getDetail(HttpServletRequest req,HttpSession session);
	public void conWish(HttpServletRequest req);
}
