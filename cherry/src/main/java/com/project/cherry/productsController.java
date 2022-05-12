package com.project.cherry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cherry.products.productsDto;
import com.project.cherry.products.productsService;

@Controller
public class productsController {
	@Autowired
	private productsService Service;
	
	@RequestMapping("/home.do")
	public String home() {
		return "home";
	}
	@RequestMapping("/sell.do")
	public String sell() {
		return "goods/uploadform";
	}
	@RequestMapping("/goodsupload.do")
	public String goodsupload(productsDto dto,HttpServletRequest req,HttpSession session) {
		String id=(String) session.getAttribute("id");
		dto.setId(id);
		Service.addProduct(dto, req);
		return "redirect:home.do";
	}
}
