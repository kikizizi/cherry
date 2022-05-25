package com.project.cherry.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface chatService {
	public void uploadChatLog(chatLogDto dto);
	public void getRoomList(HttpSession session,HttpServletRequest req);
	public List<chatLogDto> getChatLog(String roomId);
	public void resetIsRead(String roomId);
}
