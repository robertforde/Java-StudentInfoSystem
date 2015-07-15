package com.sis.dao;

import com.sis.model.AttendanceSub;
import com.sis.model.AttendanceSum;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sis.model.Results;
import com.sis.model.Profile;
import com.sis.model.TimeTable;
import com.sis.model.Fee;
import com.sis.model.Library;
import com.sis.model.Message;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

    public boolean Exists(String id, String p) {
        
    	boolean found = false;
        
    	@SuppressWarnings("unchecked")
    	List<Profile> exists = (List<Profile>)sessionFactory.getCurrentSession().createSQLQuery( 
    	 		"select * from student s where s.sid=:id and s.password=:p")
    	 		.addEntity(Profile.class)
    	 		.setParameter("id", id)
    	 		.setParameter("p", p)
    	 		.list();
    	
    	if(exists.isEmpty() != true) {
    		found = true;
    	}
        
        return found;
    }

    public String getName(String id) {
    	
    	@SuppressWarnings("unchecked")
    	List<String> names = (List<String>)sessionFactory.getCurrentSession().createSQLQuery( 
    	 		"select Sname from student s where s.sid=:id")
    	 		.setParameter("id", id)
    	 		.list();
    	String name = (String)names.get(0);
    	return name;
    }

    public Profile getProfile(String sid) {
        Profile s = (Profile)sessionFactory.getCurrentSession().get(Profile.class, sid);

        return s;
    }

    public void saveProfile(Profile s) {
    	sessionFactory.getCurrentSession().update(s);
    }

    public List<Results> getResults(String sid) {
        
    	@SuppressWarnings("unchecked")
		List<Results> listR = (List<Results>)sessionFactory.getCurrentSession().createCriteria(Results.class)
    			.add(Restrictions.eq("sid", sid))
    			.addOrder(Order.asc("year"))
    			.addOrder(Order.asc("subject"))
    			.list();
    	
    	return listR;
    }

    public List<TimeTable> getTimeTable(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<TimeTable> listT = (List<TimeTable>)sessionFactory.getCurrentSession().createCriteria(TimeTable.class)
    		.add(Restrictions.eq("sid", sid))
    		.addOrder(Order.asc("id"))
    		.addOrder(Order.asc("time"))
    		.list();
    	
    	return listT;
    }

    public List<Fee> getFee(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<Fee> listF = (List<Fee>)sessionFactory.getCurrentSession().createCriteria(Fee.class)
    		.add(Restrictions.eq("sid", sid))
    		.addOrder(Order.asc("year"))
    		.addOrder(Order.asc("semester"))
    		.list();
    	
    	return listF;
    }

    public List<Library> getLibrary(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<Library> listL = (List<Library>)sessionFactory.getCurrentSession().createCriteria(Library.class)
    		.add(Restrictions.eq("sid", sid))
    		.addOrder(Order.desc("balance"))
    		.list();
    	
    	return listL;
    }
    
    public List<AttendanceSub> getAttendanceSub(String sid) {

    	Profile profile = (Profile)sessionFactory.getCurrentSession().createCriteria(Profile.class)
    			.add(Restrictions.eq("sid", sid))
    			.uniqueResult();
    	Hibernate.initialize(profile.getAttendanceSubs());
    	List<AttendanceSub> listAttSub = profile.getAttendanceSubs(); 

    	return listAttSub;

    	//@SuppressWarnings("unchecked")
    	//List<AttendanceSub> listAttSub = (List<AttendanceSub>)sessionFactory.getCurrentSession().createCriteria(AttendanceSub.class)
    	//		.add(Restrictions.eq("sid", sid))
    	//		.addOrder(Order.asc("subject"))
    	//		.list();
    	
    	//return listAttSub;
    }
    
    public List<AttendanceSum> getAttendanceSum(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<AttendanceSum> listAttSum = (List<AttendanceSum>)sessionFactory.getCurrentSession().createCriteria(AttendanceSum.class)
    		.add(Restrictions.eq("sid", sid))
    		.addOrder(Order.asc("year"))
    		.list();
    	
    	return listAttSum;
    }
    
    public int getNumMessages(String sid) {
        
    	@SuppressWarnings("unchecked")
    	List<Message> messages = (List<Message>)sessionFactory.getCurrentSession().createSQLQuery(
        		"select * from message WHERE ToId=:sid")
        		.addEntity(Message.class)
        		.setParameter("sid", sid)
        		.list();
        return messages.size();
    }
    
    public List<Message> getMessage(String sid) {
    	
    	@SuppressWarnings("unchecked")
    	List<Message> listM = (List<Message>)sessionFactory.getCurrentSession().createCriteria(Message.class)
    			.add(Restrictions.eq("toId", sid))
    			.addOrder(Order.desc("id"))
    			.list();
    	
    	return listM;
    }
    
    public boolean saveMessage(Message m) {

    	Object o = sessionFactory.getCurrentSession().get(Profile.class, m.getToId());
    	
    	if(o==null) {
    		return false;
    	}
    	else {
    		sessionFactory.getCurrentSession().save(m);    		
    		return true;
    	}
    }
}
