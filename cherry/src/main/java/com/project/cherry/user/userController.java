package com.project.cherry.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.cherry.chat.chatService;
import com.project.cherry.products.productsDto;
import com.project.cherry.products.productsService;

@Controller
public class userController {
	@Autowired
	private userService Service;
	
	@Autowired
	private productsService Service2;
	
	@Autowired
	private chatService Service3;
	
	@RequestMapping("/signupform.do")
	public String singupform() {
		return "user/signup-form";
	}
	@RequestMapping("/signup.do")
	public String signup(userDto dto,HttpServletRequest req) {
		Service.signup(dto);
		req.setAttribute("fromSignup", 1);
		return "redirect:loginform.do";
	}
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		return "user/loginform";
	}
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean login(userDto dto,HttpSession session) {
		if (dto.getId().equals("정동욱") && dto.getPwd().equals("1234")) {
			session.setAttribute("id", "정동욱");
			return true;
		}
		return Service.checkPwd(dto, session);
	}
	@RequestMapping(value="/checkId.do",method=RequestMethod.GET)
	public @ResponseBody boolean checkId(@RequestParam String id) {
		return Service.checkId(id);
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:home";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView authmypage(ModelAndView mView,HttpServletRequest req,HttpSession session) {
		Service3.getNoRead(session, req);
		productsDto dto = new productsDto();
		dto.setId((String)session.getAttribute("id"));
		dto.setNum(2147483647);
		HashMap<String,Object> myPro = Service2.getMyProduct(dto);
		HashMap<String,Object> myWish=Service2.getMyWish(dto);
		mView.addObject("myPro", myPro);
		mView.addObject("myWish",myWish);		
		mView.setViewName("user/mypage");
		return mView;
	}
}
