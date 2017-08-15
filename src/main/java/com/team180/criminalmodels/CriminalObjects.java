package com.team180.criminalmodels;

public class CriminalObjects {
  String firstName;
  String lastName;
  String fullName;
  String dob;
  String sex;
  String race;
  String description;
  String category;
  String casenumber;
  String jurisdiction;

  public CriminalObjects() {

  }

  public CriminalObjects(String firstName, String lastName, String dob, String sex, String race, String description, String category, String casenumber, String jurisdiction) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.fullName = fullName;
    this.dob = dob;
    this.sex = sex;
    this.race = race;
    this.description = description;
    this.category = category;
    this.casenumber = casenumber;
    this.jurisdiction = jurisdiction;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getFullName() {
    return fullName;
  }

  public void setFullName(String fullName) {
    this.fullName = fullName;
  }

  public String getDob() {
    return dob;
  }

  public void setDob(String dob) {
    this.dob = dob;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public String getRace() {
    return race;
  }

  public void setRace(String race) {
    this.race = race;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getCasenumber() {
    return casenumber;
  }

  public void setCasenumber(String casenumber) {
    this.casenumber = casenumber;
  }

  public String getJurisdiction() {
    return jurisdiction;
  }

  public void setJurisdiction(String jurisdiction) {
    this.jurisdiction = jurisdiction;
  }

  @Override
  public String toString() {
    return "CriminalObjects" +
        "firstName='" + firstName + '\'' +
        ", lastName='" + lastName + '\'' +
        ", fullName='" + fullName + '\'' +
        ", dob='" + dob + '\'' +
        ", sex='" + sex + '\'' +
        ", race='" + race + '\'' +
        ", description='" + description + '\'' +
        ", casenumber='" + casenumber + '\'' +
        ", jurisdiction='" + jurisdiction + '\'' +
        ", category='" + category;
  }
}
