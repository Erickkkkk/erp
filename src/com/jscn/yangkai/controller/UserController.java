package com.jscn.yangkai.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jscn.yangkai.entity.User;
import com.jscn.yangkai.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	UserService userService;

	@RequestMapping("queryUser")
	public String queryUser(HttpServletRequest request) throws Exception {

		ArrayList<User> list = userService.queryUser();
		request.setAttribute("list", list);
		return "user";
	}

	@RequestMapping("checkExist")
	@ResponseBody
	public String checkExist(HttpServletRequest request) throws Exception {
		String username = request.getParameter("username");
		return userService.checkExist(username);
	}

	@RequestMapping("addUser")
	@ResponseBody
	public String addUser(HttpServletRequest request) throws Exception {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setSex(Integer.parseInt(request.getParameter("sex")));
		user.setOrganize(request.getParameter("organize"));
		user.setDuty(request.getParameter("duty"));
		user.setRoleid(Integer.parseInt(request.getParameter("roleid")));
		user.setState(Integer.parseInt(request.getParameter("state")));
		user.setPhone(request.getParameter("phone"));
		return userService.addUser(user);
	}

	@RequestMapping("delUser")
	public String delUser(HttpServletRequest request) throws Exception {
		userService.delUser(request.getParameter("username"));
		ArrayList<User> list = userService.queryUser();
		request.setAttribute("list", list);
		return "user";
	}

	@RequestMapping("queryByUsername")
	public String queryByUserame(HttpServletRequest request) throws Exception {
		request.setAttribute("user",
				userService.queryByUsername(request.getParameter("username")));
		return "edituser";
	}

	@RequestMapping("updateUser")
	@ResponseBody
	public String updateUser(HttpServletRequest request) throws Exception {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setSex(Integer.parseInt(request.getParameter("sex")));
		user.setOrganize(request.getParameter("organize"));
		user.setDuty(request.getParameter("duty"));
		user.setRoleid(Integer.parseInt(request.getParameter("roleid")));
		user.setState(Integer.parseInt(request.getParameter("state")));
		user.setPhone(request.getParameter("phone"));
		return userService.updateUser(user);
	}

	@RequestMapping("loginCheck")
	@ResponseBody
	public String loginCheck(HttpServletRequest request) throws Exception {
		Map<User, String> map = userService.loginCheck(
				request.getParameter("username"),
				request.getParameter("password"));
		Set<Entry<User, String>> set = map.entrySet();
		Iterator<Entry<User, String>> it = set.iterator();
		Map.Entry<User, String> entry = null;
		while (it.hasNext()) {
			entry = (Map.Entry<User, String>) it.next();
		}
		if (entry.getKey() != null) {
			request.getSession().setAttribute("logininfo", entry.getKey());
			request.getSession().setAttribute("loginres", entry.getValue());
		}
		return String.valueOf(entry.getKey().getUsername() != null);
	}
	@RequestMapping("exit")
	public String exit(HttpServletRequest request) throws Exception{
		request.getSession().setAttribute("logininfo", null);
		request.getSession().setAttribute("loginres", null);
		return "login";
	}
	
	@RequestMapping("changePassword")
	@ResponseBody
	public String changePassword(HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("logininfo");
		user.setPassword(request.getParameter("passwordchange"));
		request.getSession().setAttribute("logininfo", user);
		return userService.changePassword(request.getParameter("loginusername"), request.getParameter("passwordchange"));
	}
	@RequestMapping("changePersonalInfo")
	@ResponseBody
	public String changePersonalInfo(HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("logininfo");
		user.setEmail(request.getParameter("emailchange"));
		user.setPhone(request.getParameter("phonechange"));
		request.getSession().setAttribute("logininfo", user);
		return userService.changePersonalInfo(request.getParameter("loginusername"), request.getParameter("emailchange"), request.getParameter("phonechange"));
	}
}
