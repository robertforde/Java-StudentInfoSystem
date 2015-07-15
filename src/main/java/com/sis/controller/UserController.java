package com.sis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sis.model.Admin;
import com.sis.model.User;
import com.sis.services.AdminService;
import com.sis.services.StudentService;

@Controller
public class UserController {

	@Autowired
	private Admin admin;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("startLogin")
    public ModelAndView loginstart(HttpSession session) {
		
	    //Need to check if someone is already logged on in this session.
		Object o = session.getAttribute("userObj");
		if(o!=null){
			return new ModelAndView("home");
		}
		else { 
			return new ModelAndView("user/login", "user" , new User());
		}
    }
	
	@RequestMapping(value = "doLogin", method = RequestMethod.POST)
    public String login(@ModelAttribute("user") User user, BindingResult result, HttpSession session) {
			
    	String sid = user.getSid();
    	String pass = user.getPassword();
				
		if(sid.compareTo(admin.getUsername())==0) {
			if(pass.compareTo(admin.getPassword())==0) {
				user.setSname("Administrator");
				user.setNumMessages(adminService.getNumMessages());
	            
				session.setAttribute("userObj", user);
	            
				return "redirect:/admin/goAdminHome";
			}
			else {
	        	return "user/badLogin";
			}
		}

		else { 
			boolean exists = studentService.Exists(sid, pass);
			if(exists) {
				user.setSname(studentService.getName(sid));
				user.setNumMessages(studentService.getNumMessages(user.getSid()));
            
				session.setAttribute("userObj", user);
            
				return "redirect:/student/goHome";
			}
			else {
				return "user/badLogin";
			}
		}
        
    }
	
	@RequestMapping(value = "/doLogout")
    public String saveMessage(HttpSession session) {

        session.removeAttribute("userObj");

        return "user/loggedOut";
        
	}
}
