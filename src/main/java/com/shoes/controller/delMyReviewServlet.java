package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.shoesDAO;

/**
 * Servlet implementation class delMyReviewServlet
 */
@WebServlet("/delMyReview")
public class delMyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delMyReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		
		String userid=(String)session.getAttribute("user_id");
		String productName=request.getParameter("productName");
		String pageNum=request.getParameter("pageNum");
		int ref=Integer.parseInt(request.getParameter("ref"));
		
		System.out.println(userid+pageNum+ref);
		
		shoesDAO sdao=new shoesDAO();
		int result=sdao.delMyReview(ref,userid,productName);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>alert('삭제되었습니다.'); location.href='myPage.jsp?m2=reviewMana&pageNum="+pageNum+"';</script>");
			writer.close();
		}else {
			writer.println("<script>alert('삭제에 실패했습니다.'); history.back();</script>");
			writer.close();
		}
	}
}
