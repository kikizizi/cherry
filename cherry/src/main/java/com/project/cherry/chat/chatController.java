package com.project.cherry.chat;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class chatController {
	@Autowired
	private SimpMessagingTemplate temp;
	
	@Autowired
	private chatService service;
	
	@RequestMapping("/chatlist")
	public ModelAndView authchatlist(ModelAndView mView,HttpServletRequest req,HttpSession session) {
		service.getRoomList(session, mView);
		if (req.getParameter("listener")!=null) {
			List<chatLogDto> list = service.getChatLog(req.getParameter("roomId"));
			mView.addObject("chatlist", list);
		}
		mView.setViewName("user/chatlist");
		return mView;
	}
	
	@MessageMapping("/notice")
	@SendToUser("/topic/getNotice")
	public void conNotice(@RequestParam chatLogDto dto) {
		service.uploadChatLog(dto);
		temp.convertAndSend("/topic/getNotice/"+dto.getListener(),dto);
		temp.convertAndSend("/topic/getNotice/"+dto.getTalker(),dto);
		
	}
	
	@RequestMapping("/getchatLog")
	@ResponseBody
	public List<chatLogDto> getchatLog(HttpServletRequest req){
		return service.getChatLog(req.getParameter("roomId"));
	}
	
	@RequestMapping("/resetIsRead")
	@ResponseBody
	public int resetIsRead(HttpServletRequest req) {
		service.resetIsRead(req.getParameter("roomId"));
		return 0;
	}
}
