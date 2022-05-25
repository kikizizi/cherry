package com.project.cherry.chat;

import java.util.List;

public interface chatDao {
	public void uploadChatLog(chatLogDto dto);
	public int roomListCheck(String roomId);
	public void createRoom(chatLogDto dto);
	public void updateRoom(chatLogDto dto);
	public List<chatListDto> getRoomList(String id);
	public List<chatLogDto> getChatLog(String roomId);
	public void resetIsRead(String roomId);
}
