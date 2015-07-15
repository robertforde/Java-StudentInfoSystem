package com.sis.services;

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

public interface AdminService {
    
	public int getNumMessages();
	public List<Message> getMessage();
    public void insertProfile(Profile p);
    public void saveProfile(Profile p);
    public Profile getProfile(String sid);
    public List<AttendanceSub> getAttendanceSub(String sid);
    public void deleteStudent(String sid);
    public void saveAttendSub(AttendanceSub attSub);
    public void insertAttendSub(AttendanceSub attSub);
    public void deleteAttendSub(int id);
    public List<AttendanceSum> getAttendanceSum(String sid);
    public void saveAttendSum(AttendanceSum attSum);
    public void insertAttendSum(AttendanceSum attSum);
    public void deleteAttendSum(int id);
    public List<Fee> getFee(String sid);
    public void saveFee(Fee f);
    public void deleteFee(int id);
    public void insertFee(Fee f);
    public List<Library> getLibrary(String sid);
    public void saveLibrary(Library l);
    public void deleteLibrary(int id);
    public void insertLibrary(Library l);
    public List<Results> getResults(String sid);
    public void saveResults(Results r);
    public void deleteResults(int id);
    public void insertResults(Results r);
    public List<TimeTable> getTimeTable(String sid);
    public void saveTimeTable(TimeTable t);
    public void deleteTimeTable(int id);
    public void insertTimeTable(TimeTable t);
    public Map<Integer,String> getAllDeptsDropdown();
    public List<Department> getAllDepartments();
    public String getSidFromDept(int id);
    public List<Profile> searchNameProfile(String name);
    public List<Profile> searchSurnameProfile(String surname);
    public List<Profile> searchNationProfile(String nation);
    public List<Profile> searchDepartmentProfile(int deptID);
    public int getDayID(String day);
    public Department getDeptFromId(int deptId);
}
