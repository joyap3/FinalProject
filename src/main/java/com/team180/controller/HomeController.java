package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */


import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.AdminUsersEntity;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

HibernateDao hd = new HibernateDao();

    @RequestMapping("/")
/**
 * This function does
 */
    public ModelAndView helloWorld() {
        if(UserController.loggedInUser != null){
            List<UsersEntity> getUser = hd.getUsersEntities(UserController.loggedInUser.getEmail());
            return new ModelAndView("welcome","profile",getUser.get(0).getEmail());
        }
        if(EmployerController.loggedInEmployer != null){
            List<EmployerListingEntity> getEmployer = hd.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("welcome", "profile",getEmployer.get(0).getContactEmail());
        }
        if (AdminController.loggedInAdmin != null) {
            List<AdminUsersEntity> getAdmin = hd.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("welcome","profile",getAdmin.get(0).getEmail());
        }else {
            return new
                    ModelAndView("welcome", "profile", "Sign In");
        }
    }

    private int id;

    @RequestMapping("/login")
    public ModelAndView login(Model model) {
        if (AdminController.loggedInAdmin != null){
            List<AdminUsersEntity> adminList = hd.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("admin","adminUser",adminList.get(0));
        }
        if (UserController.loggedInUser != null){
            List<UsersEntity> userList = hd.getUsersEntities(UserController.loggedInUser.getEmail());
            model.addAttribute("user",UserController.loggedInUser.getEmail());
           return new ModelAndView("userprofile", "userProfile", userList.get(0));
        }
        if(EmployerController.loggedInEmployer != null){
            List<EmployerListingEntity> empList = hd.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            model.addAttribute("user",EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("employerprofile", "employerProfile",empList.get(0));
        }

        return new ModelAndView("login", "invalid", "Please log in or register");
    }

    @RequestMapping("/loginUser")
    public ModelAndView loginUser(Model model, @RequestParam("user") String userName, @RequestParam("pass") String password) {

        if(AdminController.loggedInAdmin != null){
            model.addAttribute("user",AdminController.loggedInAdmin.getFirstName());
            return new ModelAndView("admin","adminUser", hd.getAdminEntities(AdminController.loggedInAdmin.getEmail()).get(0));
        }

        List<UsersEntity> userList = hd.getUsersEntities(userName);

        if(userList.isEmpty()){

            List<EmployerListingEntity> employerList = hd.getEmployerListingEntities(userName);

            if(employerList.isEmpty()){
                return new ModelAndView("login","invalid","User does not exist, please register");
            }
            if (employerList.get(0).getContactEmail().equalsIgnoreCase(userName)) {
                if (employerList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {


                    EmployerController.loggedInEmployer = employerList.get(0);
                    AdminController.loggedInAdmin = null;
                    UserController.loggedInUser = null;
                    model.addAttribute("user",EmployerController.loggedInEmployer.getContactEmail());
                    return new ModelAndView("employerprofile", "employerProfile", EmployerController.loggedInEmployer);
                } else {
                    String alert = "Invalid password";
                    return new ModelAndView("login", "invalid", alert);
                }
            }
            String alert = "Invalid user name";

            return new ModelAndView("login","invalid",alert);
        }
        if (userList.get(0).getEmail().equalsIgnoreCase(userName)) {
            if (userList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {


                UserController.loggedInUser = userList.get(0);
                EmployerController.loggedInEmployer = null;
                AdminController.loggedInAdmin = null;

                model.addAttribute("user",UserController.loggedInUser.getEmail());
                return new ModelAndView("userprofile", "userProfile", UserController.loggedInUser);
            } else {

                return new ModelAndView("login", "invalid", "Invalid password");
            }
        }
        return new ModelAndView("login", "invalid", "Invalid user name");
    }

    @RequestMapping("/supportpage")
    public ModelAndView goToSupportPage(Model model){

        if(UserController.loggedInUser != null){
            model.addAttribute("user", UserController.loggedInUser.getEmail());
            return new ModelAndView("supportpage", "","");
        }
        if(EmployerController.loggedInEmployer != null){
            model.addAttribute("user", EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("supportpage", "","");
        }
        if(AdminController.loggedInAdmin != null){
            model.addAttribute("user", AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("supportpage", "","");
        }
        return new ModelAndView( "supportpage","user","Sign In");
    }

    @RequestMapping("/logout")
    public ModelAndView logUserOut(Model model){
        EmployerController.loggedInEmployer = null;
        UserController.loggedInUser = null;
        AdminController.loggedInAdmin = null;

        model.addAttribute("user","Sign In");
        return new ModelAndView("logout","","");
    }
}




