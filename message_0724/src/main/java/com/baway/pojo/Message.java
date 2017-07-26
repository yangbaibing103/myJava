package com.baway.pojo;

import java.util.Date;

public class Message {
	private Integer mid;
	private String content;
	private Date createtime;
	private User user;
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Message(Integer mid, String content, Date createtime, User user) {
		super();
		this.mid = mid;
		this.content = content;
		this.createtime = createtime;
		this.user = user;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Message [mid=" + mid + ", content=" + content + ", createtime="
				+ createtime + ", user=" + user + "]";
	}
	
}
