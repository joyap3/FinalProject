package com.team180.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

@Controller
public class RegisterUserController {


    @RequestMapping(value="/registerUser", method=RequestMethod.GET)

    public ModelAndView registerUser() {



        return new
                ModelAndView("userprofile", "message", "Hello World");

    }


}
