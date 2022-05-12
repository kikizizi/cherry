package com.project.cherry.products;

import javax.servlet.http.HttpServletRequest;

public interface productsService {
	public void addProduct(productsDto dto,HttpServletRequest req);
}
