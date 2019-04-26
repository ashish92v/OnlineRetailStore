package com.onlineretail.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;

import java.io.IOException;
import java.util.List;

public class Mapper {

    public static List<Product> jsonToProductList(String json){
        List<Product> products = null;
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode root = mapper.readTree(json);
            JsonNode docsNode = root.path("docs");
            if (docsNode.isArray()){
                products = mapper.readValue(docsNode.toString(), new TypeReference<List<Product>>(){});
            }
            return products;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Product jsonToProduct(String json) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            Product parsedProduct = mapper.readValue(json, Product.class);
            return parsedProduct;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }


    }

    public static List<Category> jsonToCategoriesList(String json) {
        List<Category> categories = null;
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode root = mapper.readTree(json);
            JsonNode docsNode = root.path("docs");
            if (docsNode.isArray()){
                categories = mapper.readValue(docsNode.toString(), new TypeReference<List<Category>>(){});
            }
            return categories;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Category jsonToCategory(String json) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            Category parsedCategory = mapper.readValue(json, Category.class);
            return parsedCategory;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
