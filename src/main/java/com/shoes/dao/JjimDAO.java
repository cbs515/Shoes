package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoes.model.Jjim;
import com.shoes.util.DBManager;

public class JjimDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ArrayList<Jjim> getjim(String userID){
		String sql="select * from jjimlist where user_id=?";
		ArrayList<Jjim> list=new ArrayList<Jjim>();
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setNString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Jjim jim=new Jjim();
				jim.setUserID(rs.getString(1));
				jim.setProduct_Name(rs.getString(2));
				String sql2="select price,product_picture from shoesshop_product where product_name=?";
				PreparedStatement pstmt2=conn.prepareStatement(sql2);
				pstmt2.setString(1, jim.getProduct_Name());
				ResultSet rs2=pstmt2.executeQuery();
				if(rs2.next()) {
					jim.setPrice(rs2.getInt(1));
					jim.setProduct_Picture(rs2.getString(2));
				}
				list.add(jim);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int delete(String userID,String product_Name) {
		int result=-1;
		String sql="delete from jjimlist where product_name=? and user_id=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, product_Name);
			pstmt.setString(2, userID);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
	
	public int alldelete(String userID) {
		int result=-1;
		String sql="delete from jjimlist where user_id=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
	
	public int myJjimCount(String userid) {
		String sql="select count(*) from jjimlist where user_id=?";
		int count=0;
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return count;
	}
	
	public int insertJjim(String userid, String productName) {
		int result=-1;
		String sql="insert into jjimlist values(?,?)";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, productName);
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
}
