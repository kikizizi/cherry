package com.project.cherry.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class chatDaoImpl implements chatDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void uploadChatLog(chatLogDto dto) {
		session.insert("chat.uploadChatLog",dto);
	}

	@Override
	public int roomListCheck(String roomId) {
		return session.selectOne("chat.checkRoomId", roomId);
	}

	@Override
	public void createRoom(chatLogDto dto) {
		session.insert("chat.createRoom",dto);
	}

	@Override
	public void updateRoom(chatLogDto dto) {
		session.update("chat.updateRoom",dto);
	}

	@Override
	public List<chatListDto> getRoomList(String id) {
		return session.selectList("chat.getRoomList",id);
	}

	@Override
	public List<chatLogDto> getChatLog(String roomId) {
		return session.selectList("chat.getChatLog",roomId);
	}

	@Override
	public void resetIsRead(String roomId) {
		session.update("chat.resetIsRead",roomId);
	}
	
	
}
