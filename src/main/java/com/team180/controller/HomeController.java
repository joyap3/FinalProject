package com.team180.controller;

/**
 * Created by joyapuryear on 8/7/17.
 */



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

    @Controller
    public class HomeController {

        @RequestMapping("/")

        public ModelAndView helloWorld()
        {
            return new
                    ModelAndView("welcome","message","Hello World");

        }

    }




