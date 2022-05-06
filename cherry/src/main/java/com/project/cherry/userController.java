package com.project.cherry;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userController {
	
	@RequestMapping("/signupform.do")
	public String singupform() {
		return "user/signup-form";
	}
	
	
}
