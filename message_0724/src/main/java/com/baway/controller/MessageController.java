package com.baway.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baway.pojo.Message;
import com.baway.pojo.User;
import com.baway.service.MessageService;

@Controller
@RequestMapping("message")
public class MessageController {
@Autowired 
	private MessageService service;
@RequestMapping("selectUser")
@ResponseBody
	public List<User> selectUser(Model model){
	     System.out.println("===================================");
	     List<User> user = service.selectUser();
	     System.out.println(user);
	    return user;
} 
    	@RequestMapping("insertMessage")
    	public String insertMessage(String ids,String content){
    		System.out.println(ids+"============="+content);
    		String[] id=ids.split(",");
    		for (int j = 0; j < id.length; j++) {
			Message message=new Message();
    		Date date = new Date();
    		message.setCreatetime(date);
    		message.setContent(content);
    		User user = new User();
    		user.setUid(Integer.parseInt(id[j]));
    		message.setUser(user);
    		System.out.println(message);
    		service.insertMessage(message);
			}
			return "success";
    		
    		
    	}
    	@RequestMapping("selectMessage")
    	@ResponseBody
    	public List<Message> selectMessage(String uid){
    		System.out.println(uid);
    		List<Message> list = service.selectMessage(uid);
    		
    		return list;
    		
    	}
}
