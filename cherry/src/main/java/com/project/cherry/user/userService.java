package com.project.cherry.user;

import javax.servlet.http.HttpSession;

public interface userService {
	public void signup(userDto dto);
	public boolean checkId(String id);
	public boolean checkPwd(userDto dto,HttpSession session);
}
