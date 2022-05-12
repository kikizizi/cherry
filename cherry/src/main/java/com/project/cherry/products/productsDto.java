package com.project.cherry.products;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class productsDto {
	private int num;
	private String id;
	private	int price;
	private String title;
	private int isSaled;
	private String category;
	private int viewCount;
	private String imgPaths;
	private List<String> imgPathList;
	private MultipartFile img0;
	private MultipartFile img1;
	private MultipartFile img2;
	private MultipartFile img3;
	private MultipartFile img4;
	private String explanation;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private String search;
	private String priceWon;
	private int isWish;
	private int wishCount;
	
	public productsDto() {}

	public productsDto(int num, String id, int price, String title, int isSaled, String category, int viewCount,
			String imgPaths, List<String> imgPathList, MultipartFile img0, MultipartFile img1, MultipartFile img2,
			MultipartFile img3, MultipartFile img4, String explanation, String regdate, int startRowNum, int endRowNum,
			String search, String priceWon, int isWish, int wishCount) {
		super();
		this.num = num;
		this.id = id;
		this.price = price;
		this.title = title;
		this.isSaled = isSaled;
		this.category = category;
		this.viewCount = viewCount;
		this.imgPaths = imgPaths;
		this.imgPathList = imgPathList;
		this.img0 = img0;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.explanation = explanation;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.search = search;
		this.priceWon = priceWon;
		this.isWish = isWish;
		this.wishCount = wishCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getIsSaled() {
		return isSaled;
	}

	public void setIsSaled(int isSaled) {
		this.isSaled = isSaled;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getImgPaths() {
		return imgPaths;
	}

	public void setImgPaths(String imgPaths) {
		this.imgPaths = imgPaths;
	}

	public List<String> getImgPathList() {
		return imgPathList;
	}

	public void setImgPathList(List<String> imgPathList) {
		this.imgPathList = imgPathList;
	}

	public MultipartFile getImg0() {
		return img0;
	}

	public void setImg0(MultipartFile img0) {
		this.img0 = img0;
	}

	public MultipartFile getImg1() {
		return img1;
	}

	public void setImg1(MultipartFile img1) {
		this.img1 = img1;
	}

	public MultipartFile getImg2() {
		return img2;
	}

	public void setImg2(MultipartFile img2) {
		this.img2 = img2;
	}

	public MultipartFile getImg3() {
		return img3;
	}

	public void setImg3(MultipartFile img3) {
		this.img3 = img3;
	}

	public MultipartFile getImg4() {
		return img4;
	}

	public void setImg4(MultipartFile img4) {
		this.img4 = img4;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getPriceWon() {
		return priceWon;
	}

	public void setPriceWon(String priceWon) {
		this.priceWon = priceWon;
	}

	public int getIsWish() {
		return isWish;
	}

	public void setIsWish(int isWish) {
		this.isWish = isWish;
	}

	public int getWishCount() {
		return wishCount;
	}

	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}

	
}
