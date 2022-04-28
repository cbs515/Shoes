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
 * Servlet implementation class cartdelete
 */
@WebServlet("/cartdelete")
public class cartdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartdelete() {
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
        
        int i=Integer.parseInt(request.getParameter("i"));
        String userID=(String)session.getAttribute("user_id"); 
        String product_Name[]=request.getParameterValues("pn");
        String shoessize[]=request.getParameterValues("ss");
        
        
        CartDAO cart=new CartDAO();
		int result=cart.delete(userID,product_Name[i],shoessize[i]);
		if(result >0) {
			script.println("<script>alert('삭제되었습니다.');location.href='myPage.jsp?m2=cart'</script>");
		}else {
			script.println("<script>alert('삭제 실패했습니다.');history.back()</script>");
		}
		
	}
	

}
