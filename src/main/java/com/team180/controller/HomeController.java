package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */



import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;

@Controller
public class HomeController {



    @RequestMapping("/")

    public ModelAndView helloWorld()
    {
        return new
                ModelAndView("welcome","message","welcome to 180");

    }

    @RequestMapping("/registerUser")

    public String registerUser(){

        return "userregistration";
    }

    @RequestMapping("/registerJob")

    public String registerJob(){

        return "registerjob";
    }



    @RequestMapping("/insertUser")

    public ModelAndView registerUser(Model model, @RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                     @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                     @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                     @RequestParam("email") String email, @RequestParam("password") String password,
                                     @RequestParam("skillSet") String skillSet) {

        Session s = getSession();

        UsersEntity newUser = new UsersEntity();

        newUser.setFirstName(fname);
        newUser.setMiddleName(midName);
        newUser.setLastName(lname);
        newUser.setBirthday(bday);
        newUser.setAddress(address);
        newUser.setZip(zip);
        newUser.setPhoneNumber(phoneNum);

        ModelAndView alert = validateEmail(email);
        if (alert != null) return alert;

        newUser.setEmail(email);
        newUser.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));
        newUser.setSkillset(skillSet);

        s.save(newUser);
        s.beginTransaction().commit();
        s.close();

        model.addAttribute("firstName", fname);
        model.addAttribute("lastName", lname);
        model.addAttribute("middleName", midName);
        model.addAttribute("address", address);
        model.addAttribute("birthday", bday);
        model.addAttribute("phoneNumber", phoneNum);
        model.addAttribute("zip", zip);
        model.addAttribute("email", email);
        model.addAttribute("password", password);
        model.addAttribute("skillSet", skillSet);

        return new
                ModelAndView("userprofile", "message", "Hello World");
    }

    private ModelAndView validateEmail(@RequestParam("email") String email) {
        UserController uc = new UserController();
        ArrayList<UsersEntity> userList = uc.displayUserList();

        for (int i = 0; i < userList.size(); i++) {
            if(userList.get(i).getEmail().equalsIgnoreCase(email)) {
                String alert = "Email already taken, please enter alternate email.";
                return new ModelAndView("userregistration","invalid",alert);
            }
        }
        return null;
    }

    @RequestMapping("/insertJob")

    public String registerJob(@RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                              @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                              @RequestParam("email") String email, @RequestParam("jobDescription") byte[] jDescription){

        Session s = getSession();
        EmployerListingEntity jobListing = new EmployerListingEntity();

        jobListing.setCompany(company);
        jobListing.setJobTitle(jTitle);
        jobListing.setContactName(cName);
        jobListing.setContactPhone(cPhone);
        jobListing.setContactEmail(email);
        jobListing.setJobDescription(jDescription);

        s.save(jobListing);
        s.beginTransaction().commit();
        s.close();

        return "success";
    }

    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session s = sessionFact.openSession();
        //s.beginTransaction();
        return s;
    }

}




