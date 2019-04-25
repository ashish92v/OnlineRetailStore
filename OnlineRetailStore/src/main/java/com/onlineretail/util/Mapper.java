package com.onlineretail.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineretail.pojo.Product;

import java.io.IOException;
import java.util.List;

public class Mapper {

    public static List<Product> jsonToProductList(String json){
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode root = mapper.readTree(json);
            JsonNode docsNode = root.path("docs");
            if (docsNode.isArray()){
                for (final JsonNode productNode : docsNode) {
                    //convert jsonnode to product entities and add to list to be returned
                }
            }
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
