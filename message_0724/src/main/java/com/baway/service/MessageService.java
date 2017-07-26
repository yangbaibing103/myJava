package com.baway.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baway.pojo.Message;
import com.baway.pojo.User;

public interface MessageService {
	public void insertMessage(Message message);
	public List<User> selectUser();
	public List<Message> selectMessage(@Param("uid")String uid);
	public void deleteMessage(String uid);
}
