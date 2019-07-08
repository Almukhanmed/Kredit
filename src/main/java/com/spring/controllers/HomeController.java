package com.spring.controllers;

import com.spring.beans.*;
import com.spring.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {

    @Autowired
    UserBean userBean;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public ModelAndView index() {
        List<Food> food = userBean.getFood();
        ModelAndView mw = new ModelAndView("index");
        mw.addObject("food",food);
        return mw;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public ModelAndView enter() {
        ModelAndView mw = new ModelAndView("login");
        return mw;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDeniedPage() {
        ModelAndView mw = new ModelAndView("403");
        return mw;
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        Users user = getUserData();
        List<Food> food = userBean.getFood();
        List<UserFood> userFoodList =userBean.getUserFood();
        ModelAndView mw = new ModelAndView("profile");
        mw.addObject("user", user);
        mw.addObject("food",food);
        mw.addObject("userfood",userFoodList);
        return mw;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView admin() {
        ModelAndView mw = new ModelAndView("admin");
        return mw;
    }

    @RequestMapping(value = "/regPage", method = RequestMethod.GET)
    public ModelAndView regPage() {
        ModelAndView mw = new ModelAndView("regPage");
        return mw;
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView mw = new ModelAndView("main");
        return mw;
    }



    @RequestMapping(
            value = {"/editUser"},
            method = {RequestMethod.POST}
    )
    public ModelAndView editUser(@RequestParam(name = "userId") String userId,@RequestParam(name = "userEmail") String email, @RequestParam(name = "userLogin") String login, @RequestParam(name = "userName") String name, @RequestParam(name = "userSurname") String surname, @RequestParam(name = "userPassword") String password, @RequestParam(name = "favid") int favid) {
        Long id = Long.valueOf(userId);
        Set<Roles> roles = new HashSet<Roles>();
        Roles role = new Roles();
        role.setId(id);
        roles.add(role);
        Users u = new Users(email, login, name, surname, password, favid, roles);
        userBean.saveUser(u);
        return this.profile();
    }




    @RequestMapping(
            value={"/logout"}, method = {RequestMethod.GET})

            public String logout (HttpServletRequest request, HttpServletResponse response) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
            }
            return "redirect:/index";
            }


    @RequestMapping(
            value = {"/addUser"},
            method = {RequestMethod.POST}
    )
    public ModelAndView addUser(@RequestParam(name = "email") String email, @RequestParam(name = "login") String login, @RequestParam(name = "name") String name, @RequestParam(name = "surname") String surname, @RequestParam(name = "password") String password, @RequestParam(name = "favid") int favid) {
        Set<Roles> roles = new HashSet<Roles>();
        Roles role = new Roles();
        role.setId(2L);
        roles.add(role);
        String sha1 = "";

        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes("utf8"));
            sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
        } catch (Exception var7) {
            var7.printStackTrace();
        }

        Users user = new Users(email, login, name, surname, sha1, favid, roles);
        System.out.println(email + " " + " " + login + " " + password);
        userBean.addUser(user);
        return this.admin();
    }

    @RequestMapping(
            value = {"/addUserFood"},
            method = {RequestMethod.POST}
    )
    public ModelAndView addUserFood(@RequestParam(name = "fid") Long fid,@RequestParam(name = "uid") Long uid) {
        UserFood uf = new UserFood(fid,uid);
        userBean.addUserFood(uf);
        return this.profile();
    }

    @RequestMapping(
            value = {"/regUser"},
            method = {RequestMethod.POST}
    )
    public ModelAndView regUser(@RequestParam(name = "email") String email, @RequestParam(name = "login") String login, @RequestParam(name = "name") String name, @RequestParam(name = "surname") String surname, @RequestParam(name = "password") String password, @RequestParam(name = "favid") int favid) {
        Set<Roles> roles = new HashSet<Roles>();
        Roles role = new Roles();
        role.setId(2L);
        roles.add(role);
        String sha1 = "";

        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes("utf8"));
            sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
        } catch (Exception var7) {
            var7.printStackTrace();
        }

        Users user = new Users(email, login, name, surname, sha1, favid, roles);
        System.out.println(email + " " + " " + login + " " + password);
        userBean.addUser(user);
        return this.index();
    }

    public Users getUserData() {

        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = this.userBean.getUser(ud.getUsername());
        }
        return user;

    }
}