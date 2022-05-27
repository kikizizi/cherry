package com.project.cherry.user;

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

@Controller
public class userController {
	@Autowired
	private userService Service;
	
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
		return Service.checkPwd(dto, session);
	}
	@RequestMapping(value="/checkId.do",method=RequestMethod.GET)
	public @ResponseBody boolean checkId(@RequestParam String id) {
		return Service.checkId(id);
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:home.do";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView authmypage(ModelAndView mView) {
		mView.setViewName("user/mypage");
		return mView;
	}
}
