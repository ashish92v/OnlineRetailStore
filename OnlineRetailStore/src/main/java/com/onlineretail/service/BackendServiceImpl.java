package com.onlineretail.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;
import com.onlineretail.util.Mapper;
import com.onlineretail.util.Result;
import com.sun.istack.internal.NotNull;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service("BackendService")
public class BackendServiceImpl implements BackendService {

    private String baseURL = "https://mt7.duckdns.org/api/v1/";
    private String productsEndpoint = "products";

    @NotNull
    public Result<List<Product>> getSampleProducts(int amount) {
        RestTemplate restTemplate = new RestTemplate();
        String samplesURL = baseURL + productsEndpoint + "?$sample=" + amount; //"https://mt7.duckdns.org/api/v1/products?$sample=18";
        ResponseEntity<String> response = restTemplate.getForEntity(samplesURL, String.class);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        List<Product> products = Mapper.jsonToProductList(response.getBody());
        return Result.ok(products);
    }

    public Result<List<Product>> getProducts(String rawParams) {
        return null;
    }

    public Result<Product> getProduct(String id) {
        return null;
    }

    public Result<List<Category>> getSampleCategories(int amount) {
        return null;
    }

    public Result<List<Category>> getCategories(String rawParams) {
        return null;
    }

    public Result<Category> getCategory(String id) {
        return null;
    }

    public Result<List<String>> getImageNamesForProduct(String productID) {
        return null;
    }

    public Result<String> createNewUser(String firstName, String lastName, String email, String password) {
        return null;
    }

    public Result<String> loginUser(String email, String password) {
        return null;
    }

    public void logoutUser(String token) {

    }

    public Result<List<Map<String, Integer>>> getUserCart(String userToken) {
        return null;
    }

    public Result<List<Map<String, Integer>>> updateUserCart(String productID, int quantity, String userToken) {
        return null;
    }

    public Result<List<Map<String, Integer>>> deleteUserCart(String userToken) {
        return null;
    }
}
