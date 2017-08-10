package com.team180.controller;

import com.team180.data.imsas.DataResponse;
import com.team180.data.imsas.InputRequest;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;


@Controller
public class CriminalController {

  @RequestMapping("/showAPI")
  public ModelAndView CriminalDB() {
    String hi = "Welcome";

    InputRequest requestData = new InputRequest();
    requestData.credentials.account_id = "128307";
    requestData.credentials.api_key = "EANh95OzC9CkzpmGhbA445W0CD";
    requestData.product = "criminal_database";
    requestData.data.FirstName = "Andre";
    requestData.data.LastName = "Sardin";

    String criminalDBUrl = "https://api.imsasllc.com/v3/";
    hi = queryCriminalDB(criminalDBUrl,requestData);
//    String sampleDataFile = "/Users/kuwu/Desktop/imsas_response.json";
//    hi = queryCriminalDB(sampleDataFile);

    ObjectMapper mapper = new ObjectMapper();
    DataResponse data;
//    try {
//      data = mapper.readValue(new File(sampleDataFile), DataResponse.class);

    //This was for testing in debugger when testing for empty fields
    //hi = data.Results.Message;

//      // output test
//      for (com.test.data.imsas.Record record : data.Results.Records) {
//        hi = record.FullName;
//      }
//
//    } catch (IOException e) {
//      e.printStackTrace();
//    }

    return new ModelAndView("admin", "message", hi);
  }

  // reading from a saved JSON file on local machine
  private String queryCriminalDB(String pathFilename) {
    String result = "";
    String line;

    try {

      BufferedReader br = new BufferedReader(new FileReader(pathFilename));
      while ((line = br.readLine()) != null) {
        result += line;
      }

    } catch (IOException e) {
      e.printStackTrace();
    }

    return result;
  }

  // reading form the API
  private String queryCriminalDB(String requestUrl, InputRequest requestData) {
    String result = "";

    try {
      // Create JSON serialization helper
      ObjectMapper mapper = new ObjectMapper();
      String postData = mapper.writeValueAsString(requestData);

      // Open connection the webserver
      URL url = new URL(requestUrl);
      HttpURLConnection connection = (HttpURLConnection) url.openConnection();
      // Server is sending response so enable reading response
      connection.setDoInput(true);
      // We are posting data to the server so enable writing post data
      connection.setDoOutput(true);
      connection.setRequestMethod("POST");
      // Convert unicode string to UTF-8 encoding
      OutputStream os = connection.getOutputStream();
      os.write(postData.getBytes("UTF-8"));
      os.close();

      // Make sure we received a valid response from the server
      if (connection.getResponseCode() < HttpURLConnection.HTTP_MULT_CHOICE) {
        // Read the data from the server
        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String response;

        while ((response = br.readLine()) != null) {
          result += response;
        }

        br.close();
      }

    } catch (
        MalformedURLException e) {
      e.printStackTrace();
    } catch (
        ProtocolException e) {
      e.printStackTrace();
    } catch (
        IOException e) {
      e.printStackTrace();
    }

    return result;
  }


}