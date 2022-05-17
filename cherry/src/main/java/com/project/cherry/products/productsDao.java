package com.project.cherry.products;

import java.util.List;

public interface productsDao {
	public void addProduct(productsDto dto);
	public List<productsDto> getProdcutList(productsDto dto);
	public int getMinNum(productsDto dto);
	public productsDto getDetail(int num);
	public void addWish(productsDto dto);
	public void delWish(productsDto dto);
	public int isWish(productsDto dto);
}
