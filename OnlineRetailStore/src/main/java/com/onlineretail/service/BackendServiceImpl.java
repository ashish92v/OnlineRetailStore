package com.onlineretail.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineretail.pojo.CartProduct;
import com.onlineretail.pojo.Category;
import com.onlineretail.pojo.Product;
import com.onlineretail.pojo.User;
import com.onlineretail.util.Mapper;
import com.onlineretail.util.Result;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("BackendService")
public class BackendServiceImpl implements BackendService {

    private String baseURL = "https://mt7.duckdns.org/api/v1/";
    private String productsEndpoint = "products";
    private String categoriesEndpoint = "categories";
    private String imagesEndpoint = "images";
    private String usersEndpoint = "users";

    public Result<List<Product>> getSampleProducts(int amount) {
        String samplesURL = baseURL + productsEndpoint + "?$sample=" + amount; //"https://mt7.duckdns.org/api/v1/products?$sample=18";
        ResponseEntity<String> response = fetchJSON(samplesURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        List<Product> products = Mapper.jsonToProductList(response.getBody());
        return Result.ok(products);
    }

    public Result<List<Product>> getProducts(String rawParams) {

        String samplesURL = baseURL + productsEndpoint + rawParams; //"https://mt7.duckdns.org/api/v1/products?categories=11111111;
        ResponseEntity<String> response =  fetchJSON(samplesURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        List<Product> products = Mapper.jsonToProductList(response.getBody());
        return Result.ok(products);
    }

    public Result<Product> getProduct(String id) {

        String productURL = baseURL + productsEndpoint + "/" + id; //"https://mt7.duckdns.org/api/v1/products/11111111;
        ResponseEntity<String> response =  fetchJSON(productURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        Product product = Mapper.jsonToProduct(response.getBody());
        return Result.ok(product);
    }

    public Result<List<Category>> getSampleCategories(int amount) {
        String samplesURL = baseURL + categoriesEndpoint+ "?$sample=" + amount; //"https://mt7.duckdns.org/api/v1/categories?$sample=18";
        ResponseEntity<String> response = fetchJSON(samplesURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        List<Category> categories = Mapper.jsonToCategoriesList(response.getBody());
        return Result.ok(categories);
    }

    public Result<List<Category>> getCategories(String rawParams) {
        String categoriesURL = baseURL + categoriesEndpoint + rawParams;
        ResponseEntity<String> response =  fetchJSON(categoriesURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        List<Category> categories = Mapper.jsonToCategoriesList(response.getBody());
        return Result.ok(categories);

    }

    public Result<Category> getCategory(String id) {
        String categoryURL = baseURL + categoriesEndpoint + "/" + id; //"https://mt7.duckdns.org/api/v1/categories/11111111;
        ResponseEntity<String> response =  fetchJSON(categoryURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        Category category = Mapper.jsonToCategory(response.getBody());
        return Result.ok(category);

    }

    public Result<List<String>> getImageNamesForProduct(String productID) {
        String imagesURL = baseURL + imagesEndpoint + "/" + productID; //"https://mt7.duckdns.org/api/v1/images/11111111;
        ResponseEntity<String> response =  fetchJSON(imagesURL);
        if (response.getStatusCode() != HttpStatus.OK){
            return Result.error(response.getStatusCode().value());
        }
        ObjectMapper mapper = new ObjectMapper();
        try {
            List<String> imageNames = mapper.readValue(response.getBody(), List.class);
            return Result.ok(imageNames);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

    public Result<String> createNewUser(String firstName, String lastName, String email, String password) {

        RestTemplate restTemplate = new RestTemplate();
        final String newUserURL = baseURL + usersEndpoint + "/" + "newUser";
        try {
            URI uri = new URI(newUserURL);
            User newUser = new User();
            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setEmail(email);
            newUser.setPassword(password);
            ResponseEntity<String> response = restTemplate.postForEntity(uri, newUser, String.class);
            if (response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            return Result.ok(extractToken(response.getBody()));
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Result<String> loginUser(String email, String password) {
        RestTemplate restTemplate = new RestTemplate();
        final String loginURL = baseURL + usersEndpoint + "/" + "login";
        try {
            URI uri = new URI(loginURL);
            User existingUser = new User();
            existingUser.setEmail(email);
            existingUser.setPassword(password);
            ResponseEntity<String> response = restTemplate.postForEntity(uri, existingUser, String.class);
            if (response.getStatusCode() == HttpStatus.BAD_REQUEST || response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            return Result.ok(extractToken(response.getBody()));
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return Result.error(HttpStatus.INTERNAL_SERVER_ERROR.value());
        }
    }

    public void logoutUser(String token) {
        //no-op
    }
    public Result<User> getUserInfo(String token){

        RestTemplate restTemplate = new RestTemplate();
        final String userInfoURL = baseURL + usersEndpoint + "/" + "info";
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + token);
            ResponseEntity<String> response =  restTemplate.exchange(userInfoURL, HttpMethod.GET, new HttpEntity("parameters", headers), String.class);
            if (response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            User user = Mapper.jsonToUser(response.getBody());
            return Result.ok(user);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(HttpStatus.INTERNAL_SERVER_ERROR.value());
        }
    }

    public Result<List<Map<String, Object>>> getUserCart(String userToken) {

        RestTemplate restTemplate = new RestTemplate();
        final String userInfoURL = baseURL + usersEndpoint + "/" + "cart";
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + userToken);
            ResponseEntity<String> response =  restTemplate.exchange(userInfoURL, HttpMethod.GET, new HttpEntity("parameters", headers), String.class);
            if (response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            List<Map<String, Object>> cartItems = Mapper.jsonToCartList(response.getBody());
            return Result.ok(cartItems);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(HttpStatus.INTERNAL_SERVER_ERROR.value());
        }
    }

    public Result<List<Map<String, Object>>> updateUserCart(String productID, int quantity, String userToken) {


        RestTemplate restTemplate = new RestTemplate();
        final String userCartURL = baseURL + usersEndpoint + "/" + "cart";
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + userToken);
            MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
            body.add("product", productID);
            body.add("quantity", Integer.toString(quantity));
            HttpEntity entity = new HttpEntity(body, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(userCartURL, entity, String.class);
            if (response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            List<Map<String, Object>> cartItems = Mapper.jsonToCartList(response.getBody());
            return Result.ok(cartItems);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Result<List<Map<String, Object>>> deleteUserCart(String userToken) {

        RestTemplate restTemplate = new RestTemplate();
        final String userCartURL = baseURL + usersEndpoint + "/" + "cart";
        try {

            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + userToken);
            ResponseEntity<String> response =  restTemplate.exchange(userCartURL, HttpMethod.DELETE, new HttpEntity("parameters", headers), String.class);
            if (response.getStatusCode() == HttpStatus.BAD_REQUEST || response.getStatusCode() != HttpStatus.OK){
                return Result.error(response.getStatusCode().value());
            }
            List<Map<String, Object>> cartItems = Mapper.jsonToCartList(response.getBody());
            return Result.ok(cartItems);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(HttpStatus.INTERNAL_SERVER_ERROR.value());
        }
    }

    private ResponseEntity<String> fetchJSON(String url) {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        return response;
    }

    private String extractToken(String jsonString){
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode root = mapper.readTree(jsonString);
            String token = root.get("token").textValue();
            return token;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
