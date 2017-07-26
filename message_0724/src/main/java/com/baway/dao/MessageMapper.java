package com.baway.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baway.pojo.Message;
import com.baway.pojo.User;

public interface MessageMapper {
	public void insertMessage(Message message);
	public List<User> selectUser();
	public List<Message> selectMessage(@Param("uid")String uid);
	public void deleteMessage(String uid);
}
