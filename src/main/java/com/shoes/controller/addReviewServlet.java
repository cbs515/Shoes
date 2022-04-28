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
 * Servlet implementation class addReviewServlet
 */
@WebServlet("/addReview")
public class addReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReviewServlet() {
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
		PrintWriter writer=response.getWriter();
		HttpSession session=request.getSession();
		
		String productName=request.getParameter("productName");
		String userid=(String)session.getAttribute("user_id");
		String coment=request.getParameter("coment");
		float score=Float.parseFloat(request.getParameter("score"));
		
		shoesDAO sdao=new shoesDAO();
		int result=sdao.insertReview(userid, productName, coment, score);
		
		if(result>0) {
			writer.println("<script>alert('작성 완료'); location.href='myPage.jsp?m2=reviewMana';</script>");
		}else {
			writer.println("<script>alert('작성에 실패했습니다.'); history.back();</script>");
		}
	}

}
