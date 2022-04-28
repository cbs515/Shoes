package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shoes.model.MemberVo;
import com.shoes.util.DBManager;

public class MemberDAO {
	
	public Connection getConnection()throws Exception{
		Connection conn=null;
		Context initContext=new InitialContext();
		Context envContext=(Context)initContext.lookup("java:/comp/env");
		DataSource ds=(DataSource)envContext.lookup("jdbc/Oracle11g");
		conn=ds.getConnection();
		
		return conn;
	}
	
	public int userCheck(String user_id,String user_pw) {
		int result = -1;
		String sql="select user_password from shoesshop_user where user_id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1) !=null && rs.getString(1).equals(user_pw)) {
					result=1;
				} else {
					result=0;
				}
			} else {
				result=-1;
			}
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			try {
				if(rs != null) 
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public MemberVo getMember(String user_id) {
		MemberVo mvo = null;
		String sql="select * from shoesshop_user where user_id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				mvo=new MemberVo();
				mvo.setUser_number(rs.getInt("user_number"));
				mvo.setUser_id(rs.getString("user_id"));
				mvo.setUser_pw(rs.getString("user_password"));
				mvo.setUser_name(rs.getString("user_name"));
				mvo.setUser_email(rs.getString("user_email"));
				mvo.setUser_add(rs.getString("user_address"));
				mvo.setUser_phone(rs.getString("user_phone"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mvo;
		
		
	}
	
	
	
	
	public int confirmID(String user_id) {
		int result=-1;
		String sql="select user_id from shoesshop_user where user_id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			}else {
				result=-1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	    	try {
	    		if(rs != null)
	    			rs.close();
	    		if(pstmt != null)
	    			pstmt.close();
	    	    if(conn != null)
	    	    	conn.close();
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
		}
		
		return result;
	  }


	
	
	
	
	
	public int insertMember(MemberVo mvo) {
		int result = -1;
		String sql="insert into shoesshop_user values(?,?,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mvo.getUser_number());
			pstmt.setString(2, mvo.getUser_id());
			pstmt.setString(3, mvo.getUser_pw());
			pstmt.setString(4, mvo.getUser_name());
			pstmt.setString(5, mvo.getUser_email());
			pstmt.setString(6, mvo.getUser_add());
			pstmt.setString(7, mvo.getUser_phone());
			
			result=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	
	public int updateMember(MemberVo mvo) {
		int result = -1;
		String sql="update shoesshop_user set user_password=?, user_email=?, user_address=?, user_phone=? where user_name=? and user_id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, mvo.getUser_pw());
			pstmt.setString(2, mvo.getUser_email());
			pstmt.setString(3, mvo.getUser_add());
			pstmt.setString(4, mvo.getUser_phone());
			pstmt.setString(5, mvo.getUser_name());
			pstmt.setString(6, mvo.getUser_id());
			
			result=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}

}
