package com.onlineretail.pojo;

import java.util.List;
import java.util.Map;

public class User {

    private String id;

    private String email;

    private String hash;

    private String firstName;

    private String lastname;

    private String createdDate; //currently not used

    private List<Map<String, Integer>> cart; //list of <ProductID, quantity>


}
