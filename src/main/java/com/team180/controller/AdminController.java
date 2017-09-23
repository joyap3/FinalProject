package com.team180.controller;

import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.AdminUsersEntity;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import com.team180.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Steve Suzio, Joya Puryear, Kurt Wunderlich, and Eric Mackey on 8/9/17.
 */

@Controller
public class AdminController {

    public static AdminUsersEntity loggedInAdmin;
    public static boolean isLoggedIn = false;
    private int id;
    HibernateDao hd = new HibernateDao();

    @RequestMapping("/admin")
    public ModelAndView helloWorld(Model model) {
        if (loggedInAdmin != null) {
            isLoggedIn = true;
            model.addAttribute("user",loggedInAdmin.getFirstName());
            return new
                    ModelAndView("admin", "adminUser", hd.getAdminEntities(loggedInAdmin.getEmail()).get(0));
        }else
            return new ModelAndView("login","invalid","Please Log In");
    }

    @RequestMapping("/listusers")
    public ModelAndView listusers(Model model) {
        if (isLoggedIn) {
            model.addAttribute("user",loggedInAdmin.getFirstName());
            ArrayList<UsersEntity> userList = hd.displayUserList();

            return new ModelAndView("adminviewusers", "uList", userList);
        }else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }

    @RequestMapping("/listjobs")
    public ModelAndView listjobs(Model model) {
        if(isLoggedIn) {

            model.addAttribute("user", loggedInAdmin.getFirstName());

            ArrayList<EmployerListingEntity> jobList = hd.displayJobList();
            return new ModelAndView("adminviewjobs", "jList", jobList);
        }
        else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }
    @RequestMapping("/viewcriminalresults")
    public ModelAndView viewCriminalResult(){
        if(isLoggedIn) {
            return new ModelAndView("criminalresult","user",loggedInAdmin.getFirstName());
        }
        else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }

    @RequestMapping("/updatecrimetype")
    public ModelAndView updateUserAdmin(Model model, @RequestParam("id") int id) {
        if (isLoggedIn) {
            this.id = id;

            Session s = HibernateUtil.getSession();
            UsersEntity temp = (UsersEntity) s.get(UsersEntity.class, id);
            List<UsersEntity> userList = hd.getUsersEntities(temp.getEmail());

            model.addAttribute("user", loggedInAdmin.getFirstName());

            return new ModelAndView("viewapi", "userProfile", userList.get(0));
        }else {
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }

    @RequestMapping("/crimetype")
    public ModelAndView editCrimetype(Model model,@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                      @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                      @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                      @RequestParam("email") String email, @RequestParam("skillSet") String skillSet, @RequestParam("crimetype") String crime) {
        if (isLoggedIn) {
            Session editCrimetype = HibernateUtil.getSession();

            //temp object will store infor for the object we want to delete.
            UsersEntity temp = editCrimetype.get(UsersEntity.class, id);

            temp.setFirstName(fname);
            temp.setMiddleName(midName);
            temp.setLastName(lname);
            temp.setBirthday(bday);
            temp.setAddress(address);
            temp.setZip(zip);
            temp.setPhoneNumber(phoneNum);
            temp.setEmail(email);
            temp.setSkillset(skillSet);
            temp.setCrimetype(crime);

            editCrimetype.update(temp);
            editCrimetype.getTransaction().commit();
            editCrimetype.close();

            ArrayList<UsersEntity> userList = hd.displayUserList();

            model.addAttribute("user",loggedInAdmin.getFirstName());

            return new ModelAndView("adminviewusers", "uList", userList);
        } else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }
    @RequestMapping ("/goToRegisterAdmin")
    public ModelAndView goToRegisterAdmin(Model model){
        if(isLoggedIn){
            model.addAttribute("user", loggedInAdmin.getFirstName());
            return new ModelAndView("registeradmin","user",loggedInAdmin.getFirstName());
        }
        else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }

    @RequestMapping ("/registerAdmin")
    public ModelAndView registerAdmin(Model model,@RequestParam("firstName")String firstName, @RequestParam("lastName")String lastName,
                                      @RequestParam("email")String email,@RequestParam("password")String password){
        if (isLoggedIn) {
            Session s = HibernateUtil.getSession();

            AdminUsersEntity adminUser = new AdminUsersEntity();

            adminUser.setFirstName(firstName);
            adminUser.setLastName(lastName);
            adminUser.setEmail(email);
            adminUser.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));

            s.save(adminUser);
            s.getTransaction().commit();
            s.close();

            model.addAttribute("user",loggedInAdmin.getFirstName());

            String success = "Success! New admin has been created. Please log out to continue as new admin";

            return new ModelAndView("success", "successMessage", success);
        }else{
            return new ModelAndView("adminlogin", "invalid","Please Log In");
        }
    }

    @RequestMapping("/searchForUser")
    public ModelAndView searchUser(Model model,@RequestParam("firstName") String firstName) {

        if(isLoggedIn) {
            Session selectUsers = HibernateUtil.getSession();
            Criteria c = selectUsers.createCriteria(UsersEntity.class);
            c.add(Restrictions.like("firstName", "%" + firstName + "%"));
//        c.add(Restrictions.like("lastName", "%" + lastName + "%"));
//        c.add(Restrictions.like("email", "%" + email + "%"));

            ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.list();

            model.addAttribute("user",loggedInAdmin.getFirstName());

            return new ModelAndView("admin", "uList", userList);
        }else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }

    @RequestMapping("/deleteuser")
    public ModelAndView deleteUser(Model model, @RequestParam("id") int id) {
        if (isLoggedIn) {

            UsersEntity temp = new UsersEntity();
            temp.setIdUsers(id);
            Session deleteUsers = HibernateUtil.getSession();
            deleteUsers.delete(temp);
            deleteUsers.getTransaction().commit();
            ArrayList<UsersEntity> userList = hd.displayUserList();

            model.addAttribute("user",loggedInAdmin.getFirstName());

            return new ModelAndView("adminviewusers", "uList", userList);
        }
        else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }


    @RequestMapping("/deletejob")
    public ModelAndView deleteJob(@RequestParam("id") int id) {
        if (isLoggedIn) {

            EmployerListingEntity temp = new EmployerListingEntity();
            temp.setJobId(id);
            Session deleteJob = HibernateUtil.getSession();
            deleteJob.delete(temp);
            deleteJob.getTransaction().commit();

            ArrayList<EmployerListingEntity> jobList = hd.displayJobList();

            return new ModelAndView("adminviewjobs", "jList", jobList);
        }else{
            return new ModelAndView("adminlogin","invalid","Please Log In");
        }
    }
}
