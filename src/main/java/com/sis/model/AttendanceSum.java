package com.sis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="attendance_semester")
public class AttendanceSum {
	@Column(name="Sid")
    private String sid;
	@Column(name="Sname")
    private String sname;
	@Column(name="Semester1")
    private int semester1;
	@Column(name="Semester2")
    private int semester2;
	@Column(name="Semester3")
    private int semester3;
	@Column(name="Semester4")
    private int semester4;
	@Column(name="Year")
    private int year;
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

    public int getSemester1() {
        return semester1;
    }

    public void setSemester1(int semester1) {
        this.semester1 = semester1;
    }

    public int getSemester2() {
        return semester2;
    }

    public void setSemester2(int semester2) {
        this.semester2 = semester2;
    }

    public int getSemester3() {
        return semester3;
    }

    public void setSemester3(int semester3) {
        this.semester3 = semester3;
    }

    public int getSemester4() {
        return semester4;
    }

    public void setSemester4(int semester4) {
        this.semester4 = semester4;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
            
}
