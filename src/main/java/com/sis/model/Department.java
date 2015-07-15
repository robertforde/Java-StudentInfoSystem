package com.sis.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name="department")
public class Department {
	@Id
	@Column(name="Department_Id")
    private int departmentId;
	@Column(name="Name")
    private String name;
	@Column(name="Abbreviation")
    private String abbreviation;
	@Column(name="NextNum")
    private int nextNum;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "department")
	private List<Profile> profiles;

    public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public int getNextNum() {
        return nextNum;
    }

    public void setNextNum(int nextNum) {
        this.nextNum = nextNum;
    }

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}

}
