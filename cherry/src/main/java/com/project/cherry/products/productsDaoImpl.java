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

	@Override
	public void addWish(productsDto dto) {
		dto.setWishCount(1);
		session.update("products.updateProductForWish",dto);
		session.insert("products.addWish",dto);
	}

	@Override
	public void delWish(productsDto dto) {
		dto.setWishCount(-1);
		session.update("products.updateProductForWish",dto);
		session.delete("products.delWish",dto);		
	}

	@Override
	public int isWish(productsDto dto) {
		return session.selectOne("products.isWish",dto);
	}

	@Override
	public List<productsDto> getMyProducts(productsDto dto) {
		return session.selectList("products.getMyProducts",dto);
	}

	@Override
	public List<productsDto> getMyWish(productsDto dto) {
		return session.selectList("products.getMyWish",dto);
	}

	@Override
	public int getMyProNum(productsDto dto) {
		int result;
		try {
			result=session.selectOne("products.myProMin",dto);
		}catch (Exception e) {
			result=0;
		}
		return result;
	}

	@Override
	public int getMyWishNum(productsDto dto) {
		int result;
		try {
			result=session.selectOne("products.myWishMin",dto);
		}catch (Exception e) {
			result=0;
		}
		return result;
	}
	
	
}
