package com.baway.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baway.dao.MessageMapper;
import com.baway.pojo.Message;
import com.baway.pojo.User;
import com.baway.service.MessageService;
@Service
@Transactional
public class MessageServiceImpl implements MessageService{
@Autowired
    private MessageMapper mm;
	@Override
	public void insertMessage(Message message) {
		// TODO Auto-generated method stub
		mm.insertMessage(message);
	}
	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return mm.selectUser();
	}
	@Override
	public List<Message> selectMessage(String uid) {
		// TODO Auto-generated method stub
		return mm.selectMessage(uid);
	}
	@Override
	public void deleteMessage(String uid) {
		// TODO Auto-generated method stub
		mm.deleteMessage(uid);
	}
}
