package com.sis.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sis.dao.StudentDAO;
import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Results;
import com.sis.model.Profile;
import com.sis.model.TimeTable;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;

@Service
@Transactional
public class StudentServiceImpl implements StudentService{
	
	@Autowired 
	StudentDAO studentDao;
    
    public boolean Exists(String id, String p){
		return studentDao.Exists(id, p);
	}
	
    public String getName(String id){
    	return studentDao.getName(id);
    }
    
    public Profile getProfile(String sid){
        return studentDao.getProfile(sid);
    }

    public void saveProfile(Profile s) {
    	studentDao.saveProfile(s);
    }
    
    public List<Results> getResults(String sid) {
        return studentDao.getResults(sid);
    }
    
    public List<TimeTable> getTimeTable(String sid) {
        return studentDao.getTimeTable(sid);
    }
    
    public List<Fee> getFee(String sid) {
        return studentDao.getFee(sid);
    }
    
    public List<Library> getLibrary(String sid) {
        return studentDao.getLibrary(sid);
    }
    
    public List<AttendanceSub> getAttendanceSub(String sid) {
        return studentDao.getAttendanceSub(sid);
    }
    
    public List<AttendanceSum> getAttendanceSum(String sid) {
        return studentDao.getAttendanceSum(sid);
    }
    
    public int getNumMessages(String sid) {
    	return studentDao.getNumMessages(sid);
    }
    
    public List<Message> getMessage(String sid) {
        return studentDao.getMessage(sid);
    }

    @Transactional
    public boolean saveMessage(Message m) {
        return studentDao.saveMessage(m);
    }
}
