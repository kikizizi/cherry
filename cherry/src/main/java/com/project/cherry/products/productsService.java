package com.project.cherry.products;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface productsService {
	public void addProduct(productsDto dto,HttpServletRequest req);
	public HashMap<String, Object> getProductList(String category,int num,String search);
}
