package com.shoes.model;

public class Bought {
	private String userID;
	private String product_Name;
	private int price;
	private int quantity;
	private int total;
	private String shoessize;
	private String product_Picture;
	private int fix;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getShoessize() {
		return shoessize;
	}
	public void setShoessize(String shoessize) {
		this.shoessize = shoessize;
	}
	public String getProduct_Picture() {
		return product_Picture;
	}
	public void setProduct_Picture(String product_Picture) {
		this.product_Picture = product_Picture;
	}
	public int getFix() {
		return fix;
	}
	public void setFix(int fix) {
		this.fix = fix;
	}
	
}
