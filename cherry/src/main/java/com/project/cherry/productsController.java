package com.project.cherry;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.cherry.products.productsDto;
import com.project.cherry.products.productsService;

@Controller
public class productsController {
	@Autowired
	private productsService Service;
	
	@RequestMapping("/home.do")
	public String home(HttpServletRequest req) {
		int num;
		if (req.getParameter("num")==null) {
			num=2147483647;
		} else {
			num=Integer.parseInt(req.getParameter("num"));
		}
		String category=req.getParameter("category");
		String search=req.getParameter("search");
		HashMap<String, Object> map=Service.getProductList(category, num, search);
		req.setAttribute("list",(List<productsDto>) map.get("list"));
		req.setAttribute("isEnd", (boolean) map.get("isEnd"));
		req.setAttribute("lastnum", (int) map.get("lastnum"));
		return "home";
	}
	@RequestMapping("/sell.do")
	public String sell() {
		return "products/uploadform";
	}
	@RequestMapping("/goodsupload.do")
	public String goodsupload(productsDto dto,HttpServletRequest req,HttpSession session) {
		String id=(String) session.getAttribute("id");
		dto.setId(id);
		Service.addProduct(dto, req);
		return "redirect:home.do";
	}
	@RequestMapping(value="/moreProducts.do",method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String , Object> moreProducts(HttpServletRequest req){
		int num;
		if (req.getParameter("num")==null) {
			num=2147483647;
		} else {
			num=Integer.parseInt(req.getParameter("num"));
		}
		String category=req.getParameter("category");
		String search=req.getParameter("search");
		return Service.getProductList(category, num, search);
	}
	@RequestMapping("/detail.do")
	public String detail(HttpServletRequest req) {
		Service.getDetail(req);
		return "products/productDetail";
	}
}
