package com.sis.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="library")
public class Library {
	@Column(name="Sid")
    private String sid;
	@Column(name="Sname")
    private String sname;
	@Column(name="BookName")
    private String bookName;
	@Temporal (TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="BookIssued")
    private Date bookIssued;
	@Temporal (TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="BookReturn")
    private Date bookReturn;
    @Column(name="Fines")
    private float fines;
    @Column(name="Paid")
    private float paid;
    @Column(name="Balance")
    private float balance;
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getBookIssued() {
        return bookIssued;
    }

    public void setBookIssued(Date bookIssued) {
        this.bookIssued = bookIssued;
    }

    public Date getBookReturn() {
        return bookReturn;
    }

    public void setBookReturn(Date bookReturn) {
        this.bookReturn = bookReturn;
    }

    public float getFines() {
        return fines;
    }

    public void setFines(float fines) {
        this.fines = fines;
    }

    public float getPaid() {
        return paid;
    }

    public void setPaid(float paid) {
        this.paid = paid;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
