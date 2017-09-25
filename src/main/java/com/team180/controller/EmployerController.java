package com.team180.controller;

import com.team180.DAO.HibernateDao;
import com.team180.Encryption.PasswordMD5Encrypt;
import com.team180.tables.EmployerListingEntity;
import com.team180.util.HibernateUtil;
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
    HibernateDao hd = new HibernateDao();


    @RequestMapping("/registerEmployer")
    //redirects the user to the register employer view page
    public ModelAndView registerEmployer(){

        if(loggedInEmployer != null) {
            return new ModelAndView("employerregistration", "user", loggedInEmployer.getContactEmail());
        }if(UserController.loggedInUser != null){
            return new ModelAndView("employerregistration","user",UserController.loggedInUser.getEmail());
        }else{
            return new ModelAndView("employerregistration","user","Sign In");
        }
    }

    @RequestMapping("/insertEmployer")
    //Creates a new employer in the employer table in the DB
    public ModelAndView registerEmployer(Model model, @RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
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
        ModelAndView alert = hd.validateEmail(email); //checks to see if email is already taken
        if (alert != null) {
            return alert;
        }
        newEmployer.setContactEmail(email);
        newEmployer.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(password));

        s.save(newEmployer);
        s.getTransaction().commit();
        s.close();

        List<EmployerListingEntity> employerList = hd.getEmployerListingEntities(email);
        loggedInEmployer = employerList.get(0);

        model.addAttribute(loggedInEmployer.getContactEmail());

        return new ModelAndView("employerprofile", "employerProfile", employerList.get(0)) ;
    }

@RequestMapping("/updateEmployerInfo")
//gets the employer information that matches the current logged in employer and directs them to the update page
public ModelAndView update(Model model, @RequestParam("id") int id) {
    this.id = id;

    Session s = HibernateDao.getSession();

    EmployerListingEntity temp = (EmployerListingEntity) s.get(EmployerListingEntity.class, id);

    List<EmployerListingEntity> userList = hd.getEmployerListingEntities(temp.getContactEmail());

    model.addAttribute("user",loggedInEmployer.getContactEmail());

    return new ModelAndView("updateemployerinfo", "employerProfile", userList.get(0));
}

    @RequestMapping("/updateemployer")
    //user can edit their registered information to update their current information
    public ModelAndView updateItem(Model model, @RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
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

        List<EmployerListingEntity> listResult = hd.getEmployerListingEntities(email);
        model.addAttribute("user",loggedInEmployer.getContactEmail());

        return new ModelAndView("employerprofile", "employerProfile", listResult.get(0));
    }

    @RequestMapping("/makenewjob")
    public ModelAndView makeNewJob(Model model){

    model.addAttribute("user",loggedInEmployer.getContactEmail());

    return new ModelAndView("addnewjob","","");
    }

    @RequestMapping("/addajob")
    //Employer can create a new job posting where the system will automatically set the current email and password for the logged in user.
    public ModelAndView addAjob(Model model, @RequestParam("company") String company, @RequestParam("jobTitle") String jTitle,
                                @RequestParam("contactName") String cName, @RequestParam("contactPhone") String cPhone,
                                @RequestParam("jobDescription") String jDescription,
                                @RequestParam("crimetype") String cType){
    Session s = HibernateDao.getSession();

    EmployerListingEntity addJob = new EmployerListingEntity();
    addJob.setCompany(company);
    addJob.setJobTitle(jTitle);
    addJob.setContactName(cName);
    addJob.setContactEmail(loggedInEmployer.getContactEmail()); //already registered in DB so auto sets to current logged in user.
    addJob.setContactPhone(cPhone);
    addJob.setJobDescription(jDescription);
    addJob.setPassword(PasswordMD5Encrypt.PasswordMD5Encrypt(loggedInEmployer.getPassword())); //sets to current logged in users password
    addJob.setCrimetype(cType);

    s.save(addJob);
    s.getTransaction().commit();
    s.close();

    model.addAttribute("user",loggedInEmployer.getContactEmail());

        List<EmployerListingEntity> jobList = hd.getEmployerListingEntities(loggedInEmployer.getContactEmail());
        return new ModelAndView("success", "successMessage", "Success! Your job has been posted!");
    }


    @RequestMapping("/viewjoblistings")
    //the query will get all jobs listed by the employer and display them in a formatted table
    public ModelAndView viewJobListings(Model model){
        List<EmployerListingEntity> jobList = hd.getEmployerListingEntities(loggedInEmployer.getContactEmail());

        model.addAttribute("user",loggedInEmployer.getContactEmail());

        return new ModelAndView("employerjoblistings","jobList",jobList);
    }
}
