package com.team180.DAO;

import com.team180.tables.AdminUsersEntity;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import com.team180.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;

public class HibernateDao implements Dao {

    public static Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session s = sessionFact.openSession();
        s.beginTransaction();
        return s;
    }

    public ArrayList<UsersEntity> displayUserList() {
//        Session s = getSession();
        Session s = HibernateUtil.getSession();

        Criteria c = s.createCriteria(UsersEntity.class);

        return (ArrayList<UsersEntity>) c.list();
    }
    public ArrayList<EmployerListingEntity> displayJobList() {
        Session s = getSession();
        Criteria j = s.createCriteria(EmployerListingEntity.class);

        return (ArrayList<EmployerListingEntity>) j.list();
    }

    public ArrayList<AdminUsersEntity> displayAdminList(){
        Session s = getSession();
        Criteria c = s.createCriteria(AdminUsersEntity.class);
        return (ArrayList<AdminUsersEntity>) c.list();
    }

    public List<UsersEntity> getUsersEntities(@RequestParam("user") String userName) {
        Session session = getSession();

        String hql = "FROM UsersEntity WHERE email= :username";

        Query getUserInfo = session.createQuery(hql);
        getUserInfo.setParameter("username",userName);

        return (List<UsersEntity>) getUserInfo.getResultList();
    }
    public List<AdminUsersEntity> getAdminEntities(@RequestParam("adminuser") String userName){
        Session session = getSession();

        String hql = "FROM AdminUsersEntity WHERE email= :username";

        Query getAdminInfo = session.createQuery(hql);
        getAdminInfo.setParameter("username",userName);

        return (List<AdminUsersEntity>) getAdminInfo.getResultList();
    }

    public List<EmployerListingEntity> getEmployerListingEntities(@RequestParam("user") String userName) {
        Session session = getSession();

        String hql = "FROM EmployerListingEntity WHERE contactEmail= :username";

        Query getUserInfo = session.createQuery(hql);
        getUserInfo.setParameter("username",userName);

        return (List<EmployerListingEntity>) getUserInfo.getResultList();
    }

    public List<EmployerListingEntity> displayRestrictedList(){

        String hql = "FROM EmployerListingEntity WHERE crimetype = 'violent'";
        Query getListing = getSession().createQuery(hql);
        return (List<EmployerListingEntity>) getListing.getResultList();
    }

    public ModelAndView validateEmail(@RequestParam("email") String email) {

        HibernateDao hd = new HibernateDao();

        ArrayList<UsersEntity> userList = hd.displayUserList();

        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getEmail().equalsIgnoreCase(email)) {
                String alert = "Email already taken, please enter alternate email.";
                return new ModelAndView("userregistration", "invalid", alert);
            }
        }
        return null;
    }
}
