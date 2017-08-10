package com.team180.controller;

import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {


    private int id;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/loginUser")
    public ModelAndView loginUser(@RequestParam("user") String userName, @RequestParam("pass") String password) {

        List<UsersEntity> listResult = getUsersEntities(userName);

        if(listResult.isEmpty()){
            return new ModelAndView("login","invalid","User does not exist, please register");
        }

        if (listResult.get(0).getEmail().equalsIgnoreCase(userName)) {
            if (listResult.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {
                return new ModelAndView("userprofile", "userProfile", listResult.get(0));
            } else {
                String alert = "Invalid password";
                return new ModelAndView("login", "invalid", alert);
            }
        }
        String alert = "Invalid user name";
        return new ModelAndView("login", "invalid", alert);
    }

    public List<UsersEntity> getUsersEntities(@RequestParam("user") String userName) {
        Session session = getSession();

        String hql = "FROM UsersEntity WHERE email= :username";

        Query getUserInfo = session.createQuery(hql);
        getUserInfo.setParameter("username",userName);

        return (List<UsersEntity>) getUserInfo.getResultList();
    }

    public static Session getSession() {
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

    @RequestMapping("/updateUserInfo")
    public String update(Model model, @RequestParam ("id")int id){
        this.id = id;

        Session s = getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class,id);

        model.addAttribute("firstName",temp.getFirstName());
        model.addAttribute("middleName", temp.getMiddleName());
        model.addAttribute("lastName",temp.getLastName());
        model.addAttribute("birthday",temp.getBirthday());
        model.addAttribute("address", temp.getAddress());
        model.addAttribute("phoneNumber", temp.getPhoneNumber());
        model.addAttribute("zip", temp.getZip());
        model.addAttribute("email", temp.getEmail());
        model.addAttribute("skillSet", temp.getSkillset());

        return "updateuserinfo";
    }
    @RequestMapping("/update")
    public ModelAndView updateItem(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                   @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                   @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                   @RequestParam("email") String email, @RequestParam("skillSet") String skillSet){

        Session s = getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class,id);
        temp.setFirstName(fname);
        temp.setMiddleName(midName);
        temp.setLastName(lname);
        temp.setBirthday(bday);
        temp.setAddress(address);
        temp.setZip(zip);
        temp.setPhoneNumber(phoneNum);
        temp.setEmail(email);
        temp.setSkillset(skillSet);

        s.update(temp);
        s.getTransaction().commit();
        s.close();

        List<UsersEntity> listResult = getUsersEntities(email);


        return new ModelAndView("userprofile","userProfile",listResult.get(0));
    }


}
