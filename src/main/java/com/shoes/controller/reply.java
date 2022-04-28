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
import com.shoes.model.Reply;

/**
 * Servlet implementation class reply
 */
@WebServlet("/reply")
public class reply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reply() {
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
		PrintWriter script=response.getWriter();
		ReplyDAO replyDAO=new ReplyDAO();
		Reply reply=new Reply();
		
		int next=replyDAO.getNext();
		String replyContent=request.getParameter("replyContent");
		String userID=request.getParameter("userID");
		
		reply.setReplyContent(replyContent);
		
		int bbsID=1;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
	
		//String userID=null;
		if(session.getAttribute("user_id")!=null){
			userID=(String)session.getAttribute("user_id");
		}
		if(session.getAttribute("user_id") == null){
			
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}else{
			int result = replyDAO.write(next,bbsID, reply.getReplyContent(), userID);
			if(result==-1){
				
				script.println("<script>");
				script.println("alert('댓글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				String url="view.jsp?bbsID="+bbsID;
				
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");
			}
		}
	}
}

