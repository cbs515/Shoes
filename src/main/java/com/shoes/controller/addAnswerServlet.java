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
 * Servlet implementation class addAnswerServlet
 */
@WebServlet("/addAnswer")
public class addAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAnswerServlet() {
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
		HttpSession session=request.getSession();
		
		String userId=(String)session.getAttribute("user_id");
		String productName=request.getParameter("productName");
		String coment=request.getParameter("coment");
		int ref_=Integer.parseInt(request.getParameter("ref"));
		
		shoesDAO sdao=new shoesDAO();
		int result=sdao.insertAnswer(userId, productName, coment, ref_);
		
		PrintWriter writer = response.getWriter();
		if(result!=1) {
			writer.println("<script>alert('작성에 실패했습니다.'); history.back();</script>");
			writer.close();
		}else {
			writer.println("<script>alert('작성 완료'); window.close();</script>");
			writer.close();
		}
	}

}
