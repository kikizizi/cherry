package com.project.cherry.user;

public interface userDao {
	public void signup(userDto dto);
	public userDto userData(String id);
}
