package com.team180.DAO;

import com.team180.tables.AdminUsersEntity;
import com.team180.tables.EmployerListingEntity;
import com.team180.tables.UsersEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

public interface Dao {

    //Basic CRUD methods used

    ArrayList<UsersEntity> displayUserList();

    ArrayList<EmployerListingEntity> displayJobList();

    ArrayList<AdminUsersEntity> displayAdminList();

    List<EmployerListingEntity> displayRestrictedList();

    List<UsersEntity> getUsersEntities(@RequestParam("user") String userName);

    List<AdminUsersEntity> getAdminEntities(@RequestParam("adminuser") String userNam);

    List<EmployerListingEntity> getEmployerListingEntities(@RequestParam("user") String userName);

    ModelAndView validateEmail(@RequestParam("email") String email);

}
