package com.onlineretail.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineretail.pojo.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public static User jsonToUser(String json){
        ObjectMapper mapper = new ObjectMapper();
        try {
            User parsedUser = mapper.readValue(json, User.class);
            return parsedUser;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Map<String, Object>> jsonToCartList(String json){
        List<Map<String, Object>>  cartItems = null;
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode root = mapper.readTree(json);
            if (root.isArray()){
                cartItems = mapper.readValue(root.toString(), new TypeReference<List<Map<String, Object>>>(){});
            }




           // JsonNode docsNode = root.path("docs");
            //if (docsNode.isArray()){
             //   cartItems = mapper.readValue(docsNode.toString(), new TypeReference<List<Map<String, Object>>>(){});
            //}
            return cartItems;
        } catch (IOException e) {
            e.printStackTrace();
            return new ArrayList<Map<String, Object>>();
        }
    }

    public static Gadget productToGadget(Product product){
        return new Gadget(product.getId(),
                product.getId(),
                product.getName(),
                Double.toString(product.getPrice()),
                product.getImages().get(0).get("name"),
                product.getManufacturer(),
                product.getModel(),
                product.getDescription());
    }

    public static String gadgetListToJsonString(List<Gadget> gadgets){
        //product="{\"gadget\": [{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//grinder.jpg\", \"name\": \"grinder\" },{ \"gadgetUrl\": \"img//television.jpg\", \"name\": \"television\" },{ \"gadgetUrl\": \"img//washingmachine.jpg\", \"name\": \"washingmachine\" },{ \"gadgetUrl\": \"img//camera.jpg\",\"name\":\"camera\"}  ,{ \"gadgetUrl\": \"img//phone2.jpg\", \"name\": \"phone2\" },  { \"gadgetUrl\": \"img//laptop.jpg\", \"name\": \"laptop\" }]}";

        JSONArray jsonarray = new JSONArray();
        for (Gadget currentGadget : gadgets) {
            JSONObject jsonobj= new JSONObject();

            try {
                jsonobj.put("gadgetId",currentGadget.get_id());jsonobj.put("gadgetName", currentGadget.getGadgetName());
                jsonobj.put("gadgetUrl", generateImageURL(currentGadget, false));
                jsonobj.put("gadgetPrice", currentGadget.getGadgetPrice());
                jsonobj.put("manufacture", currentGadget.getManufacture());
                jsonobj.put("model", currentGadget.getModel());
                jsonobj.put("description", currentGadget.getDescription());
                jsonarray.put(jsonobj);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        return jsonarray.toString();
    }


    private static String generateImageURL(Gadget gadget, boolean localHost){
        if (localHost){
            return null; //TODO: need to figure out what the local path will look like
        }else{
            //https://mt7.duckdns.org/api/v1/images/${product.id}/${product.images[0].get("name")}
            return "https://mt7.duckdns.org/api/v1/images/"+ gadget.getGadgetId() + "/" + gadget.getGadgetUrl();
        }
    }
}
