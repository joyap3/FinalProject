package com.team180.data.imsas;

import java.util.ArrayList;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Record {
  public double Score;
  public String RecordId;
  public String Category;
  public String SourceorJurisdiction;
  public String State;
  public String FullName;
  public String FirstName;
  public String MiddleName;
  public String LastName;
  public String DOB;
  public int Age;
  public String Designation;
  public String RiskLevel;
  public String Ethnicity;
  public String Race;
  public String EyeColor;
  public String Glasses;
  public String HairColor;
  public String Height;
  public String Sex;
  public String Weight;
  public String Scars;
  public String Photo;
  public ArrayList<Alias> Aliases = new ArrayList<Alias>();
  public ArrayList<Address> Addresses = new ArrayList<Address>();
  public ArrayList<Offense> Offenses = new ArrayList<Offense>();

}
