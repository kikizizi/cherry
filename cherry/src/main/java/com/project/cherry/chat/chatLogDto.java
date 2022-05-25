package com.project.cherry.chat;

public class chatLogDto {
	private String roomId;
	private String talker;
	private String text;
	private long regdate;
	private String listener;
	private String reg24;
	
	public chatLogDto () {}

	public chatLogDto(String roomId, String talker, String text, long regdate, String listener, String reg24) {
		super();
		this.roomId = roomId;
		this.talker = talker;
		this.text = text;
		this.regdate = regdate;
		this.listener = listener;
		this.reg24 = reg24;
	}
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getTalker() {
		return talker;
	}

	public void setTalker(String talker) {
		this.talker = talker;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public long getRegdate() {
		return regdate;
	}

	public void setRegdate(long regdate) {
		this.regdate = regdate;
	}

	public String getListener() {
		return listener;
	}

	public void setListener(String listener) {
		this.listener = listener;
	}

	public String getReg24() {
		return reg24;
	}

	public void setReg24(String reg24) {
		this.reg24 = reg24;
	}
	
	
}
