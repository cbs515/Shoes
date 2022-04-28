package com.shoes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoes.dao.shoesDAO;
import com.shoes.model.productVO;

/**
 * Servlet implementation class addProductServlet
 */
@WebServlet("/addProduct")
public class addProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=response.getWriter();
		
		String savePath="assets/img";
		int uploadFileSizeLimit=5*1024*1024;
		String encType="UTF-8";
		ServletContext context=getServletContext();
		String uploadFilePath=context.getRealPath(savePath);
		
		try {
			MultipartRequest multi=new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			//업로드된 파일의 이름 얻기
			String fileName=multi.getFilesystemName("uploadImg");
			if(fileName == null) {
				System.out.println("파일이 업로드 되지 않았습니다.");
			}else {
				productVO pvo=new productVO();
				pvo.setProductName(multi.getParameter("productName"));
				pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
				pvo.setBrand(multi.getParameter("brand"));
				pvo.setCategory(multi.getParameter("category"));
				pvo.setGender(multi.getParameter("gender"));
				pvo.setProductInfo(multi.getParameter("productInfo"));
				pvo.setProductPicture(fileName);
				
				shoesDAO sdao=new shoesDAO();
				int result=sdao.insertProduct(pvo);
				
				if(result == 0) {
					writer.println("<script>alert('상품 등록에 실패했습니다.'); location.href='shop.jsp'</script>");
				}else {
					writer.println("<script>alert('상품이 등록되었습니다.'); location.href='shop.jsp'</script>");
				}
			}
		}catch(Exception e) {
			System.out.println("예외 발생 : "+e);
		}
	}

}
