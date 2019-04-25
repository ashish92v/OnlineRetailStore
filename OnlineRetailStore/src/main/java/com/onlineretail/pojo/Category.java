package com.onlineretail.pojo;

import java.util.List;

public class Category {

    private String id;

    private String name;

    private List<Category> parentCategories;

    private List<Category> childCategories;
}
