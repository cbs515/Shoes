package com.shoes.model;

public class boughtVO {
	private String userId;
	private String productName;
	private int quantity;
	private String shoesSize;
	private int total;
	private int fix;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(String shoesSize) {
		this.shoesSize = shoesSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getFix() {
		return fix;
	}
	public void setFix(int fix) {
		this.fix = fix;
	}
}
