package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoes.model.Cart;
import com.shoes.util.DBManager;

public class CartDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs; 
	
	public ArrayList<Cart> getcart(String userID){
		String sql="select * from cart where user_id=?";
		ArrayList<Cart> list= new ArrayList<Cart>();
		try {
			conn=DBManager.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Cart cart=new Cart();
				cart.setUserID(rs.getString(1));
				cart.setProduct_Name(rs.getString(2));
				cart.setQuantity(rs.getInt(3));
				cart.setShoessize(rs.getNString(4));
				String sql2="select price,product_Picture from shoesshop_product where product_Name=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1,cart.getProduct_Name());
				ResultSet rs2=pstmt2.executeQuery();
				if(rs2.next()) {
					cart.setPrice(rs2.getInt(1));
					cart.setProduct_Picture(rs2.getString(2));
				}
				list.add(cart);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int delete(String userID, String product_Name, String shoessize) {
		int result=-1;
		String sql="delete from cart where product_Name=? and user_id=? and shoessize=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, product_Name);
			pstmt.setString(2, userID);
			pstmt.setString(3, shoessize);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
		
	}
	public int deleteall(String userID) {
		int result=-1;
		String sql="delete from cart where user_id=?";
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
	
	public int myCartCount(String userid) {
		String sql="select count(*) from cart where user_id=?";
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
}
