package com.team180.tables;

import javax.persistence.*;

@Entity
@Table(name = "employer_listing", schema = "oneeighty", catalog = "")
public class EmployerListingEntity {
    private int jobId;
    private String company;
    private String jobTitle;
    private String contactName;
    private String contactPhone;
    private String contactEmail;
    private String jobDescription;
    private String crimetype;
    private String password;

    @Id
    @Column(name = "jobID", nullable = false)
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    @Basic
    @Column(name = "company", nullable = false, length = 255)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Basic
    @Column(name = "job_title", nullable = false, length = 255)
    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    @Basic
    @Column(name = "contact_name", nullable = false, length = 45)
    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    @Basic
    @Column(name = "contact_phone", nullable = false, length = 15)
    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    @Basic
    @Column(name = "contact_email", nullable = false, length = 45)
    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    @Basic
    @Column(name = "job_description", nullable = false, length = -1)
    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    @Basic
    @Column(name = "crimetype", nullable = false, length = 45)
    public String getCrimetype() {
        return crimetype;
    }

    public void setCrimetype(String crimetype) {
        this.crimetype = crimetype;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmployerListingEntity that = (EmployerListingEntity) o;

        if (jobId != that.jobId) return false;
        if (company != null ? !company.equals(that.company) : that.company != null) return false;
        if (jobTitle != null ? !jobTitle.equals(that.jobTitle) : that.jobTitle != null) return false;
        if (contactName != null ? !contactName.equals(that.contactName) : that.contactName != null) return false;
        if (contactPhone != null ? !contactPhone.equals(that.contactPhone) : that.contactPhone != null) return false;
        if (contactEmail != null ? !contactEmail.equals(that.contactEmail) : that.contactEmail != null) return false;
        if (jobDescription != null ? !jobDescription.equals(that.jobDescription) : that.jobDescription != null)
            return false;
        if (crimetype != null ? !crimetype.equals(that.crimetype) : that.crimetype != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = jobId;
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (jobTitle != null ? jobTitle.hashCode() : 0);
        result = 31 * result + (contactName != null ? contactName.hashCode() : 0);
        result = 31 * result + (contactPhone != null ? contactPhone.hashCode() : 0);
        result = 31 * result + (contactEmail != null ? contactEmail.hashCode() : 0);
        result = 31 * result + (jobDescription != null ? jobDescription.hashCode() : 0);
        result = 31 * result + (crimetype != null ? crimetype.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
