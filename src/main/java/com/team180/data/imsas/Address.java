package com.team180.data.imsas;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Address {
  public String Address;
  public String City;
  public String State;
  public String Zip;
  public String COUNTY;

}
