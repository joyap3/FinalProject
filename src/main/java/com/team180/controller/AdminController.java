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

    @RequestMapping("/crimetype")
    public ModelAndView editCrimetype(@RequestParam("crime") Byte crime) {
        //temp object will store infor for the object we want to delete.
        UsersEntity temp = new UsersEntity();
        temp.setCrimetype(crime);

        Configuration config = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = config.buildSessionFactory();
        Session editCrimetype = sessionFact.openSession();
        editCrimetype.beginTransaction();

        editCrimetype.save(temp);
        editCrimetype.getTransaction().commit();

        ArrayList<EmployerListingEntity> userList = getAllJobs();


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
