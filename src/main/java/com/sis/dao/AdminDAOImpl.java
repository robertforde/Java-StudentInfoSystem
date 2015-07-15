package com.sis.dao;

import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Department;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;
import com.sis.model.Profile;
import com.sis.model.Results;
import com.sis.model.TimeTable;
import com.sis.util.ConnectDatabase;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
    
	@Autowired
    private SessionFactory sessionFactory;
        
    public int getNumMessages() {

    	@SuppressWarnings("unchecked")
    	List<Message> messages = (List<Message>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from message where Checked=false")
        		.addEntity(Message.class)
        		.list();
        return messages.size();
    }
        
    public List<Message> getMessage() {
    	
    	@SuppressWarnings("unchecked")
    	List<Message> listM = (List<Message>)sessionFactory.getCurrentSession().createCriteria(Message.class)
    			.add(Restrictions.eq("checked", 0))
    			.addOrder(Order.desc("id"))
    			.list();
    	return listM;
    }
    
    public void insertProfile(Profile p) {
        
    	sessionFactory.getCurrentSession().save(p);
    }
    
    public void saveProfile(Profile p) {

    	sessionFactory.getCurrentSession().update(p);
    }
    
    public Profile getProfile(String sid) {
    	
    	@SuppressWarnings("unchecked")
		List<Profile> students = (List<Profile>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from student where Sid=:sid")
        		.addEntity(Profile.class)
        		.setParameter("sid", sid)
        		.list();
        Profile p = students.get(0);
        return p;
    }
    
    public List<AttendanceSub> getAttendanceSub(String sid) {
    	
    	Profile profile = (Profile)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.eq("sid", sid))
    			.uniqueResult();
    	Hibernate.initialize(profile.getAttendanceSubs());
    	List<AttendanceSub> listAttSub = profile.getAttendanceSubs(); 

    	return listAttSub;
    }
    
    public void saveAttendSub(AttendanceSub attSub) {

    	sessionFactory.getCurrentSession().saveOrUpdate(attSub);
    }
    
    public void insertAttendSub(AttendanceSub attSub) {

    	sessionFactory.getCurrentSession().save(attSub);
    }
    
    public void deleteAttendSub(int id) {

    	@SuppressWarnings("unchecked")
		List<AttendanceSub> attendanceSub = (List<AttendanceSub>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from attendance where ID=:id")
        		.addEntity(AttendanceSub.class)
        		.setParameter("id", id)
        		.list();
    	AttendanceSub delAttSub = attendanceSub.get(0);
    	sessionFactory.getCurrentSession().delete(delAttSub);
    }
    
    public List<AttendanceSum> getAttendanceSum(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<AttendanceSum> listAttSum = (List<AttendanceSum>)sessionFactory.getCurrentSession().createCriteria(AttendanceSum.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.asc("year"))
    			.list();
    	
    	return listAttSum;
    }
    
    public void saveAttendSum(AttendanceSum attSum) {
    	
    	sessionFactory.getCurrentSession().saveOrUpdate(attSum);
    }
    
    public void insertAttendSum(AttendanceSum attSum) {
        
    	sessionFactory.getCurrentSession().save(attSum);
    }
    
    public void deleteAttendSum(int id) {

    	@SuppressWarnings("unchecked")
		List<AttendanceSum> attendanceSum = (List<AttendanceSum>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from attendance_semester where ID=:id")
        		.addEntity(AttendanceSum.class)
        		.setParameter("id", id)
        		.list();
    	AttendanceSum delAttSum = attendanceSum.get(0);
    	sessionFactory.getCurrentSession().delete(delAttSum);
    }
    
    public List<Fee> getFee(String sid) {

    	@SuppressWarnings("unchecked")
    	List<Fee> listFee = (List<Fee>)sessionFactory.getCurrentSession().createCriteria(Fee.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.asc("year"))
    			.addOrder(Order.asc("semester"))
    			.list();
    	
    	return listFee;
    }
    
    public void saveFee(Fee f) {
 
    	sessionFactory.getCurrentSession().saveOrUpdate(f);
    }
    
    public void insertFee(Fee f) {
    
    	sessionFactory.getCurrentSession().save(f);
    }
    
    public void deleteFee(int id) {

    	@SuppressWarnings("unchecked")
		List<Fee> fees = (List<Fee>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from fee where ID=:id")
        		.addEntity(Fee.class)
        		.setParameter("id", id)
        		.list();
    	Fee delFee = fees.get(0);
    	sessionFactory.getCurrentSession().delete(delFee);
    }
    
    public List<Library> getLibrary(String sid) {

    	@SuppressWarnings("unchecked")
    	List<Library> ListLib = (List<Library>)sessionFactory.getCurrentSession().createCriteria(Library.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.desc("balance"))
    			.list();
    	
        return ListLib;
    }
    
    public void saveLibrary(Library l) {
    
    	sessionFactory.getCurrentSession().saveOrUpdate(l);
    }
    
    public void insertLibrary(Library l) {
    	
        sessionFactory.getCurrentSession().save(l);
    }

    public void deleteLibrary(int id) {
        
    	@SuppressWarnings("unchecked")
		List<Library> libraries = (List<Library>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from library where ID=:id")
        		.addEntity(Library.class)
        		.setParameter("id", id)
        		.list();
    	Library delLibrary = libraries.get(0);
    	sessionFactory.getCurrentSession().delete(delLibrary);
    }

    public List<Results> getResults(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<Results> ListRes = (List<Results>)sessionFactory.getCurrentSession().createCriteria(Results.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.desc("year"))
    			.addOrder(Order.asc("subject"))
    			.list();
    	
        return ListRes;
    }
    
    public void saveResults(Results r) {
    	
    	sessionFactory.getCurrentSession().saveOrUpdate(r);
    }
    
    public void insertResults(Results r) {
        
    	sessionFactory.getCurrentSession().save(r);
    }

    public void deleteResults(int id) {
    	
    	@SuppressWarnings("unchecked")
		List<Results> results = (List<Results>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from result where ID=:id")
        		.addEntity(Results.class)
        		.setParameter("id", id)
        		.list();
    	Results delResult = results.get(0);
    	sessionFactory.getCurrentSession().delete(delResult);
    }
    
    public List<TimeTable> getTimeTable(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<TimeTable> ListTTable = (List<TimeTable>)sessionFactory.getCurrentSession().createCriteria(TimeTable.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.asc("dayID"))
    			.addOrder(Order.asc("time"))
    			.list();
    	
    	return ListTTable;
    }
    
    public void saveTimeTable(TimeTable t) {
    	//Get the dayID based on the day.
    	t.setDayID(getDayID(t.getDay()));
    	System.out.println(t.getDayID());
    	sessionFactory.getCurrentSession().saveOrUpdate(t);
    }
    
    public void insertTimeTable(TimeTable t) {
    	//Get the dayID based on the day.
    	t.setDayID(getDayID(t.getDay()));
    	System.out.println(t.getDayID());
    	sessionFactory.getCurrentSession().save(t);
    }
    
    public void deleteTimeTable(int id) {
    	
    	@SuppressWarnings("unchecked")
		List<TimeTable> timeTables = (List<TimeTable>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from timetable where ID=:id")
        		.addEntity(TimeTable.class)
        		.setParameter("id", id)
        		.list();
    	TimeTable timeT = timeTables.get(0);
    	sessionFactory.getCurrentSession().delete(timeT);
    }
        
    public Map<Integer, String> getAllDeptsDropdown() {

    	@SuppressWarnings("unchecked")
    	List<Department> listD = (List<Department>)sessionFactory.getCurrentSession().createCriteria(Department.class)
    			.addOrder(Order.asc("name"))
    			.list();
    	
    	
    	Map<Integer, String> mapDept = new LinkedHashMap<Integer,String>();
    	for(Department d:listD) {
    		mapDept.put(d.getDepartmentId(), d.getName());
    	}
    	return mapDept;
    }
    
    public List<Department> getAllDepartments() {

    	@SuppressWarnings("unchecked")
    	List<Department> listD = (List<Department>)sessionFactory.getCurrentSession().createCriteria(Department.class)
    			.addOrder(Order.asc("name"))
    			.list();
    	
    	return listD;
    }
    
    public String getSidFromDept(int id) {
        
    	// Get the next Sid
    	@SuppressWarnings("unchecked")
    	List<Department> departments = (List<Department>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from department where Department_Id=:id")
        		.addEntity(Department.class)
        		.setParameter("id", id)
        		.list();
    	Department d = departments.get(0);
    	String abbr = d.getAbbreviation(); 
        int nn = d.getNextNum();
    	String sid = abbr + nn;
    	
    	//Add one onto the next number.
        d.setNextNum(d.getNextNum() + 1);
        sessionFactory.getCurrentSession().save(d);
        
        return sid;
    }
    
    public void deleteStudent(String sid) {
    	
    	ArrayList<String> arrQry = new ArrayList<String>();
    	arrQry.add("delete from AttendanceSub where sid=:sid");
    	arrQry.add("delete from AttendanceSum where sid=:sid");
    	arrQry.add("delete from Fee where sid=:sid");
    	arrQry.add("delete from Library where sid=:sid");
    	arrQry.add("delete from Message where fromId=:sid");
    	arrQry.add("delete from Results where sid=:sid");
    	arrQry.add("delete from TimeTable where sid=:sid");
    	arrQry.add("delete from Profile where sid=:sid");
    	for (int i=0;i<8;i++) {
    		Query q = sessionFactory.getCurrentSession().createQuery(arrQry.get(i));
    		q.setString("sid", sid);
    		q.executeUpdate();
    	} 
    }
    
    public List<Profile> searchNameProfile(String name) {
    	@SuppressWarnings("unchecked")
    	List<Profile> listSrchRes = (List<Profile>)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.like("sname", name, MatchMode.START))
    			.addOrder(Order.asc("sname"))
    			.addOrder(Order.asc("father_name"))
    			.list();
    	
    	return listSrchRes;
    }
        
    public List<Profile> searchSurnameProfile(String surname) {
    	
    	@SuppressWarnings("unchecked")
    	List<Profile> listSrchRes = (List<Profile>)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.like("father_name", surname, MatchMode.START))
    			.addOrder(Order.asc("father_name"))
    			.addOrder(Order.asc("sname"))
    			.list();
    	
    	return listSrchRes;
    }
        
    public List<Profile> searchNationProfile(String nation) {

    	@SuppressWarnings("unchecked")
    	List<Profile> listSrchRes = (List<Profile>)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.like("nationality", nation, MatchMode.START))
    			.addOrder(Order.asc("nationality"))
    			.addOrder(Order.asc("sname"))
    			.addOrder(Order.asc("father_name"))
    			.list();
    	
    	return listSrchRes;    	
    }
            
    public List<Profile> searchDepartmentProfile(int deptID) {
    	
    	@SuppressWarnings("unchecked")
    	List<Department> depart = (List<Department>)sessionFactory.getCurrentSession().createCriteria(Department.class)
    			.add(Restrictions.eq("departmentId", deptID))
    			.list();
    	List<Profile> listSrchRes = depart.get(0).getProfiles();
    	return listSrchRes;
    	
    	/*Department dept = getDeptFromId(deptID);
    	@SuppressWarnings("unchecked")
    	List<Profile> listSrchRes = (List<Profile>)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.eq("department", dept))
    			.addOrder(Order.asc("sname"))
    			.addOrder(Order.asc("father_name"))
    			.list();
    	
    	return listSrchRes;*/
    	
    }
    
    public int getDayID(String day) {
        
        int DayID=0;
        String sql = "SELECT * from day WHERE Day='"+day+"'";

        try {
            Connection c = ConnectDatabase.findConnection();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                DayID = rs.getInt(1);
            }
            
            //Close the Database
            ConnectDatabase.closeConnection(c);
        }catch(Exception e) {
            System.out.println("Exception " + e);
        }
        
        return DayID;
    }
    
    public Department getDeptFromId(int deptId) {

    	@SuppressWarnings("unchecked")
    	List<Department> departments = (List<Department>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from department where Department_Id=:id")
        		.addEntity(Department.class)
        		.setParameter("id", deptId)
        		.list();
    	Department d = departments.get(0);
        
        return d;    	
    }
}
