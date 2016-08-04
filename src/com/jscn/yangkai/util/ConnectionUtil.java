package com.jscn.yangkai.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Service;


@Service
public class ConnectionUtil {

	public  Connection getConnection() throws Exception {

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/erp?user=root&password=&useUnicode=true&characterEncoding=utf8&autoReconnect=true&failOverReadOnly=false&zeroDateTimeBehavior=convertToNull");
		return conn;
	}

	public void close(Connection con, Statement stmt) {

		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public  void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void close(Connection con, PreparedStatement pstmt) {

		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void close(Connection con, PreparedStatement pstmt,
			ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
