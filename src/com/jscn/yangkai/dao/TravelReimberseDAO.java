package com.jscn.yangkai.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.jscn.yangkai.entity.TravelReimberse;
import com.jscn.yangkai.util.ConnectionUtil;

@Repository
public class TravelReimberseDAO {
	@Resource ConnectionUtil conn;
	
	public boolean addTravelReimberse(TravelReimberse tr) throws Exception{
		PreparedStatement pstmt=null;
		String sql="insert into e_travelreimberse(username,name,createtime,lastmodifytime,lastmodifyusername,travelreason,startdate,enddate,startplace,endplace,leavevehicle,leavevehiclecost,returnvehicle,returnvehiclecost,accommodationtype,accommodationcost,accommodationremark,subsidytype,subsidyperday,subsidydays,subsidysum,othercontent,othercost,sum,state) values(?,?,now(),now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'待审核')";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, tr.getUsername());
			pstmt.setString(2, tr.getName());
			pstmt.setString(3, tr.getLastmodifyusername());
			pstmt.setString(4, tr.getTravelreason());
			pstmt.setString(5, tr.getStartdate());
			pstmt.setString(6, tr.getEnddate());
			pstmt.setString(7, tr.getStartplace());
			pstmt.setString(8, tr.getEndplace());
			pstmt.setString(9, tr.getLeavevehicle());
			pstmt.setBigDecimal(10, tr.getLeavevehiclecost());
			pstmt.setString(11, tr.getReturnvehicle());
			pstmt.setBigDecimal(12, tr.getReturnvehiclecost());
			pstmt.setString(13, tr.getAccommodationtype());
			pstmt.setBigDecimal(14, tr.getAccommodationcost());
			pstmt.setString(15, tr.getAccommodationremark());
			pstmt.setString(16, tr.getSubsidytype());
			pstmt.setBigDecimal(17, tr.getSubsidyperday());
			pstmt.setInt(18, tr.getSubsidydays());
			pstmt.setBigDecimal(19, tr.getSubsidysum());
			pstmt.setString(20, tr.getOthercontent());
			pstmt.setBigDecimal(21, tr.getOthercost());
			pstmt.setBigDecimal(22, tr.getSum());
			
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
	
	public List<TravelReimberse> queryTravelReimberse(String username)throws Exception{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from e_travelreimberse where username=? order by createtime desc";
		List<TravelReimberse> list=new ArrayList<TravelReimberse>();
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				TravelReimberse tr=new TravelReimberse();
				
				tr.setId(rs.getInt("id"));
				tr.setUsername(rs.getString("username"));
				tr.setName(rs.getString("name"));
				tr.setCreatetime(rs.getTimestamp("createtime"));
				tr.setLastmodifytime(rs.getTimestamp("lastmodifytime"));
				tr.setLastmodifyusername(rs.getString("lastmodifyusername"));
				tr.setTravelreason(rs.getString("travelreason"));
				tr.setStartdate(rs.getString("startdate"));
				tr.setEnddate(rs.getString("enddate"));
				tr.setStartplace(rs.getString("startplace"));
				tr.setEndplace(rs.getString("endplace"));
				tr.setLeavevehicle(rs.getString("leavevehicle"));
				tr.setLeavevehiclecost(rs.getBigDecimal("leavevehiclecost"));
				tr.setReturnvehicle(rs.getString("returnvehicle"));
				tr.setReturnvehiclecost(rs.getBigDecimal("returnvehiclecost"));
				tr.setAccommodationtype(rs.getString("accommodationtype"));
				tr.setAccommodationcost(rs.getBigDecimal("accommodationcost"));
				tr.setAccommodationremark(rs.getString("accommodationremark"));
				tr.setSubsidytype(rs.getString("subsidytype"));
				tr.setSubsidyperday(rs.getBigDecimal("subsidyperday"));
				tr.setSubsidydays(rs.getInt("subsidydays"));
				tr.setSubsidysum(rs.getBigDecimal("subsidysum"));
				tr.setOthercontent(rs.getString("othercontent"));
				tr.setOthercost(rs.getBigDecimal("othercost"));
				tr.setSum(rs.getBigDecimal("sum"));
				tr.setState(rs.getString("state"));
				
				list.add(tr);	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt,rs);
		}
		
		return list;
		
	}
	
	public TravelReimberse queryTravelReimburseById(int id)throws Exception{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		TravelReimberse tr=new TravelReimberse();
		
		String sql="select * from e_travelreimberse where id=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				tr.setId(rs.getInt("id"));
				tr.setUsername(rs.getString("username"));
				tr.setName(rs.getString("name"));
				tr.setCreatetime(rs.getTimestamp("createtime"));
				tr.setLastmodifytime(rs.getTimestamp("lastmodifytime"));
				tr.setLastmodifyusername(rs.getString("lastmodifyusername"));
				tr.setTravelreason(rs.getString("travelreason"));
				tr.setStartdate(rs.getString("startdate"));
				tr.setEnddate(rs.getString("enddate"));
				tr.setStartplace(rs.getString("startplace"));
				tr.setEndplace(rs.getString("endplace"));
				tr.setLeavevehicle(rs.getString("leavevehicle"));
				tr.setLeavevehiclecost(rs.getBigDecimal("leavevehiclecost"));
				tr.setReturnvehicle(rs.getString("returnvehicle"));
				tr.setReturnvehiclecost(rs.getBigDecimal("returnvehiclecost"));
				tr.setAccommodationtype(rs.getString("accommodationtype"));
				tr.setAccommodationcost(rs.getBigDecimal("accommodationcost"));
				tr.setAccommodationremark(rs.getString("accommodationremark"));
				tr.setSubsidytype(rs.getString("subsidytype"));
				tr.setSubsidyperday(rs.getBigDecimal("subsidyperday"));
				tr.setSubsidydays(rs.getInt("subsidydays"));
				tr.setSubsidysum(rs.getBigDecimal("subsidysum"));
				tr.setOthercontent(rs.getString("othercontent"));
				tr.setOthercost(rs.getBigDecimal("othercost"));
				tr.setSum(rs.getBigDecimal("sum"));
				tr.setState(rs.getString("state"));
			}
			return tr;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt,rs);
		}
		return null;
	}
	public void delTravelReimburseById(int id) throws Exception{
		PreparedStatement pstmt=null;
		String sql="delete from e_travelreimberse where id=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			conn.close(conn.getConnection(), pstmt);
		}
	}
	public boolean updateTravelReimburse(TravelReimberse tr)throws Exception{
		PreparedStatement pstmt=null;
		String sql="update e_travelreimberse set lastmodifytime=now(),lastmodifyusername=?,travelreason=?,startdate=?,enddate=?,startplace=?,endplace=?,leavevehicle=?,leavevehiclecost=?,returnvehicle=?,returnvehiclecost=?,accommodationtype=?,accommodationcost=?,accommodationremark=?,subsidytype=?,subsidyperday=?,subsidydays=?,subsidysum=?,othercontent=?,othercost=?,sum=? where id=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, tr.getLastmodifyusername());
			pstmt.setString(2, tr.getTravelreason());
			pstmt.setString(3, tr.getStartdate());
			pstmt.setString(4, tr.getEnddate());
			pstmt.setString(5, tr.getStartplace());
			pstmt.setString(6, tr.getEndplace());
			pstmt.setString(7, tr.getLeavevehicle());
			pstmt.setBigDecimal(8, tr.getLeavevehiclecost());
			pstmt.setString(9, tr.getReturnvehicle());
			pstmt.setBigDecimal(10, tr.getReturnvehiclecost());
			pstmt.setString(11, tr.getAccommodationtype());
			pstmt.setBigDecimal(12, tr.getAccommodationcost());
			pstmt.setString(13, tr.getAccommodationremark());
			pstmt.setString(14, tr.getSubsidytype());
			pstmt.setBigDecimal(15, tr.getSubsidyperday());
			pstmt.setInt(16, tr.getSubsidydays());
			pstmt.setBigDecimal(17, tr.getSubsidysum());
			pstmt.setString(18, tr.getOthercontent());
			pstmt.setBigDecimal(19, tr.getOthercost());
			pstmt.setBigDecimal(20, tr.getSum());
			pstmt.setInt(21, tr.getId());
			
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
	
	public List<TravelReimberse> queryAllTravelReimburse()throws Exception{
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from e_travelreimberse where 1=1 order by state desc,startdate";
		List<TravelReimberse> list=new ArrayList<TravelReimberse>();
		
		try {
			stmt=conn.getConnection().createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				TravelReimberse tr=new TravelReimberse();
				
				tr.setId(rs.getInt("id"));
				tr.setUsername(rs.getString("username"));
				tr.setName(rs.getString("name"));
				tr.setCreatetime(rs.getTimestamp("createtime"));
				tr.setLastmodifytime(rs.getTimestamp("lastmodifytime"));
				tr.setLastmodifyusername(rs.getString("lastmodifyusername"));
				tr.setTravelreason(rs.getString("travelreason"));
				tr.setStartdate(rs.getString("startdate"));
				tr.setEnddate(rs.getString("enddate"));
				tr.setStartplace(rs.getString("startplace"));
				tr.setEndplace(rs.getString("endplace"));
				tr.setLeavevehicle(rs.getString("leavevehicle"));
				tr.setLeavevehiclecost(rs.getBigDecimal("leavevehiclecost"));
				tr.setReturnvehicle(rs.getString("returnvehicle"));
				tr.setReturnvehiclecost(rs.getBigDecimal("returnvehiclecost"));
				tr.setAccommodationtype(rs.getString("accommodationtype"));
				tr.setAccommodationcost(rs.getBigDecimal("accommodationcost"));
				tr.setAccommodationremark(rs.getString("accommodationremark"));
				tr.setSubsidytype(rs.getString("subsidytype"));
				tr.setSubsidyperday(rs.getBigDecimal("subsidyperday"));
				tr.setSubsidydays(rs.getInt("subsidydays"));
				tr.setSubsidysum(rs.getBigDecimal("subsidysum"));
				tr.setOthercontent(rs.getString("othercontent"));
				tr.setOthercost(rs.getBigDecimal("othercost"));
				tr.setSum(rs.getBigDecimal("sum"));
				tr.setState(rs.getString("state"));
				
				list.add(tr);	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), stmt,rs);
		}
		
		return list;
	}
	
	public boolean updateTravelReimburseState(int id,String state)throws Exception{
		PreparedStatement pstmt=null;
		String sql="update e_travelreimberse set state=? where id=?";
		
		try {
			pstmt=conn.getConnection().prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setInt(2, id);
			
			return pstmt.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close(conn.getConnection(), pstmt);
		}
		return false;
	}
}
