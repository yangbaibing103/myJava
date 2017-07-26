package com.baway.pojo;

import java.util.List;

public class User {
	private Integer uid;
	private String uname;
	private String upass;
	private String ugender;
	private List<Message> list;
	
	public List<Message> getList() {
		return list;
	}
	public void setList(List<Message> list) {
		this.list = list;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public User(Integer uid, String uname, String upass, String ugender) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upass = upass;
		this.ugender = ugender;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upass=" + upass
				+ ", ugender=" + ugender + "]";
	}
	
}
