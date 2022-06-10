package com.project.cherry.products;

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

import com.project.cherry.chat.chatService;

@Controller
public class productsController {
	@Autowired
	private productsService Service;
	
	@Autowired
	private chatService Service2;
	
	@RequestMapping(value={"/","/home.do"})
	public String home(HttpServletRequest req,HttpSession session) {
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
		Service2.getNoRead(session, req);
		return "home";
	}
	@RequestMapping("/sell.do")
	public ModelAndView authsell(ModelAndView mView,HttpServletRequest req,HttpSession session) {
		Service2.getNoRead(session, req);
		mView.setViewName("products/uploadform");
		return mView;
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
	public String detail(HttpServletRequest req,HttpSession session) {
		Service2.getNoRead(session, req);
		Service.getDetail(req,session);
		return "products/productDetail";
	}
	
	@RequestMapping(value="/conWish.do",method=RequestMethod.GET)
	public void conWish(HttpServletRequest req) {
		Service.conWish(req);
	}
	
	@RequestMapping("/moreMyPro")
	@ResponseBody
	public HashMap<String,Object> moreMyPro(HttpSession session,HttpServletRequest req){
		int num=Integer.parseInt(req.getParameter("num"));
		String id=(String) session.getAttribute("id");
		productsDto dto= new productsDto();
		dto.setNum(num);
		dto.setId(id);
		return Service.getMyProduct(dto);
	}
	
	@RequestMapping("/moreWish")
	@ResponseBody
	public HashMap<String, Object> moreWish(HttpSession session,HttpServletRequest req){
		int num=Integer.parseInt(req.getParameter("num"));
		String id=(String) session.getAttribute("id");
		productsDto dto= new productsDto();
		dto.setNum(num);
		dto.setId(id);
		return Service.getMyWish(dto);
	}
}
