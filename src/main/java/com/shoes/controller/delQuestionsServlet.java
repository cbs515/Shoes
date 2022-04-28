package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoes.dao.shoesDAO;

/**
 * Servlet implementation class delquestionServlet
 */
@WebServlet({"/delQuestion","/delReview"})
public class delQuestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delQuestionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String productName=request.getParameter("productName");
		String qPageNum=request.getParameter("qPageNum");
		String rPageNum=request.getParameter("rPageNum");
		
		int ref=Integer.parseInt(request.getParameter("ref"));
		shoesDAO sdao=new shoesDAO();
		int result=sdao.delQuestion(ref,productName);
		
		PrintWriter writer = response.getWriter();
		if(result!=1) {
			writer.println("<script>alert('삭제에 실패했습니다.'); history.back();</script>");
			writer.close();
		}else {
			writer.println("<script>alert('삭제되었습니다.'); location.href='shop-single.jsp?productName="+productName+"&rPageNum="+rPageNum+"&qPageNum="+qPageNum+"';</script>");
			writer.close();
		}
	}

}
