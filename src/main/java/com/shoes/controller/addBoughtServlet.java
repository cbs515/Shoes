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
import com.shoes.model.boughtVO;

/**
 * Servlet implementation class productInfoServlet
 */
@WebServlet("/addBought")
public class addBoughtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBoughtServlet() {
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
		
		String userid=(String)session.getAttribute("user_id");
		String productName=request.getParameter("productName");
		String shoesSize=request.getParameter("shoesSize");
		int price=Integer.parseInt(request.getParameter("price"));
		int quantity=Integer.parseInt(request.getParameter("product-quantity"));
		int total=price*quantity;
		
		boughtVO bvo=new boughtVO();
		bvo.setUserId(userid);
		bvo.setProductName(productName);
		bvo.setShoesSize(shoesSize);
		bvo.setQuantity(quantity);
		bvo.setTotal(total);
		
		shoesDAO sdao=new shoesDAO();
		int result=sdao.insertBought(bvo);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>alert('구매되었습니다.'); location.href='shop-single.jsp?productName="+productName+"';</script>");
		}else {
			writer.println("<script>alert('구매에 실패했습니다.'); history.back();</script>");
		}
	}

}
