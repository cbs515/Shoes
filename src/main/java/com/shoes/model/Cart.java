package com.shoes.model;

public class Cart {

	private String userID;
	private String product_Name;
	private int quantity;
	private int price;
	private String product_Picture;
	private String shoessize;
	
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_Picture() {
		return product_Picture;
	}
	public void setProduct_Picture(String product_Picture) {
		this.product_Picture = product_Picture;
	}
	public String getShoessize() {
		return shoessize;
	}
	public void setShoessize(String shoessize) {
		this.shoessize = shoessize;
	}
	
	
	
	
	
}
