package com.team180.controller;


import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.sql.Date;
import java.util.List;

@Controller
public class UserController {

    public static UsersEntity loggedInUser;

    private int id;


    @RequestMapping("/updateUserInfo")
    public ModelAndView update(Model model, @RequestParam ("id")int id){
        this.id = id;

        Session s = HibernateDao.getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class,id);

        List<UsersEntity> userList = HibernateDao.getUsersEntities(temp.getEmail());

        model.addAttribute("user",loggedInUser.getEmail());

        return new ModelAndView("updateuserinfo","userProfile",userList.get(0));
    }
    @RequestMapping("/update")
    public ModelAndView updateItem(Model model, @RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                   @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                   @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                   @RequestParam("email") String email, @RequestParam("skillSet") String skillSet){

        Session s = HibernateDao.getSession();

        UsersEntity temp = (UsersEntity) s.get(UsersEntity.class,id);
        temp.setFirstName(fname);
        temp.setMiddleName(midName);
        temp.setLastName(lname);
        temp.setBirthday(bday);
        temp.setAddress(address);
        temp.setZip(zip);
        temp.setPhoneNumber(phoneNum);
        temp.setEmail(email);
        temp.setSkillset(skillSet);

        s.update(temp);
        s.getTransaction().commit();
        s.close();

        List<UsersEntity> listResult = HibernateDao.getUsersEntities(email);

        model.addAttribute("user",loggedInUser.getEmail());

        return new ModelAndView("userprofile","userProfile",listResult.get(0));
    }

    @RequestMapping("/viewJobBoard")
    public ModelAndView viewJobBoard(Model model){

        if(loggedInUser != null){

            model.addAttribute("user",loggedInUser.getEmail());

            if (loggedInUser.getCrimetype() == null){
                String message = "Your profile is under review, please check back in 24-48 hours";

                return new ModelAndView("viewjobboard","message",message);
            }
            if(loggedInUser.getCrimetype().equalsIgnoreCase("violent")){
                List<EmployerListingEntity> restrictedJobs = HibernateDao.displayRestrictedList();
                return new ModelAndView("viewjobboard","restricted",restrictedJobs);
            }
            else{
                List<EmployerListingEntity> unrestrictedJobs = HibernateDao.displayJobList();
                return new ModelAndView("viewjobboard","unrestricted",unrestrictedJobs);
            }
        }else{

            return new ModelAndView("login","Invalid","Must be registered to view jobs");
        }

    }



}
