package com.sis.dao;

import java.util.List;

import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;
import com.sis.model.Profile;
import com.sis.model.Results;
import com.sis.model.TimeTable;

public interface StudentDAO {

    public boolean Exists(String id, String p);
    public String getName(String id); 
    public Profile getProfile(String sid);
    public void saveProfile(Profile s);
    public List<Results> getResults(String sid);
    public List<TimeTable> getTimeTable(String sid);
    public List<Fee> getFee(String sid);
    public List<Library> getLibrary(String sid);
    public List<AttendanceSub> getAttendanceSub(String sid);
    public List<AttendanceSum> getAttendanceSum(String sid);    
    public int getNumMessages(String sid);    
    public List<Message> getMessage(String sid);    
    public boolean saveMessage(Message m);
}
