package com.sis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="result")
public class Results {
	@Column(name="Sid")
    private String sid;
	@Column(name="Sname")
    private String sname;
	@Column(name="Year")
    private int year;
	@Column(name="Subject")
    private String subject;
	@Column(name="GPA")
    private float gpa;
	@Column(name="Obtained")
    private int obtained;
	@Id
	@Column(name="ID")
    private int id;

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

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public float getGpa() {
        return gpa;
    }

    public void setGpa(float gpa) {
        this.gpa = gpa;
    }

    public int getObtained() {
        return obtained;
    }

    public void setObtained(int obtained) {
        this.obtained = obtained;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}