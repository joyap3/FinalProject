package com.team180.data.imsas;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Alias {
  public String FirstName;
  public String LastName;
  public String MiddleName;
  public String FullName;

}
