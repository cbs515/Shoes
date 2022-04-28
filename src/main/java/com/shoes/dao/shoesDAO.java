package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.shoes.model.Cart;
import com.shoes.model.boughtVO;
import com.shoes.model.productVO;
import com.shoes.model.questionsVO;
import com.shoes.util.DBManager;

public class shoesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public productVO getProductInfo(String productName) {
		productVO vo=new productVO();
		String sql="select * from shoesShop_product where product_name=?";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,productName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setGender(rs.getString(1));
				vo.setBrand(rs.getString(2));
				vo.setCategory(rs.getString(3));
				vo.setProductName(rs.getString(4));
				vo.setProductPicture(rs.getString(5));
				vo.setPrice(rs.getInt(6));
				vo.setProductInfo(rs.getString(7));
				vo.setScore(rs.getFloat(8));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	public int getQuestionCount(String productName) {
		String sql="select count(*) from questions where option_='question' and product_name=?";
		int count=0;
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return count;
	}
	
	public Vector<questionsVO> getProductQuestions(int startRow, int endRow, String productName){
		String sql="select * from(select A.*,Rownum Rnum from(select * from questions where option_='question' order by ref_ desc,level_ asc)A)"+"where Rnum >= ? and Rnum <= ? and product_name=?";
		Vector<questionsVO> vec = new Vector<>();
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, productName);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				questionsVO qvo=new questionsVO();
				qvo.setOption(rs.getString(1));
				qvo.setUserId(rs.getString(2));
				qvo.setProductName(rs.getString(3));
				qvo.setComent(rs.getString(4));
				qvo.setRef_(rs.getInt(5));
				qvo.setLevel_(rs.getInt(6));
				qvo.setDate(rs.getString(7));
				vec.add(qvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return vec;
	}
	
	public int insertQuestion(String userId, String productName, String coment){
		int result=0;
		int ref=0;
		int level=1;
		String question="question";
		String refsql="select max(ref_) from questions";
		String sql="insert into questions values(?,?,?,?,?,?,sysdate,0)";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(refsql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ref=rs.getInt(1)+1;
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,question);
			pstmt.setString(2,userId);
			pstmt.setString(3,productName);
			pstmt.setString(4,coment);
			pstmt.setInt(5,ref);
			pstmt.setInt(6,level);
			
			pstmt.executeUpdate();
			result=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int getUserType(String userid) {
		String sql="select user_number from shoesshop_user where user_id=?";
		int userNumber=-1;
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				userNumber=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return userNumber;
	}
	
	public int insertAnswer(String userId, String productName, String coment,int ref){
		int level=2;
		int result=-1;
		String question="question";
		String sql="insert into questions values(?,?,?,?,?,?,sysdate,0)";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,question);
			pstmt.setString(2,userId);
			pstmt.setString(3,productName);
			pstmt.setString(4,coment);
			pstmt.setInt(5,ref);
			pstmt.setInt(6,level);
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int delQuestion(int ref,String productName) {
		int result=-1;
		String sql="delete from questions where ref_=? and product_name=?";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,ref);
			pstmt.setString(2,productName);
			
			result=pstmt.executeUpdate();
			
			sql="update shoesshop_product A set (A.score) = (select avg(b.score) from questions B where product_name=? and option_='review') where product_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, productName);
			pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
	
	public int delMyReview(int ref,String userid,String productName) {
		int result=-1;
		String sql="delete from questions where ref_=? and user_id=?";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,ref);
			pstmt.setString(2,userid);
			
			result=pstmt.executeUpdate();
			
			sql="update shoesshop_product A set (A.score) = (select avg(b.score) from questions B where product_name=? and option_='review') where product_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, productName);
			pstmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
	
	public int getReviewCount(String productName) {
		String sql="select count(*) from questions where option_='review' and product_name=?";
		int count=0;
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public Vector<questionsVO> getProductReviews(int startRow, int endRow, String productName){
		String sql="select * from(select A.*,Rownum Rnum from(select * from questions where option_='review' and product_name=? order by ref_ desc,level_ asc)A)"+"where Rnum >= ? and Rnum <= ?";
		Vector<questionsVO> vec = new Vector<>();
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				questionsVO qvo=new questionsVO();
				qvo.setOption(rs.getString(1));
				qvo.setUserId(rs.getString(2));
				qvo.setProductName(rs.getString(3));
				qvo.setComent(rs.getString(4));
				qvo.setRef_(rs.getInt(5));
				qvo.setLevel_(rs.getInt(6));
				qvo.setDate(rs.getString(7));
				qvo.setScore(rs.getFloat(8));
				vec.add(qvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return vec;
	}
	
	public int insertReview(String userId, String productName, String coment, float score){
		int result=-1;
		int ref=0;
		int level=1;
		String review="review";
		String refsql="select max(ref_) from questions";
		String sql="insert into questions values(?,?,?,?,?,?,sysdate,?)";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(refsql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ref=rs.getInt(1)+1;
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,review);
			pstmt.setString(2,userId);
			pstmt.setString(3,productName);
			pstmt.setString(4,coment);
			pstmt.setInt(5,ref);
			pstmt.setInt(6,level);
			pstmt.setFloat(7, score);
			
			result=pstmt.executeUpdate();
			
			sql="update shoesshop_product A set (A.score) = (select avg(b.score) from questions B where product_name=? and option_='review') where product_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, productName);
			pstmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public Vector<productVO> getProduct(String gender, String category, String brand, int startRow, int endRow){
		String sql="select * from(select A.*,Rownum Rnum from(select * from shoesShop_product where gender like ? and category like ? and brand like ? order by product_name asc)A)"+"where Rnum >= ? and Rnum <= ?";
		Vector<productVO> vec=new Vector<>();
		
		if(gender.equals("man")||gender.equals("woman")) {
			sql="select * from(select A.*,Rownum Rnum from(select * from shoesShop_product where gender in (?,'all') and category like ? and brand like ? order by product_name asc)A)"+"where Rnum >= ? and Rnum <= ?";
		}
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, category);
			pstmt.setString(3, brand);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				productVO pvo=new productVO();
				pvo.setGender(rs.getString(1));
				pvo.setBrand(rs.getString(2));
				pvo.setCategory(rs.getString(3));
				pvo.setProductName(rs.getString(4));
				pvo.setProductPicture(rs.getString(5));
				pvo.setPrice(rs.getInt(6));
				pvo.setProductInfo(rs.getString(7));
				pvo.setScore(rs.getFloat(8));
				vec.add(pvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return vec;
	}
	
	public int productCount(String gender, String category, String brand) {
		String sql="select count(*) from shoesshop_product where gender like ? and category like ? and brand like ?";
		int count=0;
		
		if(gender.equals("man")||gender.equals("woman")) {
			sql="select count(*) from shoesshop_product where gender in (?,'all') and category like ? and brand like ?";
		}
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,gender);
			pstmt.setString(2, category);
			pstmt.setString(3, brand);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return count;
	}
	
	public int myReviewCount(String userid) {
		String sql="select count(*) from questions where option_='review' and user_id=?";
		int count=0;
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public Vector<productVO> randomProduct(String category){
		String sql="select * from (select * from shoesshop_product where category=? order by dbms_random.value) where rownum<=8";
		Vector<productVO> vec=new Vector<>();
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,category);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				productVO pvo=new productVO();
				pvo.setGender(rs.getString(1));
				pvo.setBrand(rs.getString(2));
				pvo.setCategory(rs.getString(3));
				pvo.setProductName(rs.getString(4));
				pvo.setProductPicture(rs.getString(5));
				pvo.setPrice(rs.getInt(6));
				pvo.setProductInfo(rs.getString(7));
				pvo.setScore(rs.getFloat(8));
				vec.add(pvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		return vec;
	}
	
	public int insertProduct(productVO pvo) {
		int result=0;
		String sql="insert into shoesshop_product values(?,?,?,?,?,?,?,0)";
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pvo.getGender());
			pstmt.setString(2, pvo.getBrand());
			pstmt.setString(3, pvo.getCategory());
			pstmt.setString(4, pvo.getProductName());
			pstmt.setString(5, pvo.getProductPicture());
			pstmt.setInt(6, pvo.getPrice());
			pstmt.setString(7, pvo.getProductInfo());
			
			result=pstmt.executeUpdate();
			
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		return result;
	}
	
	public Vector<questionsVO> myReviews(int startRow, int endRow, String userid){
		String sql="select * from(select A.*,Rownum Rnum from(select * from questions where option_='review' and user_id=? order by ref_ desc,level_ asc)A)"+"where Rnum >= ? and Rnum <= ?";
		Vector<questionsVO> vec = new Vector<>();
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				questionsVO qvo=new questionsVO();
				qvo.setOption(rs.getString(1));
				qvo.setUserId(rs.getString(2));
				qvo.setProductName(rs.getString(3));
				qvo.setComent(rs.getString(4));
				qvo.setRef_(rs.getInt(5));
				qvo.setLevel_(rs.getInt(6));
				qvo.setDate(rs.getString(7));
				qvo.setScore(rs.getFloat(8));
				
				vec.add(qvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(rs, pstmt, conn);
		}
		
		return vec;
	}
	
	public int insertCart(Cart cvo) {
		int result=-1;
		String sql="insert into cart values(?,?,?,?)";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getUserID());
			pstmt.setString(2, cvo.getProduct_Name());
			pstmt.setInt(3,cvo.getQuantity());
			pstmt.setString(4, cvo.getShoessize());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
	
	public int insertBought(boughtVO bvo) {
		int result=-1;
		String sql="insert into bought values(?,?,?,?,?,?)";
		
		try {
			conn=DBManager.getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getUserId());
			pstmt.setString(2, bvo.getProductName());
			pstmt.setInt(3,bvo.getQuantity());
			pstmt.setString(4, bvo.getShoesSize());
			pstmt.setInt(5, bvo.getTotal());
			pstmt.setInt(6, 1);
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(pstmt, conn);
		}
		
		return result;
	}
	
}
