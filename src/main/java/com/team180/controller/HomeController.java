package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */


import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.AdminUsersEntity;
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
public class HomeController {



    @RequestMapping("/")

    public ModelAndView helloWorld() {
        if(UserController.loggedInUser != null){
            List<UsersEntity> getUser = HibernateDao.getUsersEntities(UserController.loggedInUser.getEmail());
            return new ModelAndView("welcome","profile",getUser.get(0).getEmail());
        }
        if(EmployerController.loggedInEmployer != null){
            List<EmployerListingEntity> getEmployer = HibernateDao.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("welcome", "profile",getEmployer.get(0).getContactEmail());
        }
        if (AdminController.loggedInAdmin != null) {
            List<AdminUsersEntity> getAdmin = HibernateDao.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("welcome","profile",getAdmin.get(0).getEmail());
        }
        return new
                ModelAndView("welcome", "profile", "Sign In");

    }



    //public static EmployerListingEntity loggedInEmployer;
    private int id;

    @RequestMapping("/login")
    public ModelAndView login() {
        if (AdminController.loggedInAdmin != null){
            List<AdminUsersEntity> adminList = HibernateDao.getAdminEntities(AdminController.loggedInAdmin.getEmail());
            return new ModelAndView("admin","adminUser",adminList.get(0));
        }
        if (UserController.loggedInUser != null){
            List<UsersEntity> userList = HibernateDao.getUsersEntities(UserController.loggedInUser.getEmail());
           return new ModelAndView("userprofile", "userProfile", userList.get(0));
        }
        if(EmployerController.loggedInEmployer != null){
            List<EmployerListingEntity> empList = HibernateDao.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());
            return new ModelAndView("employerprofile", "employerProfile",empList.get(0));
        }

        return new ModelAndView("login", "invalid", "Please log in or register");
    }

    @RequestMapping("/loginUser")
    public ModelAndView loginUser(@RequestParam("user") String userName, @RequestParam("pass") String password) {

        List<UsersEntity> userList = HibernateDao.getUsersEntities(userName);

        if(userList.isEmpty()){
            List<EmployerListingEntity> listResult = HibernateDao.getEmployerListingEntities(userName);

            if(listResult.isEmpty()){
                return new ModelAndView("login","invalid","User does not exist, please register");
            }

            if (listResult.get(0).getContactEmail().equalsIgnoreCase(userName)) {
                if (listResult.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {
                    EmployerController.loggedInEmployer = listResult.get(0);
                    AdminController.loggedInAdmin = null;
                    UserController.loggedInUser = null;
                    return new ModelAndView("employerprofile", "employerProfile", listResult.get(0));
                } else {
                    String alert = "Invalid password";
                    return new ModelAndView("login", "invalid", alert);
                }
            }
            String alert = "Invalid user name";

            return new ModelAndView("login","invalid",alert);
        }

        if (userList.get(0).getEmail().equalsIgnoreCase(userName)) {
            if (userList.get(0).getPassword().equals(PasswordMD5Encrypt.PasswordMD5Encrypt(password))) {
                UserController.loggedInUser = userList.get(0);
                EmployerController.loggedInEmployer = null;
                AdminController.loggedInAdmin = null;
                return new ModelAndView("userprofile", "userProfile", userList.get(0));
            } else {
                String alert = "Invalid password";
                return new ModelAndView("login", "invalid", alert);
            }
        }
        String alert = "Invalid user name";
        return new ModelAndView("login", "invalid", alert);
    }



    @RequestMapping("/registerUser")

    public String registerUser() {

        return "userregistration";
    }

    @RequestMapping("/registerJob")

    public String registerJob() {

        return "registerjob";
    }

    @RequestMapping("/registerEmployer")//This is removed if it doesnt work.
    public String registerEmployer(){

        return "employerregistration";
    }
    @RequestMapping("/supportpage")
    public String goToSupportPage(){
        return "supportpage";
    }


    @RequestMapping("/insertUser")

    public ModelAndView registerUser(@RequestParam("firstName") String fname, @RequestParam("lastName") String lname,
                                     @RequestParam("middleName") String midName, @RequestParam("birthday") Date bday,
                                     @RequestParam("address") String address, @RequestParam("zip") int zip, @RequestParam("phoneNumber") String phoneNum,
                                     @RequestParam("email") String email, @RequestParam("password") String password,
                                     @RequestParam("skillSet") String skillSet) {

        Session s = HibernateDao.getSession();

        UsersEntity newUser = new UsersEntity();

        newUser.setFirstName(fname);
        newUser.setMiddleName(midName);
        newUser.setLastName(lname);
        newUser.setBirthday(bday);
        newUser.setAddress(address);
        newUser.setZip(zip);
        newUser.setPhoneNumber(phoneNum);

        ModelAndView alert = HibernateDao.validateEmail(email);
            if (alert != null) {
                return alert;
            }

        newUser.setEmail(email);
        newUser.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));
        newUser.setSkillset(skillSet);

        s.save(newUser);
        s.getTransaction().commit();
        s.close();

        List<UsersEntity> userList = HibernateDao.getUsersEntities(email);
        UserController.loggedInUser = userList.get(0);
        return new
                ModelAndView("userprofile", "userProfile", userList.get(0));
    }

    @RequestMapping("/insertJob")

    public ModelAndView registerJob(Model model, @RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                                    @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                                    @RequestParam("email") String email, @RequestParam("jobDescription") String jDescription,
                                    @RequestParam("crimetype") String cType) {

        Session s = HibernateDao.getSession();
        EmployerListingEntity jobListing = new EmployerListingEntity();

        jobListing.setCompany(company);
        jobListing.setJobTitle(jTitle);
        jobListing.setContactName(cName);
        jobListing.setContactPhone(cPhone);
        jobListing.setContactEmail(email);
        jobListing.setJobDescription(jDescription);
        jobListing.setCrimetype(cType);

        s.save(jobListing);
        s.getTransaction().commit();
        s.close();

        List<EmployerListingEntity> empList = HibernateDao.getEmployerListingEntities(EmployerController.loggedInEmployer.getContactEmail());

        model.addAttribute("empuser",empList.get(0).getContactEmail());


        return new ModelAndView("success","successMessage","Success! Your job has been posted!");
    }

    @RequestMapping("/insertEmployer")//this was also added and might need to be removed

    public ModelAndView registerEmployer(@RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                                         @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                                         @RequestParam("contactEmail") String email, @RequestParam("jobDescription") String jDescription,
                                         @RequestParam("crimetype") String cType, @RequestParam("password") String password) {

        Session s = HibernateDao.getSession();

        EmployerListingEntity newEmployer = new EmployerListingEntity();

        newEmployer.setCompany(company);
        newEmployer.setJobTitle(jTitle);
        newEmployer.setContactName(cName);
        newEmployer.setContactPhone(cPhone);
        newEmployer.setJobDescription(jDescription);
        newEmployer.setCrimetype(cType);


        ModelAndView alert = HibernateDao.validateEmail(email);
        if (alert != null) {
            return alert;
        }

        newEmployer.setContactEmail(email);
        newEmployer.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));

        s.save(newEmployer);
        s.getTransaction().commit();
        s.close();

        List<EmployerListingEntity> employerList = HibernateDao.getEmployerListingEntities(email);
        EmployerController.loggedInEmployer = employerList.get(0);

        return new ModelAndView("employerprofile", "employerProfile", employerList.get(0)) ;
    }

}




