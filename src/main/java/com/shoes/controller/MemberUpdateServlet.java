package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoes.dao.MemberDAO;
import com.shoes.model.MemberVo;


/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String user_id=request.getParameter("user_id");
		String user_pw=request.getParameter("user_pw");
		String user_email=request.getParameter("user_email");
		String user_phone=request.getParameter("user_phone");
		String user_add=request.getParameter("user_add");
		String user_name=request.getParameter("user_name");
		
		MemberVo mvo=new MemberVo();
		mvo.setUser_id(user_id);
		mvo.setUser_pw(user_pw);
		mvo.setUser_email(user_email);
		mvo.setUser_phone(user_phone);
		mvo.setUser_add(user_add);
		mvo.setUser_name(user_name);
		
		MemberDAO mdao=new MemberDAO();
		int result = mdao.updateMember(mvo);		
		/* response.sendRedirect("login.do"); */
		
		
		PrintWriter writer = response.getWriter();
		
		if(result == 1) {
			writer.println("<script>alert('회원정보가 수정되었습니다.'); location.href = 'myPage.jsp?m2=myinfo';</script>");
		} else {
			writer.println("<script>alert('정보 수정에 실패했습니다.'); history.back();</script>");
		}
	}

}
