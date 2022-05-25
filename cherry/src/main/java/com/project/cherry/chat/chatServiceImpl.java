package com.project.cherry.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class chatServiceImpl implements chatService{
	@Autowired
	private chatDao dao;
		
	@Override
	public void uploadChatLog(chatLogDto dto) {
		dao.uploadChatLog(dto);
		int isExist = dao.roomListCheck(dto.getRoomId());
		dto.setRegdate(System.currentTimeMillis());
		if (isExist==0) {
			dao.createRoom(dto);
		}else {
			dao.updateRoom(dto);
		}
	}

	@Override
	public void getRoomList(HttpSession session, HttpServletRequest req) {
		String id = (String) session.getAttribute("id");
		List<chatListDto> list= dao.getRoomList(id);
		req.setAttribute("roomList", list);
	}

	@Override
	public List<chatLogDto> getChatLog(String roomId) {
		return dao.getChatLog(roomId);
	}

	@Override
	public void resetIsRead(String roomId) {
		dao.resetIsRead(roomId);
	}
	
	
}
