package com.jscn.yangkai.service;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jscn.yangkai.dao.UserDAO;
import com.jscn.yangkai.entity.User;

@Service
public class UserService {
	@Resource
	UserDAO userDAO;

	public ArrayList<User> queryUser() throws Exception {
		ArrayList<User> list = userDAO.queryUser();
		return list;
	}
	
	public String checkExist(String username) throws Exception{
		return String.valueOf(userDAO.queryByUsername(username).getUsername()!=null);
	}
	
	public String addUser(User user) throws Exception {
		return String.valueOf(userDAO.addUser(user));
	}
	
	public void delUser(String username) throws Exception{
		userDAO.delUser(username);
	}
	public User queryByUsername(String username)throws Exception{
		return userDAO.queryByUsername(username);
	}
	public String updateUser(User user)throws Exception{
		return String.valueOf(userDAO.updateUser(user));
	}
	public Map<User,String> loginCheck(String username,String password) throws Exception{
		return userDAO.loginCheck(username, password);
	}
	public String changePassword(String loginusername,String changepassword)throws Exception{
		return String.valueOf(userDAO.changePassword(loginusername, changepassword));
	}
	public String changePersonalInfo(String loginusername,String emailchange,String phonechange)throws Exception{
		return String.valueOf(userDAO.changePersonalInfo(loginusername, emailchange, phonechange));
	}
}
