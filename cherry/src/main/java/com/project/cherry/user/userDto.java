package com.project.cherry.user;

public class userDto {
	private int num;
	private String id;
	private String pwd;
	private String email;
	private String regdate;
	
	public userDto() {}

	
	
	public userDto(int num, String id, String pwd, String email, String regdate) {
		super();
		this.num = num;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.regdate = regdate;
	}



	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
