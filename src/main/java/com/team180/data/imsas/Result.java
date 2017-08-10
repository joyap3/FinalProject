package com.team180.data.imsas;
import java.util.ArrayList;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {
  public double Time;
  public String Message;
  public int TotalRecords;
  public InputData Inputs;
  public String Product;
  public ArrayList<Record> Records = new ArrayList<Record>();
}
