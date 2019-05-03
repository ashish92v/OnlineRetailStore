package com.onlineretail.pojo;

import java.util.Date;

public class CartProduct {

	private String _id;
	private String gadget;
	private String userId;
	private String productCount;
	private String image;
	private String price;
	private String product;
	private Date date;

	public CartProduct(){
		
	}
	
	public CartProduct(String _id, String gadget, String userId,String productCount, Date date,String image, String price,String product) {
		this._id = _id;
		this.gadget = gadget;
		this.userId = userId;
		this.productCount= productCount;
		this.date = date;
		this.image = image;
		this.price = price;
		this.product = product;
	}
	
	
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getGadget() {
		return gadget;
	}
	public void setGadget(String gadget) {
		this.gadget = gadget;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getProductCount() {
		return productCount;
	}

	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

}
