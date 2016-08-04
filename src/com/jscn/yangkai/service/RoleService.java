package com.jscn.yangkai.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jscn.yangkai.dao.RoleDAO;
import com.jscn.yangkai.entity.Role;
import com.jscn.yangkai.entity.RoleRes;

@Service
public class RoleService {
	
	@Resource
	RoleDAO roleDAO;
	
	public List<Role> queryRole() throws Exception{
		return roleDAO.queryRole();
	}
	
	public String checkExist(String rolename)throws Exception{
		return String.valueOf(roleDAO.queryByRolename(rolename).getRolename()!=null);
	}
	
	public List<Role> queryResource() throws Exception{
		return roleDAO.queryResource();
	}
	
	public String addRole(Role role)throws Exception{
		return String.valueOf(roleDAO.addRole(role));
	}
	public void delRole(int roleid) throws Exception{
		roleDAO.delRole(roleid);
	}
	public Role queryByRolename(String rolename)throws Exception{
		return roleDAO.queryByRolename(rolename);
	}
	public String updateRole(Role role)throws Exception{
		return String.valueOf(roleDAO.updateRole(role));
	}
	public List<RoleRes> queryResByRoleid(int roleid)throws Exception{
		return roleDAO.queryResByRoleid(roleid);
	}
	public void updateResByRoleid (int roleid,int[] checked)throws Exception{
		roleDAO.updateResByRoleid(roleid, checked);
	}
}
