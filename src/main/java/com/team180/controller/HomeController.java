package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */



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

@Controller
public class HomeController {



    @RequestMapping("/")

    public ModelAndView helloWorld()
    {
        return new
                ModelAndView("userregistration","message","Hello World");

    }



    @RequestMapping("/registerUser")

    public ModelAndView registerUser(Model model, @RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                     @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                     @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                     @RequestParam("email") String email, @RequestParam("password") String password,
                                     @RequestParam("skillSet") String skillSet) {

        Session s = getSession();

        UsersEntity newUser = new UsersEntity();
        //add values to the jsp using the model and add Attribute method
        newUser.setFirstName(fname);
        newUser.setMiddleName(midName);
        newUser.setLastName(lname);
        newUser.setBirthday(bday);
        newUser.setAddress(address);
        newUser.setZip(zip);
        newUser.setPhoneNumber(phoneNum);
        newUser.setEmail(email);
        newUser.setPassword(password);
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

    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session s = sessionFact.openSession();
        s.beginTransaction();
        return s;
    }

}




