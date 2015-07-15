package com.sis.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Department;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;
import com.sis.model.Profile;
import com.sis.model.Results;
import com.sis.model.SearchForm;
import com.sis.model.TimeTable;
import com.sis.services.AdminService;
import com.sis.util.DateMethods;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("goAdminHome")
    public String adminHomePage() {
        return "admin/adminHome";
    }
	

	@RequestMapping(value = "/goAdminMessage")
    public ModelAndView showNewMessages(HttpSession session) {
    
        List<Message> arrM;
        arrM = adminService.getMessage();
	    	                
	    return new ModelAndView("admin/adminMessages", "messages", arrM);
    }

	@RequestMapping("goInsertProfile")
    public ModelAndView insertProfile() {
		
		List<Department> departments = adminService.getAllDepartments();
        ModelAndView model = new ModelAndView();
	    model.setViewName("admin/adminInsert");
	    model.addObject("departments", departments);
	    model.addObject("profile", new Profile());
	    
	    return model;
    }
	
	@RequestMapping(value = "goSaveProfile", method = RequestMethod.POST)
    public ModelAndView saveProfile(@ModelAttribute("profile") Profile profile, BindingResult result, @RequestParam String deptId, HttpSession session) {
        
		//Get the new sid number
        String sid = adminService.getSidFromDept(Integer.parseInt(deptId));
        profile.setSid(sid);
        
        //Get the new profile's department
        profile.setDepartment(adminService.getDeptFromId(Integer.parseInt(deptId)));
        
        adminService.insertProfile(profile);
        
        session.setAttribute("profile", profile);

        return new ModelAndView("admin/adminProfile","profile",profile);
    }
	
	@RequestMapping("goAdminProfile")
    public ModelAndView adminHomePage(HttpSession session) {
		
		Profile profile = (Profile)session.getAttribute("profile");
        return new ModelAndView("admin/adminProfile","profile",profile);
        
    }
	
	@RequestMapping(value = "goUpdateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(@ModelAttribute("profile") Profile profile, BindingResult result, HttpSession session) {
        
		adminService.saveProfile(profile);
        
        session.removeAttribute("profile");
        session.setAttribute("profile", profile);
        
        return new ModelAndView("admin/adminProfile","profile",profile);
    }
	
	@RequestMapping(value = "goAdminAttendSub")
    public String getAdminAttendSub( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
        List<AttendanceSub> arrASub;
        arrASub = adminService.getAttendanceSub(profile.getSid());
        
        session.setAttribute("attendsub", arrASub);
        session.setAttribute("totalattendsub", arrASub.size());
                
        return "admin/adminAttendSub";
    }
	
	@RequestMapping(value = "adminUpAttSub")
    public String getAdminAttendSub( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            Profile sid = profile;
            String sname = profile.getSname();
            
            int numRecords = (Integer)request.getSession().getAttribute("totalattendsub"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Get an AttendanceSub model object for each record that may have changed
                AttendanceSub attSub = new AttendanceSub();
                attSub.setSid(sid);
                attSub.setSname(sname);
                attSub.setSubject(request.getParameter("subject"+i));
                
                String present = request.getParameter("present"+i);
                present=present==null?"0":present;
                present=present.equals("")?"0":present;
                attSub.setPresent(Integer.parseInt(present));
                
                String absent = request.getParameter("absent"+i);
                absent=absent==null?"0":absent;
                absent=absent.equals("")?"0":absent;
                attSub.setAbsent(Integer.parseInt(absent));
                
                attSub.setId(Integer.parseInt(request.getParameter("id"+i)));
                adminService.saveAttendSub(attSub);
                
            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsAttSub";

        }
        else {
            
            int numRecords = (Integer)request.getSession().getAttribute("totalattendsub"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteAttendSub(deleteID);
                }
            }
        }
        
        return "redirect:/admin/goAdminAttendSub";

    }
	
	@RequestMapping("goAdminInsAttSub")
    public ModelAndView adminInsAttendSub() {
		
		AttendanceSub insAttendSub = new AttendanceSub();
		
        return new ModelAndView("admin/adminInsAttendSub","insAttendSub",insAttendSub);
        
    }
	
	@RequestMapping("adminInsAttendSubSave")
    public String adminInsAttendSubSave(@ModelAttribute("insAttendSub") AttendanceSub attendanceSub, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            attendanceSub.setSid(profile);
            attendanceSub.setSname(profile.getSname());
    		
            adminService.insertAttendSub(attendanceSub);
        }
		
        return "redirect:/admin/goAdminAttendSub";
        
    }
	
	@RequestMapping(value = "goAdminAttendSum")
    public String getAdminAttendSum( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
		List<AttendanceSum> arrASum;
        arrASum = adminService.getAttendanceSum(profile.getSid());
        
        session.setAttribute("attendsum", arrASum);
        session.setAttribute("totalattendsum", arrASum.size());
        
        return "admin/adminAttendSum";
    }
		
	@RequestMapping(value = "adminUpAttSum")
    public String getAdminAttendSum( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            String sid = profile.getSid();
            String sname = profile.getSname();
            
            int numRecords = (Integer)request.getSession().getAttribute("totalattendsum"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Get an AttendanceSum model object for each record that may have changed
                AttendanceSum attSum = new AttendanceSum();
                attSum.setSid(sid);
                attSum.setSname(sname);
                                
                String semester1 = request.getParameter("semester1"+i);
                semester1=semester1==null?"0":semester1;
                semester1=semester1.equals("")?"0":semester1;
                attSum.setSemester1(Integer.parseInt(semester1));
                
                String semester2 = request.getParameter("semester2"+i);
                semester2=semester2==null?"0":semester2;
                semester2=semester2.equals("")?"0":semester2;
                attSum.setSemester2(Integer.parseInt(semester2));
                
                String semester3 = request.getParameter("semester3"+i);
                semester3=semester3==null?"0":semester3;
                semester3=semester3.equals("")?"0":semester3;
                attSum.setSemester3(Integer.parseInt(semester3));
                
                String semester4 = request.getParameter("semester4"+i);
                semester4=semester4==null?"0":semester4;
                semester4=semester4.equals("")?"0":semester4;
                attSum.setSemester4(Integer.parseInt(semester4));
                
                String year = request.getParameter("year"+i);
                year=year==null?"0":year;
                year=year.equals("")?"0":year;
                attSum.setYear(Integer.parseInt(year));
                
                attSum.setId(Integer.parseInt(request.getParameter("id"+i)));
                
                adminService.saveAttendSum(attSum);
                
            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsAttSum";

        }
        else {
            
        	int numRecords = (Integer)request.getSession().getAttribute("totalattendsum"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteAttendSum(deleteID);
                }
            }
        }
        
        return "redirect:/admin/goAdminAttendSum";
    }

	@RequestMapping("goAdminInsAttSum")
    public ModelAndView adminInsAttendSum() {
		
		AttendanceSum insAttendSum = new AttendanceSum();
		
        return new ModelAndView("admin/adminInsAttendSum","insAttendSum",insAttendSum);
        
    }
	
	@RequestMapping("adminInsAttendSumSave")
    public String adminInsAttendSumSave(@ModelAttribute("insAttendSum") AttendanceSum attendanceSum, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            attendanceSum.setSid(profile.getSid());
            attendanceSum.setSname(profile.getSname());
    		
            adminService.insertAttendSum(attendanceSum);
        }
		
        return "redirect:/admin/goAdminAttendSum";
        
    }
	
	@RequestMapping(value = "goAdminFee")
    public String getAdminFee( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
		List<Fee> arrFee;
        arrFee = adminService.getFee(profile.getSid());
        
        session.setAttribute("fee", arrFee);
        session.setAttribute("totalfee", arrFee.size());
        
        return "admin/adminFee";
    }
	
	@RequestMapping(value = "adminUpFee")
    public String getAdminFee( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            String sid = profile.getSid();
            String sname = profile.getSname();
            
            int numRecords = (Integer)request.getSession().getAttribute("totalfee"); 
            
            for(int i=1;i<=numRecords;i++) {
                
            	Fee f = new Fee();
                f.setSid(sid);
                f.setSname(sname);
                f.setSemester(request.getParameter("semester"+i));
                
                String fees = request.getParameter("fees"+i);
                fees=fees==null?"0.00":fees;
                fees=fees.equals("")?"0.00":fees;
                f.setFees(Float.parseFloat(fees));
                
                String charge = request.getParameter("charge"+i);
                charge=charge==null?"0.00":charge;
                charge=charge.equals("")?"0.00":charge;
                f.setCharge(Float.parseFloat(charge));
                
                f.setId(Integer.parseInt(request.getParameter("id"+i)));
                
                String year = request.getParameter("year"+i);
                year=year==null?"0":year;
                year=year.equals("")?"0":year;
                f.setYear(Integer.parseInt(year));
                
                adminService.saveFee(f);
            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsFee";

        }
        else {
            
        	int numRecords = (Integer)request.getSession().getAttribute("totalfee"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteFee(deleteID);
                }
            }
        }
        
        return "redirect:/admin/goAdminFee";
    }

	@RequestMapping("goAdminInsFee")
    public ModelAndView adminInsFee() {
		
		Fee insFee = new Fee();
		
        return new ModelAndView("admin/adminInsFee","insFee",insFee);
        
    }
	
	@RequestMapping("adminInsFeeSave")
    public String adminInsFeeSave(@ModelAttribute("insFee") Fee fee, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            fee.setSid(profile.getSid());
            fee.setSname(profile.getSname());
    		
            adminService.insertFee(fee);
        }
		
        return "redirect:/admin/goAdminFee";
    }
	
	@RequestMapping(value = "goAdminLibrary")
    public String getAdminLibrary( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
		List<Library> arrLib;
        arrLib = adminService.getLibrary(profile.getSid());
        
        session.setAttribute("library", arrLib);
        session.setAttribute("totallibrary", arrLib.size());
        
        return "admin/adminLibrary";
    }

	@RequestMapping(value = "adminUpLibrary")
    public String getAdminLibrary( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            String sid = profile.getSid();
            String sname = profile.getSname();
            
            int numRecords = (Integer)request.getSession().getAttribute("totallibrary"); 
            
            for(int i=1;i<=numRecords;i++) {
                
            	Library l = new Library();
                l.setSid(sid);
                l.setSname(sname);
                l.setBookName(request.getParameter("bookName"+i));
                
                String strDate = request.getParameter("bookIssued"+i);
                java.sql.Date sqlDate= DateMethods.stringToSqlDate(strDate);
                l.setBookIssued(sqlDate);
                
                strDate = request.getParameter("bookReturn"+i);
                sqlDate = DateMethods.stringToSqlDate(strDate);
                l.setBookReturn(sqlDate);
                
                String fines = request.getParameter("fines"+i);
                fines=fines==null?"0.00":fines;
                fines=fines.equals("")?"0.00":fines;
                l.setFines(Float.parseFloat(fines));
                
                String paid = request.getParameter("paid"+i);
                paid=paid==null?"0.00":paid;
                paid=paid.equals("")?"0.00":paid;
                l.setPaid(Float.parseFloat(paid));
                
                String balance = request.getParameter("balance"+i);
                balance=balance==null?"0.00":balance;
                balance=balance.equals("")?"0.00":balance;
                l.setBalance(Float.parseFloat(balance));
                
                l.setId(Integer.parseInt(request.getParameter("id"+i)));
                
                adminService.saveLibrary(l);
            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsLibrary";

        }
        else {
            
        	int numRecords = (Integer)request.getSession().getAttribute("totallibrary"); 
            
            for(int i=1;i<=numRecords;i++) {
                
            	//Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteLibrary(deleteID);
                }
            }
        }
        
        return "redirect:/admin/goAdminLibrary";
    }
	
	@RequestMapping("goAdminInsLibrary")
    public ModelAndView adminInsLibrary() {
		
		Library insLibrary = new Library();
		
        return new ModelAndView("admin/adminInsLibrary","insLibrary",insLibrary);
        
    }
	
	@RequestMapping("adminInsLibrarySave")
    public String adminInsLibrarySave(@ModelAttribute("insLibrary") Library library, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            library.setSid(profile.getSid());
            library.setSname(profile.getSname());
    		
            adminService.insertLibrary(library);
        }
		
        return "redirect:/admin/goAdminLibrary";
    }
	
	@RequestMapping(value = "goAdminResults")
    public String getAdminResults( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
		List<Results> arrRes;
        arrRes = adminService.getResults(profile.getSid());
        
        session.setAttribute("results", arrRes);
        session.setAttribute("totalresults", arrRes.size());
        
        return "admin/adminResults";
    }
	
	@RequestMapping(value = "adminUpResults")
    public String getAdminResults( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            String sid = profile.getSid();
            String sname = profile.getSname();
            
            int numRecords = (Integer)request.getSession().getAttribute("totalresults"); 
            
            for(int i=1;i<=numRecords;i++) {
                
            	Results r = new Results();
                r.setSid(sid);
                r.setSname(sname);
                
                
                String year = request.getParameter("year"+i);
                year=year==null?"0":year;
                year=year.equals("")?"0":year;
                r.setYear(Integer.parseInt(year));
                                
                r.setSubject(request.getParameter("subject"+i));
                
                String gpa = request.getParameter("gpa"+i);
                gpa=gpa==null?"0.00":gpa;
                gpa=gpa.equals("")?"0.00":gpa;
                r.setGpa(Float.parseFloat(gpa));
                
                String obtained = request.getParameter("obtained"+i);
                obtained=obtained==null?"0":obtained;
                obtained=obtained.equals("")?"0":obtained;
                r.setObtained(Integer.parseInt(obtained));
                
                r.setId(Integer.parseInt(request.getParameter("id"+i)));
                
                adminService.saveResults(r);
            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsResults";

        }
        else {
            
        	int numRecords = (Integer)request.getSession().getAttribute("totalresults"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteResults(deleteID);
                }
            
            }
        }
        
        return "redirect:/admin/goAdminResults";
    }
	
	@RequestMapping("goAdminInsResults")
    public ModelAndView adminInsResults() {
		
		Results insResults = new Results();
		
        return new ModelAndView("admin/adminInsResults","insResults",insResults);
        
    }
	
	@RequestMapping("adminInsResultsSave")
    public String adminInsResultsSave(@ModelAttribute("insResults") Results results, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            results.setSid(profile.getSid());
            results.setSname(profile.getSname());
    		
            adminService.insertResults(results);
        }
		
        return "redirect:/admin/goAdminResults";
    }
	
	@RequestMapping(value = "goAdminTimeTable")
    public String getAdminTimeTable( HttpSession session) {
        
		Profile profile = (Profile) session.getAttribute("profile");
		List<TimeTable> arrTimeTable;
        arrTimeTable = adminService.getTimeTable(profile.getSid());
        
        session.setAttribute("timetable", arrTimeTable);
        session.setAttribute("totaltimetable", arrTimeTable.size());
        
        return "admin/adminTimeTable";
    }
	
	@RequestMapping(value = "adminUpTimeTable")
    public String getAdminTimeTable( HttpServletRequest request) {
        
		//Find out whatever action button was pressed (Save or Insert)
        String action = request.getParameter("action");
        
        if("Save Changes".equals(action)){
            
            Profile profile = (Profile) request.getSession().getAttribute("profile");
            String sid = profile.getSid();
            
            int numRecords = (Integer)request.getSession().getAttribute("totaltimetable"); 
            
            for(int i=1;i<=numRecords;i++) {
                
            	TimeTable t = new TimeTable();
                t.setSubject(request.getParameter("subject"+i));
                t.setDay(request.getParameter("day"+i));
                t.setRoom(request.getParameter("room"+i));
                t.setTime(request.getParameter("time"+i));
                t.setSid(sid);
                t.setId(Integer.parseInt(request.getParameter("id"+i)));

                adminService.saveTimeTable(t);

            }
        }
        else if("Insert Record".equals(action)){
            
        	return "redirect:/admin/goAdminInsTimeTable";

        }
        else {
            
            int numRecords = (Integer)request.getSession().getAttribute("totaltimetable"); 
            
            for(int i=1;i<=numRecords;i++) {
                
                //Find out if this record's deleted radio is selected (value="yes")
                String toDelete = request.getParameter("delete"+i);
                if((toDelete != null) && (toDelete.compareTo("yes")==0)) {
                    int deleteID = Integer.parseInt(request.getParameter("id"+i));
                    //Call the method to delete the id.
                    adminService.deleteTimeTable(deleteID);
                }
            
            }
        }
        
        return "redirect:/admin/goAdminTimeTable";
    }
	
	@RequestMapping("goAdminInsTimeTable")
    public ModelAndView adminInsTimeTable() {
		
		TimeTable insTimeTable = new TimeTable();
		
        return new ModelAndView("admin/adminInsTimeTable","insTimeTable",insTimeTable);
        
    }
	
	@RequestMapping("adminInsTimeTableSave")
    public String adminInsTimeTableSave(@ModelAttribute("insTimeTable") TimeTable timeTable, BindingResult result,@RequestParam String action,HttpSession session) {
		
        if("Save".equals(action)){
        
        	Profile profile = (Profile) session.getAttribute("profile");
            timeTable.setSid(profile.getSid());
    		
            adminService.insertTimeTable(timeTable);
        }
		
        return "redirect:/admin/goAdminTimeTable";
    }
	
	@RequestMapping("goAdminBack")
    public String goBack(HttpSession session) {
		
		session.removeAttribute("profile");
        session.removeAttribute("attendsub");
        session.removeAttribute("totalattendsub");
        session.removeAttribute("attendsum");
        session.removeAttribute("totalattendsum");
        session.removeAttribute("library");
        session.removeAttribute("totallibrary");
        session.removeAttribute("fee");
        session.removeAttribute("totalfee");
        session.removeAttribute("timetable");
        session.removeAttribute("totaltimetable");
        session.removeAttribute("results");
        session.removeAttribute("totalresults");
        
        return "redirect:/admin/goAdminHome";
    }

	@RequestMapping("goAdminEdit")
    public String adminEditPage() {
        return "admin/adminEdit";
    }
	
	@RequestMapping("goAdminEditDetails")
    public ModelAndView adminEditDetails(@RequestParam String editSid, HttpSession session) {
		
		Profile profile = adminService.getProfile(editSid);
        session.setAttribute("profile", profile);
        
        return new ModelAndView("admin/adminProfile","profile",profile);
    }

	@RequestMapping("goAdminDelete")
    public String adminDeletePage() {
        return "admin/adminDelete";
    }

	@RequestMapping("adminDelete")
    public String adminDelete(@RequestParam String deleteSid) {
		
		adminService.deleteStudent(deleteSid);
        
        return "admin/adminHome";
    }
	
	@RequestMapping("goAdminSearch")
    public ModelAndView adminSearchPage() {
		
		SearchForm srchForm = new SearchForm(); 
		
		Map<Integer, String> departments = adminService.getAllDeptsDropdown();
		departments.put(0, "");
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/adminSearch");
		model.addObject("departments",departments);
		model.addObject("srchForm",srchForm);
        
        return model;
    }

	@RequestMapping("goAdminSearchResults")
    public ModelAndView adminSearchResultsPage(@ModelAttribute("srchForm") SearchForm srchForm, BindingResult result) {
		
		List<Profile> listStudents = null;
		List<Profile> restrictListStudents = null;
        String searched="";
                
        if(srchForm.getName().compareTo("")!=0) {
        	listStudents = adminService.searchNameProfile(srchForm.getName());
            searched += "Name: " + srchForm.getName() + " ";
        }
        
        if(srchForm.getSurname().compareTo("")!=0) {
        	if (searched == "") {
        		listStudents = adminService.searchSurnameProfile(srchForm.getSurname());
        	}
        	else {
        		restrictListStudents = adminService.searchSurnameProfile(srchForm.getSurname());
        		listStudents = searchedStudents(listStudents, restrictListStudents);
        	}
            searched += "Surname: " + srchForm.getSurname() + " ";
        }
        if(srchForm.getNation().compareTo("")!=0) {
        	if (searched == "")
        		listStudents = adminService.searchNationProfile(srchForm.getNation());
        	else {
        		restrictListStudents = adminService.searchNationProfile(srchForm.getNation());
        		listStudents = searchedStudents(listStudents, restrictListStudents);
        	}
            searched += "Nation: " + srchForm.getNation() + " ";
        }
        if(srchForm.getDeptID()!=0) {
        	if (searched == "")
        		listStudents = adminService.searchDepartmentProfile(srchForm.getDeptID());
        	else {
        		restrictListStudents = adminService.searchDepartmentProfile(srchForm.getDeptID());
        		listStudents = searchedStudents(listStudents, restrictListStudents);
        	}
            searched+= "Dept: " + (adminService.getDeptFromId(srchForm.getDeptID())).getName();
        }

        ModelAndView model = new ModelAndView();
	    model.setViewName("admin/adminSearchDisplay");
	    model.addObject("searched", searched);
	    model.addObject("srchresults", listStudents);
		
        return model;
    }
	
	public List<Profile> searchedStudents(List <Profile>list, List <Profile>restrict) {
		
		List<Profile> newList = new ArrayList<Profile>();
		for(Profile p: list) {
			if(restrict.contains(p))
				newList.add(p);
		}
		
		return newList;
	}
}
