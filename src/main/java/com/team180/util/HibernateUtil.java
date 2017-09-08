package com.team180.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {

    public static SessionFactory factory = buildSessionFactory();
    public static Session session = buildSession();

    public static SessionFactory buildSessionFactory(){

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        return cfg.buildSessionFactory();
    }

    public static SessionFactory getFactory(){
        return factory;
    }

    public static Session buildSession(){
        return factory.openSession();
    }

    public static Session getSession(){
        session.beginTransaction();
        return session;
    }
}
