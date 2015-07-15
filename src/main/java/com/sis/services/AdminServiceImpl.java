package com.sis.services;

import com.sis.dao.AdminDAO;
import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Department;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;
import com.sis.model.Profile;
import com.sis.model.Results;
import com.sis.model.TimeTable;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	
	@Autowired 
	AdminDAO adminDao;
    
	public int getNumMessages() {
        return adminDao.getNumMessages();
    }
	
	public List<Message> getMessage() {
        return adminDao.getMessage();
    }
    
    public void insertProfile(Profile p) {
        adminDao.insertProfile(p);
    }
    
    public void saveProfile(Profile p) {
    	adminDao.saveProfile(p);
    }
    
    public Profile getProfile(String sid) {
        return adminDao.getProfile(sid);
    }
    
    public List<AttendanceSub> getAttendanceSub(String sid) {
        return adminDao.getAttendanceSub(sid);
    }
    
    public void deleteStudent(String sid) {
        adminDao.deleteStudent(sid);
    }
    
    public void saveAttendSub(AttendanceSub attSub) {
        adminDao.saveAttendSub(attSub);
    }
    
    public void insertAttendSub(AttendanceSub attSub) {
        adminDao.insertAttendSub(attSub);
    }
    
    public void deleteAttendSub(int id) {
    	adminDao.deleteAttendSub(id);
    }
    
    public List<AttendanceSum> getAttendanceSum(String sid) {
        return adminDao.getAttendanceSum(sid);
    }
    
    public void saveAttendSum(AttendanceSum attSum) {
    	adminDao.saveAttendSum(attSum);
    }
    
    public void insertAttendSum(AttendanceSum attSum) {
    	adminDao.insertAttendSum(attSum);
    }
    
    public void deleteAttendSum(int id) {
    	adminDao.deleteAttendSum(id);
    }
    
    public List<Fee> getFee(String sid) {
    	return adminDao.getFee(sid);
    }
    
    public void saveFee(Fee f) {
    	adminDao.saveFee(f);
    }
    
    public void deleteFee(int id) {
    	adminDao.deleteFee(id);
    }
    
    public void insertFee(Fee f) {
    	adminDao.insertFee(f);
    }
    
    public List<Library> getLibrary(String sid) {
        return adminDao.getLibrary(sid);
    }
    
    public void saveLibrary(Library l) {
    	adminDao.saveLibrary(l);
    }
    
    public void deleteLibrary(int id) {
    	adminDao.deleteLibrary(id);
    }
    
    public void insertLibrary(Library l) {
    	adminDao.insertLibrary(l);
    }
    
    public List<Results> getResults(String sid) {
        return adminDao.getResults(sid);
    }
    
    public void saveResults(Results r) {
    	adminDao.saveResults(r);
    }
    
    public void deleteResults(int id) {
    	adminDao.deleteResults(id);
    }
    
    public void insertResults(Results r) {
    	adminDao.insertResults(r);
    }
    
    public List<TimeTable> getTimeTable(String sid) {
        return adminDao.getTimeTable(sid);
    }
    
    public void saveTimeTable(TimeTable t) {
    	adminDao.saveTimeTable(t);
    }
    
    public void deleteTimeTable(int id) {
    	adminDao.deleteTimeTable(id);
    }
    
    public void insertTimeTable(TimeTable t) {
    	adminDao.insertTimeTable(t);
    }
    
    public Map<Integer,String> getAllDeptsDropdown() {
    	return adminDao.getAllDeptsDropdown();
    }
    
    public List<Department> getAllDepartments() {
    	return adminDao.getAllDepartments();
    }
    
    public String getSidFromDept(int id) {
        return adminDao.getSidFromDept(id);
    }
            
    public List<Profile> searchNameProfile(String name) {
        return adminDao.searchNameProfile(name);
    }
    
    public List<Profile> searchSurnameProfile(String surname) {
        return adminDao.searchSurnameProfile(surname);
    }
    
    public List<Profile> searchNationProfile(String nation) {
        return adminDao.searchNationProfile(nation);
    }
    
    public List<Profile> searchDepartmentProfile(int deptID) {
        return adminDao.searchDepartmentProfile(deptID);
    }
    
    public int getDayID(String day) {
        return adminDao.getDayID(day);
    }
    
    public Department getDeptFromId(int deptId) {
    	return adminDao.getDeptFromId(deptId);
    }
}
