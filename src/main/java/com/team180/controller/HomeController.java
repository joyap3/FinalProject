package com.team180.controller;

/**
 * Created by Steve Suzio, Joya Puryear, Kurt Wunderlich, and Eric Mackey on 8/9/17.
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
//Homepage called and displays the user in the nav bar if logged in
    public ModelAndView helloWorld() {
        if (UserController.loggedInUser != null) {
            List<UsersEntity> getUser = hd.getUsersEntities(UserController.loggedInUser.getEmail());
            return new ModelAndView("welcome", "profile", getUser.get(0).getEmail());
        }
        if (EmployerController.loggedInEmployer != null) {
            List<EmployerListingEntity> getEmployer = hd.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("welcome", "profile", getEmployer.get(0).getContactEmail());
        }
        if (AdminController.loggedInAdmin != null) {
            List<AdminUsersEntity> getAdmin = hd.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("welcome", "profile", getAdmin.get(0).getEmail());
        } else {
            return new
                    ModelAndView("welcome", "profile", "Sign In");
        }
    }

    @RequestMapping("/login")
    /*If a specified user is already logged in it will return them to the profile page,
    otherwise it will return the login page and prompt them to log in*/
    public ModelAndView login(Model model) {

        if (AdminController.loggedInAdmin != null) {
            List<AdminUsersEntity> adminList = hd.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("admin", "adminUser", adminList.get(0));
        }
        if (UserController.loggedInUser != null) {
            List<UsersEntity> userList = hd.getUsersEntities(UserController.loggedInUser.getEmail());
            model.addAttribute("user", UserController.loggedInUser.getEmail());
            return new ModelAndView("userprofile", "userProfile", userList.get(0));
        }
        if (EmployerController.loggedInEmployer != null) {
            List<EmployerListingEntity> empList = hd.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            model.addAttribute("user", EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("employerprofile", "employerProfile", empList.get(0));
        }

        return new ModelAndView("login", "invalid", "Please log in or register");
    }

    @RequestMapping("/loginUser")
    /*
    When a user logs in the method will check through each list and match the entered username with the registered usernames
    in the database. If it is a match it checks passwords and returns the user to the specified profile.
     */
    public ModelAndView loginUser(Model model, @RequestParam("user") String userName, @RequestParam("pass") String password) {

        //checks if entered username is in the user table
        List<UsersEntity> userList = hd.getUsersEntities(userName);

        if (!userList.isEmpty() && userList.get(0).getEmail().equalsIgnoreCase(userName)) {
            if (userList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {

                UserController.loggedInUser = userList.get(0); //assigns the specified user from the query to loggedInUser
                EmployerController.loggedInEmployer = null; //logs out employer user if logged in previously
                AdminController.loggedInAdmin = null; //logs out admin user if logged in previously

                model.addAttribute("user", UserController.loggedInUser.getEmail());
                return new ModelAndView("userprofile", "userProfile", UserController.loggedInUser);
            } else {
                return new ModelAndView("login", "invalid", "Invalid password");
            }
        }

        //checks if entered employer is in the employer table
        List<EmployerListingEntity> employerList = hd.getEmployerListingEntities(userName);

        if (!employerList.isEmpty() && employerList.get(0).getContactEmail().equalsIgnoreCase(userName)) {
            if (employerList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {


                EmployerController.loggedInEmployer = employerList.get(0);
                AdminController.loggedInAdmin = null;
                UserController.loggedInUser = null;
                model.addAttribute("user", EmployerController.loggedInEmployer.getContactEmail());
                return new ModelAndView("employerprofile", "employerProfile", EmployerController.loggedInEmployer);
            } else {
                return new ModelAndView("login", "invalid", "Invalid Password");
            }
        }

        //checks if entered admin is in the admin table
        List<AdminUsersEntity> adminList = hd.getAdminEntities(userName);

        if (!adminList.isEmpty() && adminList.get(0).getEmail().equalsIgnoreCase(userName)) {
            if (adminList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {

                UserController.loggedInUser = null;
                EmployerController.loggedInEmployer = null;
                AdminController.loggedInAdmin = adminList.get(0);
                AdminController.isLoggedIn = true; //used in the admin controller so admin pages cannot be manually navigated to

                return new ModelAndView("admin", "adminUser", AdminController.loggedInAdmin);
            } else {
                return new ModelAndView("login", "invalid", "Invalid Password");
            }
        } else {
            return new ModelAndView("login", "invalid", "Invalid Username");
        }

    }

    @RequestMapping("/supportpage")
    /*
    Need to still build this page out but the goal is to connect users to outside resources to help them.
     */
    public ModelAndView goToSupportPage(Model model) {

        if (UserController.loggedInUser != null) {
            model.addAttribute("user", UserController.loggedInUser.getEmail());
            return new ModelAndView("supportpage", "", "");
        }
        if (EmployerController.loggedInEmployer != null) {
            model.addAttribute("user", EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("supportpage", "", "");
        }
        if (AdminController.loggedInAdmin != null) {
            model.addAttribute("user", AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("supportpage", "", "");
        }
        return new ModelAndView("supportpage", "user", "Sign In");
    }

    @RequestMapping("/logout")
    //sets any user to null and logs them out
    public ModelAndView logUserOut(Model model) {
        EmployerController.loggedInEmployer = null;
        UserController.loggedInUser = null;
        AdminController.loggedInAdmin = null;

        model.addAttribute("user", "Sign In");
        return new ModelAndView("logout", "", "");
    }
}




