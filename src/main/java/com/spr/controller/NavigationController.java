package com.spr.controller;

/**
 * Created by cata_ on 12/29/2017.
 */

import com.spr.model.CoworkingSpace;
import com.spr.utils.InitialSpacesFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NavigationController {

    @RequestMapping(value = {"/", "index"}, method = RequestMethod.GET)
    public ModelAndView index() {
        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        ModelAndView model = new ModelAndView("index");
        model.addObject("cowSp", coworkingSpaces);
        return model;
    }

    @RequestMapping(value = {"/home_page_after_login"}, method = RequestMethod.GET)
    public ModelAndView client(HttpSession session) {
        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        ModelAndView mav = new ModelAndView("home_page_after_login");
        Map<String, Object> map = new HashMap<>();
        map.put("username", session.getAttribute("loggedUser"));
        map.put("cowSp", coworkingSpaces);
        mav.addObject("model", map);
        return mav;
    }

    @RequestMapping(value = {"/user-page"}, method = RequestMethod.GET)
    public ModelAndView user() {
        return new ModelAndView("user-page");
    }

    @RequestMapping(value = {"/admin-page"}, method = RequestMethod.GET)
    public ModelAndView admin() {
        return new ModelAndView("admin-page");
    }

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public ModelAndView contact() {
        return new ModelAndView("contact");
    }
}