package com.spr.controller;

/**
 * Created by cata_ on 12/29/2017.
 */

import com.spr.model.CoworkingSpace;
import com.spr.utils.InitialSpacesFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

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
        ModelAndView mav = new ModelAndView("home_page_after_login");

        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();

        mav.addObject("username", session.getAttribute("loggedUser"));
        mav.addObject("cowSp", coworkingSpaces);
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
    public ModelAndView contact(HttpSession session) {
        ModelAndView mav = new ModelAndView("contact");
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                mav.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }

        mav.addObject("isLogged", isLogged);
        return mav;
    }

    @RequestMapping(value = {"/allSpaces"}, method = RequestMethod.GET)
    public ModelAndView allSpaces(HttpSession session) {
        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
        ModelAndView model = new ModelAndView("allSpaces");
        model.addObject("cowSp", coworkingSpaces);

        model.addObject("isLogged", isUserLogged(session, model));
        return model;
    }

    @RequestMapping(value = {"/allSpaces/{query}"}, method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView filteredSpaces(@PathVariable("query") String query, HttpSession session) {
        InitialSpacesFactory initialSpacesFactory = new InitialSpacesFactory();
        List<CoworkingSpace> coworkingSpaces = initialSpacesFactory.getFilteredCoworkingSpaces(query);
        ModelAndView model = new ModelAndView("allSpaces");
        if (coworkingSpaces.size() == 0) {
            coworkingSpaces = initialSpacesFactory.getCoworkingSpaces();
            model.addObject("message", "No coworkspaces found, please make another search");
        }
        model.addObject("cowSp", coworkingSpaces);
        model.addObject("isLogged", isUserLogged(session, model));

        return model;
    }

    boolean isUserLogged(HttpSession session, ModelAndView model) {
        boolean isLogged = false;
        String user;
        try {
            user = (String) session.getAttribute("loggedUser");
            if (user != null && user != "") {
                isLogged = true;
                model.addObject("username", session.getAttribute("loggedUser"));
            }
        } catch (Exception e) {

        }

        return isLogged;
    }
}