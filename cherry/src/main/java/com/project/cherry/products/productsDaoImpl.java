package com.project.cherry.products;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class productsDaoImpl implements productsDao{
	@Autowired
	private SqlSession session;

	@Override
	public void addProduct(productsDto dto) {
		session.insert("products.addProduct",dto);
	}
}
