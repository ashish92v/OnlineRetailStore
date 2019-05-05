package com.onlineretail.pojo;

public class Gadget {

	private String _id;
	private String gadgetId;
	private String gadgetName;
	private String gadgetPrice;
	private String gadgetUrl;
	private String manufacture;
	private String model;
	private String description;

	public Gadget(){
	}
	
	
	public Gadget(String _id,String gadgetId,String gadgetName, String gadgetPrice,String gadgetUrl){
		this._id=_id;
		this.gadgetId=gadgetId;
		this.gadgetName=gadgetName;
		this.gadgetPrice=gadgetPrice;
		this.gadgetUrl=gadgetUrl;
	}

	public Gadget(String _id,String gadgetId,String gadgetName, String gadgetPrice,String gadgetUrl, String manufacture, String model, String description){
		this._id=_id;
		this.gadgetId=gadgetId;
		this.gadgetName=gadgetName;
		this.gadgetPrice=gadgetPrice;
		this.gadgetUrl=gadgetUrl;
		this.manufacture = manufacture;
		this.model = model;
		this.description = description;
	}


	
	public String get_id() {
		return _id;
	}


	public void set_id(String _id) {
		this._id = _id;
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

	public String getManufacture() {
		return manufacture;
	}

	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
