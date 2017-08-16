package com.team180.util;

/**
 * Created by joyapuryear on 8/16/17.
 */
public class Secrets {

   // private String apiKey = "QG03NyTMtuhcbD7a4xTfkb7xpq";
    //private String accountId = "128303";

    public String getApiKey() {
        return System.getProperty("API_KEY");
    }

    public String getAccountId() {
        return System.getProperty("API_ID");
    }
}
