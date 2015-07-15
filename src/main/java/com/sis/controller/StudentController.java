package com.sis.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;
import com.sis.model.Profile;
import com.sis.model.Results;
import com.sis.model.TimeTable;
import com.sis.model.User;
import com.sis.services.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/goHome")
    public String homePage() {
        return "student/home";
    }
	
	@RequestMapping("/goAttendance")
    public String attendancePage() {
        return "student/attendance";
    }
	
	@RequestMapping(value = "/subjectAttendance")
    public ModelAndView subjectAttendance(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
	    List<AttendanceSub> arrASub;
	    arrASub = studentService.getAttendanceSub(user.getSid());
	    
	    ModelAndView model = new ModelAndView("student/attendanceSub","attendsub", arrASub);
	    	                
	    return model;
    }
	
	@RequestMapping(value = "/summaryAttendance")
    public ModelAndView summaryAttendance(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
		List<AttendanceSum> arrASum;
        String sid = (String) user.getSid();
        arrASum = studentService.getAttendanceSum(sid);
	    	                
	    return new ModelAndView("student/attendanceSum","attendsum", arrASum);
    }
	
	@RequestMapping(value = "/goProfile")
    public ModelAndView editProfile(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        Profile p;
        
        p = studentService.getProfile(sid);
                
	    return new ModelAndView("student/profile","profile", p);
    }
	
	@RequestMapping(value = "/doProfile", method = RequestMethod.POST)
    public String saveProfile(@ModelAttribute("profile") Profile profile, BindingResult result) {
                    
		studentService.saveProfile(profile);
        
	    return "redirect:/student/goProfile";
    }
	
	@RequestMapping(value = "/goResults")
    public ModelAndView showResults(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        List<Results> listR;
        listR = studentService.getResults(sid);
        
	    ModelAndView model = new ModelAndView();
	    model.setViewName("student/results");
	    model.addObject("results", listR);
	    model.addObject("totalresults", listR.size());
	    	                
	    return model;
    }
	
	@RequestMapping(value = "/goTimetable")
    public ModelAndView showTimetable(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        
        List<TimeTable> arrT;
        arrT = studentService.getTimeTable(sid);
        
	    return new ModelAndView("student/timetable","timetable", arrT);
    }
	
	@RequestMapping(value = "/goFee")
    public ModelAndView showFees(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        
        List<Fee> arrF;
        arrF = studentService.getFee(sid);
        
	    return new ModelAndView("student/fee","fee", arrF);
    }
	
	@RequestMapping(value = "/goLibrary")
    public ModelAndView showLibrary(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        
        List<Library> arrL = studentService.getLibrary(sid);
        
	    return new ModelAndView("student/library","library", arrL);
    }
	
	@RequestMapping(value = "/goStudentMessage")
    public ModelAndView showMessages(HttpSession session) {
    
		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        List<Message> arrM;
        
        arrM = studentService.getMessage(sid);
	    	                
	    return new ModelAndView("student/messages", "messages", arrM);
    }
	
	@RequestMapping(value = "/goCreateMessage")
    public ModelAndView createMessage(HttpSession session) {

		User user = (User) session.getAttribute("userObj");
        String sid = (String) user.getSid();
        String sname = (String) user.getSname();
        Message message = new Message();
        
        message.setFromId(sid);
        message.setFromName(sname);
        		
	    return new ModelAndView("student/createMessage","message", message);
    }

	@RequestMapping(value = "/doCreateMessage", method = RequestMethod.POST)
    public String saveMessage(@ModelAttribute("message") Message message, BindingResult result) {

		boolean in = studentService.saveMessage(message);
        
        if(in == true ) {
        	return "student/messageSent";
        }
        else {
        	return "student/messageNotSent";
        }
    }
			
}
