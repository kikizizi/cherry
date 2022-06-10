package com.project.cherry.products;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Repository
public class productsServiceImpl implements productsService {
	@Autowired
	private productsDao dao;
	
	private String changeWon(int price) {
		String priceWon="원";
		int c=0;
		while (price!=0) {
			priceWon+=price%10;
			price/=10; c+=1;
			if(c==3) {c=0;priceWon+=",";}
		}
		if(priceWon.charAt(priceWon.length()-1)==',') {
			priceWon=priceWon.substring(0,priceWon.length()-1);
		}
		priceWon=new StringBuffer(priceWon).reverse().toString();
		return priceWon;
	}
	private String changeRegdate(String regdate) {
		String[] base=regdate.split(" ");
		LocalDate now = LocalDate.now();
		String date=base[0];
		String[] date_split=date.split("-");
		int reg_year=Integer.parseInt(date_split[0]);
		int now_year=now.getYear();
		if(reg_year<now_year) {
			return Integer.toString(now_year-reg_year)+"년전";
		}
		int reg_month=Integer.parseInt(date_split[1]);
		int now_month=now.getMonthValue();
		if(reg_month<now_month) {
			return Integer.toString(now_month-reg_month)+"달전";
		}
		int reg_day=Integer.parseInt(date_split[2]);
		int now_day=now.getDayOfMonth();
		if(reg_day<now_day) {
			return Integer.toString(now_day-reg_day)+"일전";
		}
		
		LocalTime now2=LocalTime.now();
		String time=base[1];
		String[] time_split=time.split(":");
		int reg_hour=Integer.parseInt(time_split[0]);
		int now_hour=now2.getHour();
		if(reg_hour<now_hour) {
			return Integer.toString(now_hour-reg_hour)+"시간전";
		}
		int reg_min=Integer.parseInt(time_split[1]);
		int now_min=now2.getMinute();
		if(reg_min<now_min) {
			return Integer.toString(now_min-reg_min)+"분전";
		}
		int reg_sec=Integer.parseInt(time_split[2]);
		int now_sec=now2.getSecond();
		return Integer.toString(now_sec-reg_sec)+"초전";
	}
	private String saveImg(MultipartFile img,HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/upload");
		String filePath=realPath+File.separator;
		File upload=new File(filePath);
		if(!upload.exists()) {upload.mkdir();}
		String saveFileName=System.currentTimeMillis()+img.getOriginalFilename();
		try {
			img.transferTo(new File(filePath+saveFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/upload/"+saveFileName;
	}
	private List<String> getImgPathList(productsDto dto,HttpServletRequest req) {
		List<String> imgPathList=new ArrayList<String>();
		MultipartFile img0=dto.getImg0();
		if (img0==null) {
			imgPathList.add("/resources/images/dog.jpg");
			return imgPathList;
		}else {
			imgPathList.add(saveImg(img0,req));
		}
		MultipartFile img1=dto.getImg1();
		if (img1==null) { return imgPathList;}
		else {imgPathList.add(saveImg(img1,req));}
		MultipartFile img2=dto.getImg2();
		if (img2==null) { return imgPathList;}
		else {imgPathList.add(saveImg(img2,req));}
		MultipartFile img3=dto.getImg3();
		if (img3==null) { return imgPathList;}
		else {imgPathList.add(saveImg(img3,req));}
		MultipartFile img4=dto.getImg4();
		if (img4==null) { return imgPathList;}
		else {imgPathList.add(saveImg(img4,req));}
		
		return imgPathList;
	}
	@Override
	public void addProduct(productsDto dto,HttpServletRequest req) {
		int price=dto.getPrice();
		String priceWon=changeWon(price);
		dto.setPriceWon(priceWon);
		List<String> imgPathsList=getImgPathList(dto,req);
		String imgPaths=new Gson().toJson(imgPathsList);
		dto.setImgPaths(imgPaths);
		dao.addProduct(dto);
	}
	@Override
	public HashMap<String, Object> getProductList(String category,int num,String search) {
		productsDto dto = new productsDto();
		if (category==null) {
			dto.setCategory("전체");
		}else {
			dto.setCategory(category);
		}
		dto.setNum(num);
		if (search!=null && search.equals("")) {
			search=null;
		}
		dto.setSearch(search);
		List<productsDto> list=dao.getProdcutList(dto);
		int lastnum=0;
		for(productsDto dto1:list) {
			String jsonImgPaths=dto1.getImgPaths();
			List<String> imgPathList = new Gson().fromJson(jsonImgPaths, List.class);
			dto1.setImgPathList(imgPathList);
			String regdate=dto1.getRegdate();
			dto1.setRegdate(changeRegdate(regdate));
			lastnum=dto1.getNum();
		}
		boolean isEnd = false;
		if(dao.getMinNum(dto)==lastnum) {
			isEnd=true;
		}
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("lastnum",lastnum);
		map.put("list",list);
		map.put("isEnd",isEnd);
		return map;
	}
	@Override
	public void getDetail(HttpServletRequest req,HttpSession session) {
		int num=Integer.parseInt(req.getParameter("num"));
		String id =(String) session.getAttribute("id");
		int isWish;
		productsDto dto=new productsDto();
		if (id==null) {
			isWish=0;
		} else {
			dto.setId(id);
			dto.setNum(num);
			isWish=dao.isWish(dto);
		}
		dto=dao.getDetail(num);
		dto.setIsWish(isWish);
		String jsonImgPaths=dto.getImgPaths();
		List<String> imgPathList = new Gson().fromJson(jsonImgPaths, List.class);
		dto.setImgPathList(imgPathList);
		String regdate=dto.getRegdate();
		dto.setRegdate(changeRegdate(regdate));
		
		req.setAttribute("dto",dto);
	}
	@Override
	public void conWish(HttpServletRequest req) {
		String id = req.getParameter("id");
		int num = Integer.parseInt(req.getParameter("num"));
		productsDto dto= new productsDto();
		dto.setNum(num);
		dto.setId(id);
		String aord = req.getParameter("aord");
		if (aord.equals("true")) {
			dao.addWish(dto);
		} else {
			dao.delWish(dto);
		}
	}
	@Override
	public HashMap<String, Object> getMyProduct(productsDto dto) {
		List<productsDto> list=dao.getMyProducts(dto);
		int lastnum=0;
		for (productsDto dto1:list) {
			String jsonImgPaths=dto1.getImgPaths();
			List<String> imgPathList = new Gson().fromJson(jsonImgPaths, List.class);
			dto1.setImgPathList(imgPathList);
			String regdate=dto1.getRegdate();
			dto1.setRegdate(changeRegdate(regdate));
			lastnum=dto1.getNum();
		}
		boolean isEnd = false;
		if(dao.getMyProNum(dto)==lastnum) {
			isEnd=true;
		}
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("lastnum",lastnum);
		map.put("list",list);
		map.put("isEnd",isEnd);
		return map;
	}
	
	@Override
	public HashMap<String, Object> getMyWish(productsDto dto) {
		List<productsDto> list=dao.getMyWish(dto);
		List<productsDto> wishList=new ArrayList<productsDto>();
		int lastnum=0;
		for (productsDto dto1:list) {
			productsDto dto2=dao.getDetail(dto1.getNum());
			String jsonImgPaths=dto2.getImgPaths();
			List<String> imgPathList = new Gson().fromJson(jsonImgPaths, List.class);
			dto2.setImgPathList(imgPathList);
			String regdate=dto1.getRegdate();
			dto2.setRegdate(changeRegdate(regdate));
			lastnum=dto2.getNum();
			wishList.add(dto2);
		}
		boolean isEnd = false;
		if(dao.getMyWishNum(dto)==lastnum) {
			isEnd=true;
		}
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("lastnum",lastnum);
		map.put("list",wishList);
		map.put("isEnd",isEnd);
		return map;
	}
	
}
