package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.JjimDAO;


/**
 * Servlet implementation class jjimdelete
 */
@WebServlet("/jjimdelete")
public class jjimdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jjimdelete() {
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
        String product_Name[]=request.getParameterValues("jn");
        
        JjimDAO jjim=new JjimDAO();
        int result=jjim.delete(userID,product_Name[i]);
        if(result>0) {
        	script.println("<script>alert('찜리스트에서 제거되었습니다.');location.href='myPage.jsp?m2=jjim'</script>");
        }else {
        	script.println("<script>alert('실패');history.back()</script>");
        }
        
	}

}
