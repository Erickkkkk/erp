package com.jscn.yangkai.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.jscn.yangkai.entity.User;
import com.jscn.yangkai.util.ConnectionUtil;

@Repository
public class UserDAO {

	@Resource
	ConnectionUtil conn;

	public ArrayList<User> queryUser() throws Exception {

		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<User> list = new ArrayList<User>();

		String sql = "select u.id,u.username,u.state,f.name,r.name rolename,u.lastlogintime  from e_user u,e_user_info f,e_user_role ur,e_role r where u.username=f.username and u.username=ur.username and ur.roleid=r.id";

		try {
			stmt = conn.getConnection().createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				User u = new User();

				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setState(rs.getInt("state"));
				u.setName(rs.getString("name"));
				u.setRolename(rs.getString("rolename"));
				u.setLastlogintime(rs.getTimestamp("lastlogintime"));

				list.add(u);

			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close(conn.getConnection(), stmt, rs);
		}

		return list;
	}

	public User queryByUsername(String username) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = new User();

		String sql = "select u.username,u.password,u.state,u.createtime,i.name,i.sex,i.organize,i.duty,i.phone,i.email,r.id roleid,r.name rolename from e_user u,e_user_info i,e_user_role ur,e_role r where u.username=i.username and ur.username=u.username and ur.roleid=r.id and u.username=?";

		try {

			pstmt = conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setState(rs.getInt("state"));
				user.setCreatetime(rs.getTimestamp("createtime"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getInt("sex"));
				user.setOrganize(rs.getString("organize"));
				user.setDuty(rs.getString("duty"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setRoleid(rs.getInt("roleid"));
				user.setRolename(rs.getString("rolename"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt, rs);
		}

		return user;
	}

	public boolean addUser(User user) throws Exception {
		PreparedStatement pstmt = null;
		String sql1 = "insert into e_user (username,password,state,createtime,lastlogintime) values (?,?,?,now(),now())";
		String sql2 = "insert into e_user_info (username,name,sex,organize,duty,phone,email) values (?,?,?,?,?,?,?)";
		String sql3 = "insert into e_user_role (username,roleid) values (?,?)";
		try {
			pstmt = conn.getConnection().prepareStatement(sql1);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setInt(3, user.getState());
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql2);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getName());
			pstmt.setInt(3, user.getSex());
			pstmt.setString(4, user.getOrganize());
			pstmt.setString(5, user.getDuty());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getEmail());
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql3);
			pstmt.setString(1, user.getUsername());
			pstmt.setInt(2, user.getRoleid());
			return pstmt.executeUpdate()>0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}

	public void delUser(String username) throws Exception {
		PreparedStatement pstmt = null;
		String sql1 = "delete from e_user where username=?";
		String sql2 = "delete from e_user_info where username=?";
		String sql3 = "delete from e_user_role where username=?";

		try {
			pstmt = conn.getConnection().prepareStatement(sql1);
			pstmt.setString(1, username);
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql2);
			pstmt.setString(1, username);
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql3);
			pstmt.setString(1, username);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}

	}

	public boolean updateUser(User user) throws Exception {
		PreparedStatement pstmt = null;
		String sql1 = "update e_user set password=? , state=? where username=?";
		String sql2 = "update e_user_info set name=? , sex=? , organize=? , duty=? , phone=? , email=? where username=?";
		String sql3="update e_user_role set username=? , roleid=? where username=?";
		
		try {
			pstmt = conn.getConnection().prepareStatement(sql1);
			pstmt.setString(1, user.getPassword());
			pstmt.setInt(2, user.getState());
			pstmt.setString(3, user.getUsername());
			pstmt.executeUpdate();

			pstmt = conn.getConnection().prepareStatement(sql2);
			pstmt.setString(1, user.getName());
			pstmt.setInt(2, user.getSex());
			pstmt.setString(3, user.getOrganize());
			pstmt.setString(4, user.getDuty());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getUsername());
			pstmt.executeUpdate();
			
			pstmt=conn.getConnection().prepareStatement(sql3);
			pstmt.setString(1, user.getUsername());
			pstmt.setInt(2, user.getRoleid());
			pstmt.setString(3, user.getUsername());
			return pstmt.executeUpdate()>0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
	
	public Map<User,String> loginCheck(String username,String password) throws Exception{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<User,String> map=new HashMap<User, String>();
		String sql1="select u.username,u.password, ui.name,ui.organize,ui.duty,ui.email,ui.phone,r.name rolename from e_user u,e_user_info ui,e_user_role ur,e_role r where u.username=? and u.password=binary ? and u.username=ui.username and u.username=ur.username and ur.roleid=r.id and u.state=0 and r.state=0";
		String sql2="select rr.resid from e_user_role ur,e_role_res rr where ur.username=? and rr.roleid=ur.roleid";
		String sql3="update e_user set lastlogintime=now() where username=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql1);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			User user=new User();
			String res = "";
			
			if(rs.next()){
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setOrganize(rs.getString("organize"));
				user.setDuty(rs.getString("duty"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setRolename(rs.getString("rolename"));
			}
			
			if(user.getUsername()!=null){
				pstmt=conn.getConnection().prepareStatement(sql2);
				pstmt.setString(1,username);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					res+=rs.getInt("resid")+",";
				}
				if(res!="")res=res.substring(0,res.length()-1);
			}
			
			if(user.getUsername()!=null){
				pstmt=conn.getConnection().prepareStatement(sql3);
				pstmt.setString(1, username);
				pstmt.executeUpdate();
			}
			
			map.put(user, res);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt, rs);
		}
		return map;
	}
	
	public boolean changePassword(String loginusername,String changepassword)throws Exception{
		PreparedStatement pstmt=null;
		String sql="update e_user set password=? where username=?";
		
		try {
			
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, changepassword);
			pstmt.setString(2, loginusername);
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
	public boolean changePersonalInfo(String loginusername,String emailchange,String phonechange)throws Exception{
		PreparedStatement pstmt=null;
		String sql="update e_user_info set email=? ,phone=? where username=?";
		
		try {
			
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, emailchange);
			pstmt.setString(2, phonechange);
			pstmt.setString(3, loginusername);
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
}
