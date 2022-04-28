package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.dao.BoughtDAO;
import com.shoes.dao.CartDAO;
import com.shoes.model.Bought;

/**
 * Servlet implementation class bought
 */
@WebServlet("/bought")
public class bought extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bought() {
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
        String quantity[]=request.getParameterValues("qy");
        String product_Name[]=request.getParameterValues("pn");
        String price[]=request.getParameterValues("pr");
        String shoessize[]=request.getParameterValues("ss");
        String product_Picutre[]=request.getParameterValues("pic");
        int result=0;
        for(int i=0;i<price.length;i++){
        	Bought bo=new Bought();
        	BoughtDAO bo2=new BoughtDAO();
        	int iprice=Integer.parseInt(price[i]);
        	int iquantity=Integer.parseInt(quantity[i]);
        	int total=iprice*iquantity;
        	bo.setUserID(userID);
        	bo.setProduct_Name(product_Name[i]);
        	bo.setPrice(iprice);
        	bo.setQuantity(iquantity);
        	bo.setTotal(total);
        	bo.setShoessize(shoessize[i]);
        	bo.setProduct_Picture(product_Picutre[i]);
        	result=bo2.insertBought(bo);
        }
        if(result>0) {
        	CartDAO cart=new CartDAO();
            cart.deleteall(userID);
        	script.println("<script>");
			script.println("alert('구매되었습니다.')");
			script.println("location.href='myPage.jsp?m2=orderList'");
			script.println("</script>");
        }else {
        	script.println("<script>");
			script.println("alert('구매 실패!')");
			script.println("history.back()");
			script.println("</script>");
        }
        

	}

}
