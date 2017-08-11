package com.team180.controller;

import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;

/**
 * Created by joyapuryear on 8/9/17.
 */

@Controller
public class AdminController {

    private int id;

    @RequestMapping("/admin")
    public ModelAndView helloWorld() {
        return new
                ModelAndView("admin", "message", "Hello World");

    }

    @RequestMapping("/listusers")
    public ModelAndView listusers() {
        ArrayList<UsersEntity> userList = getAllUsers();


        return new ModelAndView("admin", "uList", userList);
    }

    //this method was extracted to be used again
    //this is a regular method and not a controller method

    private ArrayList<UsersEntity> getAllUsers() {
        //Configuration allows app to specify properties & mapping documents
        //to use when creating the SessionFactory

        Configuration config = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = config.buildSessionFactory();

        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        Criteria u = selectUsers.createCriteria(UsersEntity.class);
        return (ArrayList<UsersEntity>) u.list();
    }

    @RequestMapping("/listjobs")
    public ModelAndView listjobs() {
        ArrayList<EmployerListingEntity> jobList = getAllJobs();


        return new ModelAndView("admin", "jList", jobList);
    }

    //this method was extracted to be used again
    //this is a regular method and not a controller method

    private ArrayList<EmployerListingEntity> getAllJobs() {
        //Configuration allows app to specify properties & mapping documents
        //to use when creating the SessionFactory

        Configuration config = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = config.buildSessionFactory();

        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        Criteria j = selectUsers.createCriteria(EmployerListingEntity.class);
        return (ArrayList<EmployerListingEntity>) j.list();
    }



    @RequestMapping("/updatecrimetype")
    public ModelAndView updateUserAdmin(Model model, @RequestParam("id")int id){

        this.id = id;

        Session s = UserController.getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class,id);

        model.addAttribute("firstName",temp.getFirstName());
        model.addAttribute("middleName", temp.getMiddleName());
        model.addAttribute("lastName",temp.getLastName());
        model.addAttribute("birthday",temp.getBirthday());
        model.addAttribute("address", temp.getAddress());
        model.addAttribute("phoneNumber", temp.getPhoneNumber());
        model.addAttribute("zip", temp.getZip());
        model.addAttribute("email", temp.getEmail());
        model.addAttribute("password",temp.getPassword());
        model.addAttribute("skillSet", temp.getSkillset());

        return new ModelAndView("viewapi","","");
    }

    @RequestMapping("/crimetype")
    public ModelAndView editCrimetype(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                      @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                      @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                      @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("skillSet") String skillSet, @RequestParam("crimetype") Byte crime) {

        Session editCrimetype = UserController.getSession();

        //temp object will store infor for the object we want to delete.
        UsersEntity temp = editCrimetype.get(UsersEntity.class,id);

        temp.setFirstName(fname);
        temp.setMiddleName(midName);
        temp.setLastName(lname);
        temp.setBirthday(bday);
        temp.setAddress(address);
        temp.setZip(zip);
        temp.setPhoneNumber(phoneNum);
        temp.setEmail(email);
        temp.setPassword(password);
        temp.setSkillset(skillSet);
        temp.setCrimetype(crime);

        editCrimetype.save(temp);
        editCrimetype.getTransaction().commit();
        editCrimetype.close();

        ArrayList<UsersEntity> userList = getAllUsers();


        return new ModelAndView("admin", "uList", userList);
    }

    @RequestMapping("/searchForUser")
    public ModelAndView searchUser(@RequestParam("firstName") String firstName){
//                                   @RequestParam("email") String email,
//                                   @RequestParam("lastName") String lastName)

        Configuration config = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = config.buildSessionFactory();
        Session selectUsers = sessionFact.openSession();
        selectUsers.beginTransaction();

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

        Configuration config = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = config.buildSessionFactory();
        Session deleteUsers = sessionFact.openSession();
        deleteUsers.beginTransaction();

        deleteUsers.delete(temp);//delete the object from the list
        deleteUsers.getTransaction().commit();//deletes the row from the database table

        ArrayList<UsersEntity> userList = getAllUsers();


        return new ModelAndView("admin", "uList", userList);
    }



    @RequestMapping("/deletejob")
    public ModelAndView deleteJob(@RequestParam("id") int id) {
        //temp object will store infor for the object we want to delete.
        EmployerListingEntity temp = new EmployerListingEntity();
        temp.setJobId(id);

        Configuration config = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = config.buildSessionFactory();
        Session deleteJob = sessionFact.openSession();
        deleteJob.beginTransaction();

        deleteJob.delete(temp);//delete the object from the list
        deleteJob.getTransaction().commit();//deletes the row from the database table

        ArrayList<EmployerListingEntity> jobList = getAllJobs();


        return new ModelAndView("admin", "jList", jobList);
    }
}
