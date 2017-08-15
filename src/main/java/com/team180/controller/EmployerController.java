package com.team180.controller;

import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by ericm on 8/14/2017.
 */
@Controller
public class EmployerController {
    public static EmployerListingEntity loggedInEmployer;
//    private int id;
//
//    @RequestMapping("/emplogin")
//    public String login() {
//        return "employerlogin";
//    }
//
//    @RequestMapping("/loginEmployer")
//    public ModelAndView loginEmployer(@RequestParam("user") String userName, @RequestParam("pass") String password) {
//
//        List<EmployerListingEntity> listResult = HibernateDao.getEmployerListingEntities(userName);
//
//        if(listResult.isEmpty()){
//            return new ModelAndView("emplogin","invalid","User does not exist, please register");
//        }
//
//        if (listResult.get(0).getContactEmail().equalsIgnoreCase(userName)) {
//            if (listResult.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {
//                loggedInEmployer = listResult.get(0);
//                return new ModelAndView("employerprofile", "employerProfile", listResult.get(0));
//            } else {
//                String alert = "Invalid password";
//                return new ModelAndView("emplogin", "invalid", alert);
//            }
//        }
//        String alert = "Invalid user name";
//        return new ModelAndView("emplogin", "invalid", alert);
//    }
//
//
}
