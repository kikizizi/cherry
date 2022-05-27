package com.project.cherry.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

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
	public void getRoomList(HttpSession session, ModelAndView mView) {
		String id = (String) session.getAttribute("id");
		List<chatListDto> list= dao.getRoomList(id);
		mView.addObject("roomList", list);
	}

	@Override
	public List<chatLogDto> getChatLog(String roomId) {
		return dao.getChatLog(roomId);
	}

	@Override
	public void resetIsRead(String roomId) {
		dao.resetIsRead(roomId);
	}

	@Override
	public void getNoRead(HttpSession session, HttpServletRequest req) {
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		if (id != null) {
			List<chatListDto> list= dao.getRoomList(id);
			int sum=0;
			for (chatListDto dto:list) {
				if (!dto.getTalker().equals(id)) {
					sum+=dto.getIsRead();
				}
			}
			req.setAttribute("sum", sum);
		}
		
	}
	
	
}
