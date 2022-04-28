package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoes.model.Reply;
import com.shoes.util.DBManager;

public class ReplyDAO {

	private Connection conn; 
	private ResultSet rs; 
	private PreparedStatement pstmt;
	
	public ArrayList<Reply> getList(int start,int end,int bbsID){
		String SQL="select * from(select A.*,Rownum Rnum from(select * from reply where bbsID=? order by replyID asc)A)"+"where Rnum  >= ? and Rnum <= ? order by Rnum asc";
		ArrayList<Reply> list=new ArrayList<Reply>();
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply reply=new Reply();
				
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBbsID(rs.getInt(4));
				reply.setReplyAvailable(1);
				reply.setReplyDate(rs.getString(6));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int getcount(int bbsID) {
		
	    int result=0;
		String sql="select count(*) from reply where bbsID=? ";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	public boolean nextPage(int next,int pageNumber) {
		String sql="select * from reply where replyID < ? and bbsAvailable = 1";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, next - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return false;
	}
	
	public Reply getReply(int replyID) {
		Reply reply=new Reply();
		String sql="select * from reply where replyID=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, replyID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				reply.setUserID(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBbsID(rs.getInt(4));
				reply.setReplyAvailable(rs.getInt(5));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return reply;
	}
	
	public int getNext() {
		int next=-1;
		String SQL="select replyID FROM REPLY ORDER BY replyID DESC";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1));
				next=rs.getInt(1)+1;
			}else {
				next=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return next;
	}
	
	public int write(int next,int bbsID,String replyContent,String userID) {
		String SQL="INSERT INTO REPLY VALUES(?,?,?,?,?,sysdate)";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setInt(2, next);
			pstmt.setString(3, replyContent);
			pstmt.setInt(4,bbsID);
			pstmt.setInt(5,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return -1;
	}
	
	public int update(int replyID,String replyContent) {
		String sql="update reply set replyContent=? where replyID=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,replyContent);
			pstmt.setInt(2,replyID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return -1;
	}
	public int delete(int replyID) {
		String SQL="delete from reply where replyID=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, replyID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);	
		}
		return -1;
	}
	
	
}