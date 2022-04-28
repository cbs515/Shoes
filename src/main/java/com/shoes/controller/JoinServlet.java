package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.MemberDAO;
import com.shoes.model.MemberVo;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("join.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String  user_name=request.getParameter("user_name");
		String  user_id=request.getParameter("user_id");
		String  user_pw=request.getParameter("user_pw");
		String  user_email=request.getParameter("user_email");
		String  user_phone=request.getParameter("user_phone");
		String  user_add=request.getParameter("user_add");
		String  user_number=request.getParameter("user_number");
		
		MemberVo mvo=new MemberVo();
		mvo.setUser_name(user_name);
		mvo.setUser_id(user_id);
		mvo.setUser_pw(user_pw);
		mvo.setUser_email(user_email);
		mvo.setUser_phone(user_phone);
		mvo.setUser_add(user_add);
		mvo.setUser_number(Integer.parseInt(user_number));
		
		MemberDAO mdao=new MemberDAO();
		int result=mdao.insertMember(mvo);
		
		PrintWriter writer=response.getWriter();
		HttpSession session=request.getSession();
		
		if(result == 1) {
			session.setAttribute("user_id",mvo.getUser_id());
			writer.println("<script>alert('회원가입에 성공했습니다.'); location.href='index.jsp';</script>");
		}else {
			writer.println("<script>alert('회원가입에 실패했습니다.'); history.back()</script>");
		}
	}

}
