package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.ReplyDAO;


/**
 * Servlet implementation class replyupdate
 */
@WebServlet("/replyupdate")
public class replyupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyupdate() {
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
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		PrintWriter script= response.getWriter();
		
		int bbsID=Integer.parseInt(request.getParameter("bbsID"));
		int replyID=Integer.parseInt(request.getParameter("replyID"));
		String replyContent=request.getParameter("replyContent");
		
		ReplyDAO reply=new ReplyDAO();
		int result = reply.update(replyID,replyContent);
		if(result == -1) {
			script.println("<script>");
			script.println("alert('글 수정에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			script.println("<script>");
			script.println("alert('글 수정에 성공했습니다.')");
			script.println("location.href='view.jsp?bbsID="+bbsID+"'");
			script.println("</script>");
		}
		
	}

}
