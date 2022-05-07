package com.project.cherry.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class userDaoImpl implements userDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void signup(userDto dto) {
		session.insert("users.signup",dto);
	}

	@Override
	public userDto userData(String id) {
		return session.selectOne("users.userData", id);
	}
	
}