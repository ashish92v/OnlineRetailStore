package com.onlineretail.pojo;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;
import java.util.Map;

public class Product {

    @JsonProperty("_id")
    private String id;

    private List<Map<String, String>> categories;

    private String description;

    private List<Map<String, String>> images;

    private String manufacturer;

    private String model;

    private String name;

    private double price;

    private double shipping;

    private int stock;

    @JsonProperty("technical_specifications")
    private List<Map<String, Object>> technicalSpecifications;

    private String upc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Map<String, String>> getCategories() {
        return categories;
    }

    public void setCategories(List<Map<String, String>> categories) {
        this.categories = categories;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Map<String, String>> getImages() {
        return images;
    }

    public void setImages(List<Map<String, String>> images) {
        this.images = images;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getShipping() {
        return shipping;
    }

    public void setShipping(double shipping) {
        this.shipping = shipping;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public List<Map<String, Object>> getTechnicalSpecifications() {
        return technicalSpecifications;
    }

    public void setTechnicalSpecifications(List<Map<String, Object>> technicalSpecifications) {
        this.technicalSpecifications = technicalSpecifications;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }
}
