package com.jscn.yangkai.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jscn.yangkai.entity.Role;
import com.jscn.yangkai.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {

	@Resource
	RoleService roleService;

	@RequestMapping("queryRole")
	public String queryRole(HttpServletRequest request) throws Exception {
		request.setAttribute("list", roleService.queryRole());
		return "role";
	}

	@RequestMapping("queryRoleAjax")
	@ResponseBody
	public String queryRoleAjax(HttpServletResponse response) throws Exception {
		return JSONArray.fromObject(roleService.queryRole()).toString();
	}

	@RequestMapping("checkExist")
	@ResponseBody
	public String checkExist(String rolename) throws Exception {
		return roleService.checkExist(rolename);
	}

	@RequestMapping("queryResource")
	@ResponseBody
	public String queryResource(HttpServletResponse response) throws Exception {
		return JSONArray.fromObject(roleService.queryResource()).toString();
	}

	@RequestMapping("addRole")
	@ResponseBody
	public String addRole(HttpServletRequest request) throws Exception {
		Role role = new Role();
		role.setRolename(request.getParameter("rolename"));
		role.setRoledescription(request.getParameter("roledescription"));
		role.setState(Integer.parseInt(request.getParameter("state")));
		return roleService.addRole(role);
	}

	@RequestMapping("delRole")
	public String delRole(HttpServletRequest request) throws Exception {
		roleService.delRole(Integer.parseInt(request.getParameter("roleid")));
		request.setAttribute("list", roleService.queryRole());
		return "role";
	}

	@RequestMapping("queryByRolename")
	public String queryByRolename(HttpServletRequest request) throws Exception {
		request.setAttribute("role",
				roleService.queryByRolename(request.getParameter("rolename")));
		return "editrole";
	}

	@RequestMapping("updateRole")
	@ResponseBody
	public String updateRole(HttpServletRequest request) throws Exception {
		Role role = new Role();
		role.setRolename(request.getParameter("rolename"));
		role.setRoledescription(request.getParameter("roledescription"));
		role.setState(Integer.parseInt(request.getParameter("state")));
		return roleService.updateRole(role);
	}

	@RequestMapping("queryResByRoleid")
	@ResponseBody
	public String queryResByRoleid(HttpServletRequest request) throws Exception {
		return JSONArray.fromObject(
				roleService.queryResByRoleid(Integer.parseInt(request
						.getParameter("roleid")))).toString();
	}
	
	@RequestMapping("updateResByRoleid")
	public void updateResByRoleid(HttpServletRequest request)throws Exception{
		String[] temp=request.getParameter("checked").split(",");
		int[] checked=new int[temp.length];
		for(int i=0;i<temp.length;i++)checked[i]=Integer.parseInt(temp[i]);
		roleService.updateResByRoleid(Integer.parseInt(request.getParameter("roleid")), checked);
	}

}
