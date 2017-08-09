package com.team180.controller;

import com.team180.tables.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
public class UserController {


    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/loginUser")
    public ModelAndView loginUser(@RequestParam("user") String userName, @RequestParam("pass") String password) {

        ArrayList<UsersEntity> userList = displayUserList();

        for (int i = 0; i < userList.size(); i++) {
            UsersEntity usersEntity = userList.get(i);
            String verUser = userList.get(i).getEmail();
            String verPass = userList.get(i).getPassword();
            if (verUser.equalsIgnoreCase(userName)) {
                if (verPass.equals(password)) {
                    return new ModelAndView("userprofile", "userProfile", usersEntity);
                } else {
                    String alert = "Invalid password";
                    return new ModelAndView("login", "invalid", alert);
                }
            }
        }
        String alert = "Invalid user name";
        return new ModelAndView("login", "invalid", alert);
    }

    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session s = sessionFact.openSession();
        s.beginTransaction();
        return s;
    }

    public ArrayList<UsersEntity> displayUserList() {
        Session s = getSession();
        Criteria c = s.createCriteria(UsersEntity.class);
        return (ArrayList<UsersEntity>) c.list();
    }


}
