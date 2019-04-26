package com.onlineretail.pojo;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Category {

    @JsonProperty("_id")
    private String id;

    private String name;

    @JsonProperty("parent_categories")
    private List<Category> parentCategories;

    @JsonProperty("child_categories")
    private List<Category> childCategories;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Category> getParentCategories() {
        return parentCategories;
    }

    public void setParentCategories(List<Category> parentCategories) {
        this.parentCategories = parentCategories;
    }

    public List<Category> getChildCategories() {
        return childCategories;
    }

    public void setChildCategories(List<Category> childCategories) {
        this.childCategories = childCategories;
    }
}
