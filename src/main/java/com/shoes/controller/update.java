package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.BbsDAO;
import com.shoes.model.Bbs;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
		String bbsTitle=request.getParameter("bbsTitle");
		String bbsContent=request.getParameter("bbsContent");
		
		

		
		String userID=null;
		if(session.getAttribute("user_id")!= null){
			userID=(String) session.getAttribute("user_id");
		}
		if(session.getAttribute("user_id")== null){
			
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		if(bbsID == 0){
			
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}else{
		if(bbsTitle.equals("") || bbsContent.equals("")){
			
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.update(bbsID,bbsTitle,bbsContent);
			if(result == -1){
				
				script.println("<script>");
				script.println("alert('글 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				
				script.println("<script>");
				script.println("alert('글 수정에 성공했습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
	}

}
	}
}
