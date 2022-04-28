package com.shoes.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoes.model.Bbs;
import com.shoes.util.DBManager;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public String getDate() {
		String date="";
		String sql="SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD hh24:mi:ss') FROM DUAL";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				date=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return date;
	}
	
	public int getNext() {
		int next=0;
		String sql="select bbsID from BBS order by bbsID desc";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				next= rs.getInt(1)+1;
			}else {
				next= 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return next;
	}
	
	public int write(int next,String bbsTitle,String userID,String bbsContent,String date) {
		int result=-1;
		String sql="insert into bbs values(?,?,?,?,?,?)";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,next);
			pstmt.setString(2,bbsTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4,date);
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	public ArrayList<Bbs> getList(int start,int end){
		String sql="select * from(select A.*,Rownum Rnum from(select * from bbs order by bbsdate desc)A)"+"where Rnum  >= ? and Rnum <= ? order by Rnum asc";
		ArrayList<Bbs> list= new ArrayList<Bbs>();
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();

				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
public int getcount() {
	    int count=0;
		String sql="select count(*) from bbs ";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return count;
	}
	
	public boolean nextPage(int pageNumber) {
		boolean result=false;
		String sql="select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	public Bbs getBbs(int bbsID) {
		String sql="select * from bbs where bbsID =?";
		Bbs bbs = new Bbs();
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return bbs;
	}
	
	public int update(int bbsID,String bbsTitle,String bbsContent) {
		int result=-1;
		String sql="update bbs set bbsTitle=?, bbsContent=? where bbsID=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,bbsTitle);
			pstmt.setString(2,bbsContent);
			pstmt.setInt(3,bbsID);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
	
	public int delete(int bbsID) {
		int result=-1;
		String sql="delete from reply where bbsID=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			pstmt.executeUpdate();
			sql="delete from bbs where bbsID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
}