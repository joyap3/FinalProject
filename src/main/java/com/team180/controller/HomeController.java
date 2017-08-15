package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */


import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.sql.Date;
import java.util.List;

@Controller
public class HomeController {


    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new
                ModelAndView("welcome", "message", "welcome to 180");

    }


    @RequestMapping("/registerUser")

    public String registerUser() {

        return "userregistration";
    }

    @RequestMapping("/registerJob")

    public String registerJob() {

        return "registerjob";
    }


    @RequestMapping("/insertUser")

    public ModelAndView registerUser(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                     @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                     @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                     @RequestParam("email") String email, @RequestParam("password") String password,
                                     @RequestParam("skillSet") String skillSet) {

        Session s = HibernateDao.getSession();

        UsersEntity newUser = new UsersEntity();

        newUser.setFirstName(fname);
        newUser.setMiddleName(midName);
        newUser.setLastName(lname);
        newUser.setBirthday(bday);
        newUser.setAddress(address);
        newUser.setZip(zip);
        newUser.setPhoneNumber(phoneNum);

        ModelAndView alert = HibernateDao.validateEmail(email);
            if (alert != null) {
                return alert;
            }

        newUser.setEmail(email);
        newUser.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));
        newUser.setSkillset(skillSet);

        s.save(newUser);
        s.getTransaction().commit();
        s.close();

        List<UsersEntity> userList = HibernateDao.getUsersEntities(email);
        UserController.loggedInUser = userList.get(0);
        return new
                ModelAndView("userprofile", "userProfile", userList.get(0));
    }

    @RequestMapping("/insertJob")

    public String registerJob(@RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                              @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                              @RequestParam("email") String email, @RequestParam("jobDescription") String jDescription,
                              @RequestParam("crimetype") byte cType) {

        Session s = HibernateDao.getSession();
        EmployerListingEntity jobListing = new EmployerListingEntity();

        jobListing.setCompany(company);
        jobListing.setJobTitle(jTitle);
        jobListing.setContactName(cName);
        jobListing.setContactPhone(cPhone);
        jobListing.setContactEmail(email);
        jobListing.setJobDescription(jDescription);
        jobListing.setCrimetype(cType);

        s.save(jobListing);
        s.getTransaction().commit();
        s.close();

        return "success";
    }

}




