package com.team180.controller;

import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.AdminUsersEntity;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
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
 * Created by joyapuryear on 8/9/17.
 */

@Controller
public class AdminController {
    private AdminUsersEntity loggedInAdmin;
    private int id;

    @RequestMapping("/admin")
    public ModelAndView helloWorld() {
        if (loggedInAdmin != null) {

            return new
                    ModelAndView("admin", "message", "Felon Search");
        }else
            return new ModelAndView("adminlogin","","");
    }



    @RequestMapping("/loginadmin")
    public ModelAndView loginAdmin(@RequestParam ("user") String adminUser, @RequestParam("password")String adminPassword) {
        List<AdminUsersEntity> adminUsers = HibernateDao.getAdminEntities(adminUser);
        if (adminUsers.isEmpty()) {
            return new ModelAndView("adminlogin", "invalid", "Not a registered Administrator");
        }
        if (adminUsers.get(0).getEmail().equalsIgnoreCase(adminUser)) {
            if (adminUsers.get(0).getPassword().equals(adminPassword)) {
                loggedInAdmin = adminUsers.get(0);
                return new ModelAndView("admin", "", "");
            } else {
                return new ModelAndView("adminlogin", "invalid", "Invalid Password");
            }
        }
            return new ModelAndView("adminlogin", "invalid", "Invalid Admin username");


    }

    @RequestMapping("/listusers")
    public ModelAndView listusers() {
        ArrayList<UsersEntity> userList = HibernateDao.displayUserList();

        return new ModelAndView("adminviewusers", "uList", userList);
    }

    //this method was extracted to be used again
    //this is a regular method and not a controller method

    @RequestMapping("/listjobs")
    public ModelAndView listjobs() {
        ArrayList<EmployerListingEntity> jobList = HibernateDao.displayJobList();


        return new ModelAndView("adminviewjobs", "jList", jobList);
    }

    //this method was extracted to be used again
    //this is a regular method and not a controller method


    @RequestMapping("/updatecrimetype")
    public ModelAndView updateUserAdmin(Model model, @RequestParam("id") int id) {

        this.id = id;

        Session s = HibernateDao.getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class, id);

        List<UsersEntity> userList = HibernateDao.getUsersEntities(temp.getEmail());

        return new ModelAndView("viewapi", "userProfile", userList.get(0));
    }

    @RequestMapping("/crimetype")
    public ModelAndView editCrimetype(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                      @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                      @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                      @RequestParam("email") String email, @RequestParam("skillSet") String skillSet, @RequestParam("crimetype") String crime) {

        Session editCrimetype = HibernateDao.getSession();

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

        ArrayList<UsersEntity> userList = HibernateDao.displayUserList();


        return new ModelAndView("adminviewusers", "uList", userList);
    }

    @RequestMapping("/searchForUser")
    public ModelAndView searchUser(@RequestParam("firstName") String firstName) {
//                                   @RequestParam("email") String email,
//                                   @RequestParam("lastName") String lastName)

        Session selectUsers = HibernateDao.getSession();

        Criteria c = selectUsers.createCriteria(UsersEntity.class);

        c.add(Restrictions.like("firstName", "%" + firstName + "%"));
//        c.add(Restrictions.like("lastName", "%" + lastName + "%"));
//        c.add(Restrictions.like("email", "%" + email + "%"));

        ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.list();

        return new ModelAndView("admin", "uList", userList);
    }

    @RequestMapping("/deleteuser")
    public ModelAndView deleteUser(@RequestParam("id") int id) {
        //temp object will store infor for the object we want to delete.
        UsersEntity temp = new UsersEntity();
        temp.setIdUsers(id);

        Session deleteUsers = HibernateDao.getSession();

        deleteUsers.delete(temp);//delete the object from the list
        deleteUsers.getTransaction().commit();//deletes the row from the database table

        ArrayList<UsersEntity> userList = HibernateDao.displayUserList();


        return new ModelAndView("adminviewusers", "uList", userList);
    }


    @RequestMapping("/deletejob")
    public ModelAndView deleteJob(@RequestParam("id") int id) {
        //temp object will store infor for the object we want to delete.
        EmployerListingEntity temp = new EmployerListingEntity();
        temp.setJobId(id);

        Session deleteJob = HibernateDao.getSession();

        deleteJob.delete(temp);//delete the object from the list
        deleteJob.getTransaction().commit();//deletes the row from the database table

        ArrayList<EmployerListingEntity> jobList = HibernateDao.displayJobList();


        return new ModelAndView("adminviewjobs", "jList", jobList);
    }
}
