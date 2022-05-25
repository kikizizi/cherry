package com.project.cherry.chat;

public class chatListDto {
	private String roomId;
	private String text;
	private String talker;
	private int isRead;
	private String listener;
	
	public chatListDto() {}

	
	
	public chatListDto(String roomId, String text, String talker, int isRead, String listener) {
		super();
		this.roomId = roomId;
		this.text = text;
		this.talker = talker;
		this.isRead = isRead;
		this.listener = listener;
	}



	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getTalker() {
		return talker;
	}

	public void setTalker(String talker) {
		this.talker = talker;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public String getListener() {
		return listener;
	}

	public void setListener(String listener) {
		this.listener = listener;
	}
	
	
}
