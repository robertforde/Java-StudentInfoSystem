package com.sis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Message {
	@Column(name="FromName")
    private String fromName;
	@Column(name="FromId")
    private String fromId;
	@Column(name="ToId")
    private String toId;
	@Column(name="Message")
    private String message;
	@Column(name="Checked")
    private int checked;
	@Id
	@Column(name="ID")
	private int id;

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public String getToId() {
        return toId;
    }

    public void setToId(String toId) {
        this.toId = toId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}
    
}
