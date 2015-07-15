package com.sis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name="attendance")
public class AttendanceSub {
	@ManyToOne
	@JoinColumn(name = "Sid")
	private Profile sid;
	@Column(name="Sname")
    private String sname;
	@Column(name="Subject")
    private String subject;
	@Column(name="Present")
    private int present;
	@Column(name="Absent")
    private int absent;
    @Id
    @Column(name="ID")
    private int id;

    public Profile getSid() {
        return sid;
    }

    public void setSid(Profile sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getPresent() {
        return present;
    }

    public void setPresent(int present) {
        this.present = present;
    }

    public int getAbsent() {
        return absent;
    }

    public void setAbsent(int absent) {
        this.absent = absent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
