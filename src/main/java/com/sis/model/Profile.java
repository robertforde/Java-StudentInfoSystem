package com.sis.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="student")
public class Profile {
	@Id
	@Column(name="Sid")
    private String sid;
	@Column(name="Sname")
    private String sname;
	@Column(name="Password")
    private String password;
	@Column(name="Father_name")
    private String father_name;
	@Temporal (TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="DOB")
    private Date dob;
	@Column(name="Nationality")
    private String nationality;
	@Column(name="Address")
    private String address;
	@Column(name="City")
    private String city;
	@Column(name="Country")
    private String country;
	@Column(name="Phone")
    private String phone;
	@Column(name="Mobile")
    private String mobile;
	@Column(name="Email")
    private String email;
	@ManyToOne
	@JoinColumn(name = "Department_Id")
    private Department department;
	@Transient
	private int deptId;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sid")
	private List<AttendanceSub> attendanceSubs;

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

    public String getFather_name() {
        return father_name;
    }

    public void setFather_name(String father_name) {
        this.father_name = father_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	
	public boolean equals(Object o) {
		if(this.sid.endsWith(((Profile)o).getSid()))
			return true;
		return false;
	}
	
	public int hashcode() {
		return sname.length()+father_name.length()+nationality.length();
	}

	public List<AttendanceSub> getAttendanceSubs() {
		return attendanceSubs;
	}

	public void setAttendanceSubs(List<AttendanceSub> attendanceSubs) {
		this.attendanceSubs = attendanceSubs;
	}
	
}