package com.jscn.yangkai.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.jscn.yangkai.entity.Role;
import com.jscn.yangkai.entity.RoleRes;
import com.jscn.yangkai.util.ConnectionUtil;

@Repository
public class RoleDAO {

	@Resource
	ConnectionUtil conn;

	public List<Role> queryRole() throws Exception {

		Statement stmt = null;
		ResultSet rs = null;
		List<Role> list = new ArrayList<Role>();
		String sql = "select * from e_role where 1=1";

		try {
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				Role r = new Role();
				r.setRoleid(rs.getInt("id"));
				r.setRolename(rs.getString("name"));
				r.setRoledescription(rs.getString("description"));
				r.setState(rs.getInt("state"));

				list.add(r);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), stmt, rs);
		}

		return list;
	}

	public Role queryByRolename(String rolename) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Role role = new Role();

		String sql = "select id ,name,description,state from e_role where name=?";

		try {
			pstmt = conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, rolename);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				role.setRoleid(rs.getInt("id"));
				role.setRolename(rs.getString("name"));
				role.setRoledescription(rs.getString("description"));
				role.setState(rs.getInt("state"));
			}

			return role;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt, rs);
		}

		return null;
	}

	public List<Role> queryResource() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		List<Role> list = new ArrayList<Role>();
		String sql = "select * from e_resource where 1=1";

		try {
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Role r = new Role();
				r.setResid(rs.getInt("id"));
				r.setResname(rs.getString("name"));
				r.setResgroup(rs.getString("group"));
				r.setResdescription(rs.getString("description"));

				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), stmt, rs);
		}
		return list;
	}
	
	public boolean addRole(Role role)throws Exception{
		PreparedStatement pstmt=null;
		String sql="insert into e_role (name,description,state) values (?,?,?)";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, role.getRolename());
			pstmt.setString(2, role.getRoledescription());
			pstmt.setInt(3, role.getState());
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
	
	public void delRole(int roleid) throws Exception {
		PreparedStatement pstmt = null;
		String sql1 = "delete from e_role where id=?";
		String sql2 = "delete from e_role_res where roleid=?";

		try {
			pstmt = conn.getConnection().prepareStatement(sql1);
			pstmt.setInt(1, roleid);
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql2);
			pstmt.setInt(1, roleid);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}

	}
	
	public boolean updateRole(Role role) throws Exception{
		PreparedStatement pstmt=null;
		String sql="update e_role set description=? , state=? where name=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, role.getRoledescription());
			pstmt.setInt(2, role.getState());
			pstmt.setString(3, role.getRolename());
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conn.close(conn.getConnection(), pstmt);
		}
		
		return false;
	}
	
	public List<RoleRes> queryResByRoleid(int roleid)throws Exception{
		PreparedStatement pstmt=null;
		String sql="select * from e_role_res where roleid=?";
		ResultSet rs=null;
		List<RoleRes> list=new ArrayList<RoleRes>();
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setInt(1, roleid);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				RoleRes r=new RoleRes();
				r.setId(rs.getInt("id"));
				r.setRoleid(rs.getInt("roleid"));
				r.setResid(rs.getInt("resid"));
				
				list.add(r);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			conn.close(conn.getConnection(), pstmt);
		}
		
		return list;
		
	}
	
	public void updateResByRoleid(int roleid,int[] checked) throws Exception{
		PreparedStatement pstmt=null;
		String sql1="delete from e_role_res where roleid=?";
		String sql2="insert into e_role_res (roleid,resid) values (?,?)";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql1);
			pstmt.setInt(1, roleid);
			pstmt.executeUpdate();
			
			for(int i=0;i<checked.length;i++){
				pstmt=conn.getConnection().prepareStatement(sql2);
				pstmt.setInt(1, roleid);
				pstmt.setInt(2, checked[i]);
				pstmt.executeUpdate();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			conn.close(conn.getConnection(), pstmt);
		}
		
	}

}
