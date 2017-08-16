package com.team180.controller;

import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private int id;
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
@RequestMapping("/updateEmployerInfo")
public ModelAndView update(Model model, @RequestParam("id") int id) {
    this.id = id;

    Session s = HibernateDao.getSession();

    EmployerListingEntity temp = (EmployerListingEntity) s.get(EmployerListingEntity.class, id);

    List<EmployerListingEntity> userList = HibernateDao.getEmployerListingEntities(temp.getContactEmail());

    return new ModelAndView("updateemployerinfo", "employerProfile", userList.get(0));
}

    @RequestMapping("/updateemployer")
    public ModelAndView updateItem(@RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                                   @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                                   @RequestParam("contactEmail") String email, @RequestParam("jobDescription") String jDescription,
                                   @RequestParam("crimetype") String cType) {

        Session s = HibernateDao.getSession();

        EmployerListingEntity temp = (EmployerListingEntity) s.get(EmployerListingEntity.class, id);
        temp.setCompany(company);
        temp.setJobTitle(jTitle);
        temp.setContactName(cName);
        temp.setContactPhone(cPhone);
        temp.setContactEmail(email);
        temp.setJobDescription(jDescription);
        temp.setCrimetype(cType);


        s.update(temp);
        s.getTransaction().commit();
        s.close();

        List<EmployerListingEntity> listResult = HibernateDao.getEmployerListingEntities(email);


        return new ModelAndView("employerprofile", "employerProfile", listResult.get(0));
    }
}
