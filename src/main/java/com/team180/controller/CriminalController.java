package com.team180.controller;

import com.team180.criminalmodels.CriminalObjects;
import com.team180.data.imsas.DataResponse;
import com.team180.data.imsas.InputRequest;
import com.team180.util.Secrets;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;


@Controller
public class CriminalController {

  Secrets secretKeys = new Secrets();


  @RequestMapping("/showAPI")
  public ModelAndView CriminalDB(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname, Model model) {
    String hi = "Welcome";
    String firstName = "";
    String lastName = "";
    String dob = "";
    String cat = "";
    String sex = "";
    String race = "";
    String desc = "";
    String casenum = "";
    String jurs = "";

    InputRequest requestData = new InputRequest();
    requestData.credentials.account_id = secretKeys.getAccountId();
    requestData.credentials.api_key = secretKeys.getApiKey();
    requestData.product = "criminal_database";
    requestData.data.FirstName = fname;
    requestData.data.LastName = lname;


    try {
      String criminalDBUrl = "https://api.imsasllc.com/v3/";
      hi = queryCriminalDB(criminalDBUrl, requestData);
      JSONObject json = null;

      json = new JSONObject(hi);

      JSONArray records = json.getJSONObject("Results").getJSONArray("Records");
      ArrayList<CriminalObjects> criminal = new ArrayList<CriminalObjects>();
      int count = 0;

      for (int i = 0; i < records.length(); i++) {
        //criminal.add(new CriminalObjects(json.getJSONObject("Results").getJSONObject("Inputs").getString("FirstName"),json.getJSONObject("Results").getJSONObject("Inputs").getString("LastName"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("DOB"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Sex"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Race"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).getString("Description"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Category")));
        //criminal.add(new CriminalObjects(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).getString("Description"),json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Category")));
        criminal.add(new CriminalObjects());
        criminal.get(i).setFirstName(json.getJSONObject("Results").getJSONObject("Inputs").getString("FirstName"));
        criminal.get(i).setLastName(json.getJSONObject("Results").getJSONObject("Inputs").getString("LastName"));

        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).has("DOB"))
          criminal.get(i).setDob(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).get("DOB").toString());
        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).has("Sex"))
          criminal.get(i).setSex(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Sex"));
        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).has("Race"))
          criminal.get(i).setRace(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getString("Race"));
        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).has("Description"))
          criminal.get(i).setRace(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).getString("Description"));
        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).has("CaseNumber"))
          criminal.get(i).setRace(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).getString("CaseNumber"));
        if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).has("Jurisdiction"))
          criminal.get(i).setRace(json.getJSONObject("Results").getJSONArray("Records").getJSONObject(i).getJSONArray("Offenses").getJSONObject(0).getString("Jurisdiction"));

      }
//      System.out.println(criminal);
      model.addAttribute("cList", criminal);
      model.addAttribute("allthejson", hi);
    } catch (JSONException e) {
      e.printStackTrace();
    }


    return new ModelAndView("criminalresult", "dbresult", firstName + " " + lastName + "" + dob + " " + cat + " " + sex + " " + race + " " + desc);
  }

  @RequestMapping("/criminalchoice")
  public String criminalChoice(Model model, @RequestParam("id") int index, @RequestParam("fName") String fname, @RequestParam("lName") String lname, @RequestParam("dob") String dob, @RequestParam("sex") String sex, @RequestParam("race") String race, @RequestParam("desc") String desc, @RequestParam("caseNum") String caseNum, @RequestParam("jurisd") String jurisd) {
    String firstName = "";
    String lastName = "";
    String hi = "Welcome";
    InputRequest requestData = new InputRequest();
    requestData.credentials.account_id = secretKeys.getAccountId();
    requestData.credentials.api_key = secretKeys.getApiKey();
    requestData.product = "criminal_database";
    requestData.data.FirstName = fname;
    requestData.data.LastName = lname;

    model.addAttribute("fName", fname);
    model.addAttribute("lName", lname);
    model.addAttribute("index", index);
    model.addAttribute("dob", dob);
    model.addAttribute("sex", sex);
    model.addAttribute("race", race);
    model.addAttribute("desc", desc);
    model.addAttribute("caseNum", caseNum);
    model.addAttribute("jurisd", jurisd);
    try {
      String criminalDBUrl = "https://api.imsasllc.com/v3/";
      hi = queryCriminalDB(criminalDBUrl, requestData);
      JSONObject json = null;


      json = new JSONObject(hi);


      fname = json.getJSONObject("Results").getJSONObject("Inputs").getString("FirstName");
      lname = json.getJSONObject("Results").getJSONObject("Inputs").getString("LastName");

      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).has("DOB")) {
        dob = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).get("DOB").toString();
      }
      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).has("Sex")) {
        sex = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getString("Sex");
      }
      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).has("Race")) {
        race = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getString("Race");
      }
      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).has("Description")) {
        desc = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).getString("Description");
      }
      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).has("CaseNumber")) {
        caseNum = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).getString("CaseNumber");
      }
      if (json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).has("Jurisdiction")) {
        jurisd = json.getJSONObject("Results").getJSONArray("Records").getJSONObject(index).getJSONArray("Offenses").getJSONObject(0).getString("Jurisdiction");
      }

      String table = "<table border=1><tr><th>First Name</th><th>Last Name</th><th>Date of Birth</th><th>Sex</th><th>Race</th><th>Description</th><th>Case No.</th><th>Jurisdiction</th></tr><tr><td>" + fname +"</td><td>"+ lname +"</td><td>"+ dob +"</td><td>"+ sex +"</td><td>"+ race +"</td><td>"+ desc +"</td><td>"+ caseNum +"</td><td>"+ jurisd + "</td></tr></table>";

      model.addAttribute("newtable", table);

    } catch (JSONException e) {
      e.printStackTrace();
    }
    return "criminalresult";
  }


  // reading from a saved JSON file on local machine
//  private String queryCriminalDB(String pathFilename) {
//    String result = "";
//    String line;
//
//    try {
//
//      BufferedReader br = new BufferedReader(new FileReader(pathFilename));
//      while ((line = br.readLine()) != null) {
//        result += line;
//      }
//
//    } catch (IOException e) {
//      e.printStackTrace();
//    }
//
//    return result;
//  }

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