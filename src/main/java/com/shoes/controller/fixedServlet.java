package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.BoughtDAO;

/**
 * Servlet implementation class fixedServlet
 */
@WebServlet("/fixed")
public class fixedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fixedServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		PrintWriter writer=response.getWriter();
		
		int i=Integer.parseInt(request.getParameter("i"));
		String productName=request.getParameter("pix_productName");
		String shoesSize=request.getParameter("pix_shoesSize");
		String userid=(String)session.getAttribute("user_id");
		
		BoughtDAO bdao=new BoughtDAO();
		System.out.println(productName+shoesSize+userid);
		int result=bdao.updateFix(userid, productName, shoesSize);
		System.out.println(result);
		if(result==1) {
			writer.println("<script>alert('구매 확정되었습니다.'); location.href='myPage.jsp?m2=orderList';</script>");
		}else {
			writer.println("<script>alert('구매 확정 실패'); history.back(); </script>");
		}
	}

}
