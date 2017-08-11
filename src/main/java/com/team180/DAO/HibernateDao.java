package com.team180.DAO;

import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;

public class HibernateDao {

    public static Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session s = sessionFact.openSession();
        s.beginTransaction();
        return s;
    }

    public static ArrayList<UsersEntity> displayUserList() {
        Session s = getSession();
        Criteria c = s.createCriteria(UsersEntity.class);

        return (ArrayList<UsersEntity>) c.list();
    }
    public static ArrayList<EmployerListingEntity> displayJobList() {
        //Configuration allows app to specify properties & mapping documents
        //to use when creating the SessionFactory

        Session s = getSession();

        Criteria j = s.createCriteria(EmployerListingEntity.class);

        return (ArrayList<EmployerListingEntity>) j.list();
    }

    public static List<UsersEntity> getUsersEntities(@RequestParam("user") String userName) {
        Session session = getSession();

        String hql = "FROM UsersEntity WHERE email= :username";

        Query getUserInfo = session.createQuery(hql);
        getUserInfo.setParameter("username",userName);

        return (List<UsersEntity>) getUserInfo.getResultList();
    }

    public static ModelAndView validateEmail(@RequestParam("email") String email) {

        ArrayList<UsersEntity> userList = HibernateDao.displayUserList();

        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getEmail().equalsIgnoreCase(email)) {
                String alert = "Email already taken, please enter alternate email.";
                return new ModelAndView("userregistration", "invalid", alert);
            }
        }
        return null;
    }
}
