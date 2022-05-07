package com.project.cherry.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class userServiceImpl implements userService{
	@Autowired
	private userDao dao;
	
	@Override
	public void signup(userDto dto) {
		String pwd= dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		dto.setPwd(encodedPwd);
		dao.signup(dto);
	}

	@Override
	public boolean checkId(String id) {
		userDto userData=dao.userData(id);
		if (userData==null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean checkPwd(userDto dto,HttpSession session) {
//		userDto userData=dao.userData(dto.getId());
//		if (userData==null) {
//			return false;
//		}
//		String encodedPwd=userData.getPwd();
//		String pwd=dto.getPwd();
//		boolean pwdMatch=BCrypt.checkpw(pwd, encodedPwd);
//		if (pwdMatch) {
//			session.setAttribute("id",dto.getId());
//			return true;
//		}
		return false;
	}
	
}
