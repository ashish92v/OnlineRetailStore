package com.onlineretail.service;

import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;
import com.onlineretail.util.Result;

import java.util.List;
import java.util.Map;

public interface BackendService {


    Result<List<Product>> getSampleProducts(int amount);

    Result<List<Product>> getProducts(String rawParams);

    Result<Product> getProduct(String id);

    Result<List<Category>> getSampleCategories(int amount);

    Result<List<Category>> getCategories(String rawParams);

    Result<Category> getCategory(String id);

    Result<List<String>> getImageNamesForProduct(String productID); //Note, getting the actual image should be done from the frontend

    //Returns a token if successful
    Result<String> createNewUser(String firstName, String lastName, String email, String password); //TODO: Add abilityh to return an error

    Result<String> loginUser(String email, String password); //TODO: Add abilityh to return an error

    void logoutUser(String token); //We should just clear the user session

    Result<List<Map<String, Integer>>> getUserCart(String userToken);

    Result<List<Map<String, Integer>>> updateUserCart(String productID, int quantity, String userToken);

    Result<List<Map<String, Integer>>> deleteUserCart(String userToken);

}
