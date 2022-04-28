package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.CartDAO;

/**
 * Servlet implementation class cartalldelete
 */
@WebServlet("/cartalldelete")
public class cartalldelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartalldelete() {
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
        PrintWriter script=response.getWriter();
        HttpSession session=request.getSession();
        
        String userID=(String)session.getAttribute("user_id");
        
        CartDAO cart=new CartDAO();
        int result=cart.deleteall(userID);
        if(result >0) {
        	script.println("<script> alert('장바구니를 비웠습니다.'); location.href='myPage.jsp?m2=cart'</script>");
        }else {
        	script.println("<script> alert('장바구니 비우기를 실패했습니다.'); history.back()</script>");
        }
	}

}
