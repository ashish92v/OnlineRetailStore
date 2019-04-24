package com.onlineretail.pojo;

public class Gadget {

	public String get_id() {
		return _id;
	}


	public void set_id(String _id) {
		this._id = _id;
	}
	private String _id;
	private String gadgetId;
	private String gadgetName;
	private String gadgetPrice;
	private String gadgetUrl;

	public Gadget(){
	}
	
	
	public Gadget(String _id,String gadgetId,String gadgetName, String gadgetPrice,String gadgetUrl){
		this._id=_id;
		this.gadgetId=gadgetId;
		this.gadgetName=gadgetName;
		this.gadgetPrice=gadgetPrice;
		this.gadgetUrl=gadgetUrl;
	}
	
	
	public String getGadgetId() {
		return gadgetId;
	}
	public void setGadgetId(String gadgetId) {
		this.gadgetId = gadgetId;
	}
	public String getGadgetName() {
		return gadgetName;
	}
	public void setGadgetName(String gadgetName) {
		this.gadgetName = gadgetName;
	}
	public String getGadgetPrice() {
		return gadgetPrice;
	}
	public void setGadgetPrice(String gadgetPrice) {
		this.gadgetPrice = gadgetPrice;
	}
	public String getGadgetUrl() {
		return gadgetUrl;
	}
	public void setGadgetUrl(String gadgetUrl) {
		this.gadgetUrl = gadgetUrl;
	}
	
	
}
