<%@page import="com.shoes.model.questionsVO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qPageNum=request.getParameter("qPageNum");
	if(qPageNum == null){
		qPageNum="1";
	}
	request.setAttribute("qPageNum",qPageNum);
	int rPageSize=10;
	int qPageSize=10;
	
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
%>
<div class="review_box" id="rScroll">
	<div class="container" style="border:1px solid #dddddd;; padding-top:20px; margin-bottom:100px; border-radius:5px;">
		<div class="review_top">
			<h2 class="fontative">리뷰</h2>
		</div>
		<%if(vec.size()==0){%>
		<div class="coment_none">
			<h4 style="color:#ddd;">아직 등록된 리뷰가 없습니다.</h4>
		</div>
		<%} %>
		<br>
		<div class="review_contents">
			<div class="review_list">
				<%
					for(int i=0; i<vec.size(); i++){
						questionsVO vo=vec.get(i);
						request.setAttribute("vo", vo);
				%>
				<div class="reviews">
					<em class="add_box">리뷰</em>
						<strong class="review_id">
						${vo.userId}</strong><span class="review_date">${vo.date} </span>
						<br>
						<span class="rating_star">
		               		<i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i>
		                    <span class="rating_starfull" style="width:${vo.score*20}%;">
		                    	<i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i>
		                    </span>
		                </span>
						<div class="review_contents">${vo.coment}
						</div>
						<div class="func_buttons">
				<%
						String getUserId=(String)session.getAttribute("user_id");
						int userType=sdao.getUserType(getUserId);
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
					if(rCount > 10){
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
						<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=<%=rStartPage-10%>&qPageNum=${qPageNum}#rScroll">이전</a>
				<%
						}
						for(int i=rStartPage; i<=rEndPage; i++)
						if(Integer.parseInt(rPageNum) == i){
				%>
							<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=<%=i%>&qPageNum=${qPageNum}#rScroll"><%=i%></a>
				<%
						}
						if(rEndPage < rPageCount){
				%>
							<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=<%=rStartPage+10%>&qPageNum=${qPageNum}#rScroll">다음</a>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
</div>