package com.sis.model;

public class User {
    private String sid;
    private String sname;
    private String password;
    private int numMessages;
    
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getNumMessages() {
		return numMessages;
	}
	public void setNumMessages(int numMessages) {
		this.numMessages = numMessages;
	}
    
}
