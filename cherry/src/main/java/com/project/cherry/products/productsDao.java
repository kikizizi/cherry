package com.project.cherry.products;

import java.util.List;

public interface productsDao {
	public void addProduct(productsDto dto);
	public List<productsDto> getProdcutList(productsDto dto);
	public int getMinNum(productsDto dto);
	public productsDto getDetail(int num);
}
