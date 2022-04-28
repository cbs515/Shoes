<%@page import="com.shoes.dao.shoesDAO"%>
<%@page import="com.shoes.model.questionsVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/questions.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String qPageNum=request.getParameter("qPageNum");
	if(qPageNum == null){
		qPageNum="1";
	}
	request.setAttribute("qPageNum",qPageNum);
	int rPageSize=10;
	
	String rPageNum=request.getParameter("rPageNum");
	if(rPageNum == null){
		rPageNum="1";
	}
	request.setAttribute("rPageNum",rPageNum);
	
	int rCount=0;
	int rNumber=0;
	int rCurrentPage=Integer.parseInt(rPageNum);
	
	String productName=request.getParameter("productName");
	request.setAttribute("productName",productName);
	shoesDAO sdao=new shoesDAO();
	rCount=sdao.getReviewCount(productName);
	
	int startRow=(rCurrentPage-1)*rPageSize+1;
	int endRow=rCurrentPage*rPageSize;
	
	Vector<questionsVO> vec=sdao.getProductReviews(startRow, endRow, productName);
	rNumber=rCount-(rCurrentPage-1)*rPageSize;
%>
<div class="review_box">
	<div class="review">
		<div class="review_top">
			<h2>리뷰</h2>
		</div>
		<div class="review_contents">
			<div class="review_list">
				<%
					for(int i=0; i<vec.size(); i++){
						questionsVO vo=vec.get(i);
						request.setAttribute("vo", vo);
				%>
				<div class="reviews">
					<em class="add_box">리뷰</em>
						<strong class="review_id">${vo.userId}</strong><span class="review_date">${vo.date} </span>
						<div class="review_contents">${vo.coment}1231231313123232
						</div>
						<div class="func_buttons">
				<%
					String getUserId=(String)session.getAttribute("user_id");
						int userType=sdao.getUserType(getUserId);
						System.out.println(getUserId);
						if(userType==0 || vo.getUserId().equals(getUserId)){
				%>
							<form action="delReview" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?')">
								<input type="hidden" name="productName" value="${productName}">
								<input type="hidden" name="ref" value="${vo.ref_}">
								<input type="hidden" name="qPageNum" value="${qPageNum}">
								<input type="hidden" name="rPageNum" value="${rPageNum}">
								<input type="submit" value="삭제" class="del_button">
							</form>
				<%
						}
				%>
						</div>
				<%
						if(i!=vec.size()-1){
				%>
						<hr class="line_div">
				<%
						}
				%>
				</div>
				<%
					}
				%>
			</div>
			<div class="review_paging">
				<%
					if(rCount > 0){
						int rPageCount=rCount/rPageSize+(rCount%rPageSize == 0? 0:1);
						
						int rStartPage=1;
						if(rCurrentPage%10 != 0){
							rStartPage=((int)(rCurrentPage/10))*10+1;
						}else{
							rStartPage=((int)(rCurrentPage/10)-1)*10+1;
						}
						
						int rPageBlock=10;
						int rEndPage=rStartPage+rPageBlock-1;
						
						if(rEndPage > rPageCount)
							rEndPage=rPageCount;
						
						if(rStartPage > 10){
				%>
						<a class="pazing_style" href="review.jsp?productName=${productName}&rPageNum=<%=rStartPage-10%>&qPageNum=${qPageNum}">이전</a>
				<%
						}
						for(int i=rStartPage; i<=rEndPage; i++)
						if(Integer.parseInt(rPageNum) == i){
				%>
							<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="review.jsp?productName=${productName}&rPageNum=<%=i%>&qPageNum=${qPageNum}"><%=i%></a>
				<%
						}
						if(rEndPage < rPageCount){
				%>
							<a class="pazing_style" href="review.jsp?productName=${productName}&rPageNum=<%=rStartPage+10%>&qPageNum=${qPageNum}">다음</a>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
</div>
</body>
</html>