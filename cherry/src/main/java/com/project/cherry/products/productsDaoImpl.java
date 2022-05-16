package com.project.cherry.products;

import java.util.List;

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

	@Override
	public List<productsDto> getProdcutList(productsDto dto) {
		return session.selectList("products.productList",dto);
	}

	@Override
	public int getMinNum(productsDto dto) {
		try {
			return session.selectOne("products.minNum", dto);
		}catch (Exception e) {
			return 0;
		}
	}

	@Override
	public productsDto getDetail(int num) {
		session.update("products.addViewCount",num);
		productsDto dto=session.selectOne("products.getDetail",num);
		return dto;
	}
	
	
}
