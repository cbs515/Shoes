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
import com.shoes.model.Cart;

/**
 * Servlet implementation class addCartServlet
 */
@WebServlet("/addCart")
public class addCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCartServlet() {
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
		doGet(request, response);
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		
		String userid=(String)session.getAttribute("user_id");
		String productName=request.getParameter("productName");
		String shoesSize=request.getParameter("shoesSize");
		int quantity=Integer.parseInt(request.getParameter("product-quantity"));
		
		Cart cvo=new Cart();
		cvo.setUserID(userid);
		cvo.setProduct_Name(productName);
		cvo.setShoessize(shoesSize);
		cvo.setQuantity(quantity);
		
		shoesDAO sdao=new shoesDAO();
		int result=sdao.insertCart(cvo);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>alert('장바구니에 추가되었습니다.'); location.href='shop-single.jsp?productName="+productName+"';</script>");
		}else {
			writer.println("<script>alert('장바구니 등록에 실패했습니다.'); history.back();</script>");
		}
	}

}
