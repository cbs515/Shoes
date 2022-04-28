package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoes.model.Bought;
import com.shoes.model.boughtVO;
import com.shoes.util.DBManager;

public class BoughtDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 
	
	public int insertBought(Bought bo) {
		String sql="insert into bought values(?,?,?,?,?,?)";
		int result = -1;
		try {
			conn=DBManager.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bo.getUserID());
			pstmt.setString(2, bo.getProduct_Name());
			pstmt.setInt(3, bo.getQuantity());
			pstmt.setString(4, bo.getShoessize());
			pstmt.setInt(5, bo.getTotal());
			pstmt.setInt(6, 1);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
	public ArrayList<boughtVO> getbought(String userID){
		String sql="select * from bought where user_id=?";
		ArrayList<boughtVO> list=new ArrayList<boughtVO>();
		try {
			conn=DBManager.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				boughtVO bvo=new boughtVO();
				bvo.setUserId(rs.getString(1));
				bvo.setProductName(rs.getString(2));
				bvo.setQuantity(rs.getInt(3));
				bvo.setShoesSize(rs.getString(4));
				bvo.setTotal(rs.getInt(5));
				bvo.setFix(rs.getInt(6));
				list.add(bvo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int updateFix(String userid, String productName, String shoesSize) {
		int result=-1;
		String sql="update bought set fix=? where user_id=? and product_name=? and shoessize=?";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, userid);
			pstmt.setString(3, productName);
			pstmt.setString(4, shoesSize);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
	
}
