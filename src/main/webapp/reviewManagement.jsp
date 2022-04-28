<%@page import="java.util.Vector"%>
<%@page import="com.shoes.model.questionsVO"%>
<%@page import="com.shoes.model.productVO"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ShoesHub - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" >

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/questions.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
<style type="text/css">
	.star {
	  position: relative;
	  font-size: 1.5rem;
	  color: #ddd;
	}
	
	.star input {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  left: 0;
	  opacity: 0;
	  cursor: pointer;
	}
	
	.star span {
	  width: 100%;
	  position: absolute; 
	  left: 0;
	  color: red;
	  overflow: hidden;
	  pointer-events: none;
	}
	.score{
	  white-space: nowrap;
	}
	.insertReview_button{
		background-color:#59ab6e;
		color:#fcfcfc;
		width:5em;
		border-radius: 4px;
		border:none;
	}
	.insertReview_button:hover{
		color:#fcfcfc;
		background-color:#49915b;
	}
</style>
</head>

<body>
	<%
	String pageNum=request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	request.setAttribute("pageNum",pageNum);
	int pageSize=10;
	
	int count=0;
	int number=0;
	int currentPage=Integer.parseInt(pageNum);
	
	String userid=(String)session.getAttribute("user_id");
	shoesDAO sdao=new shoesDAO();
	count=sdao.myReviewCount(userid);
	
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	
	Vector<questionsVO> vec=sdao.myReviews(startRow, endRow, userid);
	%>
<%@include file="/header.jsp"%>

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="2글자이상 입력하세요">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">MyPage</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp">
                             	내정보
                        </a>
                        
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            	주문목록
                        </a>
                        
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            	리뷰관리
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            	장바구니
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            	찜리스트
                        </a>
                    </li>
                </ul>
            </div>
			
            <div class="col-lg-9" style="border-top:1.5px solid black;">
            	<div class="row" style="padding:15px 0; border-bottom:1px solid #ddd; margin-bottom:20px;"><h2>내가 작성한 리뷰</h2></div>
	            <%
				for(int i=0; i<vec.size(); i++){
					questionsVO vo=vec.get(i);
					request.setAttribute("vo", vo);
					String productName=vo.getProductName();
					productVO pvo=sdao.getProductInfo(productName);
					String picture=pvo.getProductPicture();
					request.setAttribute("pvo", pvo);
					request.setAttribute("picture", picture);
				%>
            	<div class="reviews">
					<em class="add_box">리뷰</em>
						<strong class="review_id">
						${vo.userId}</strong><span class="review_date">${vo.date} </span>
						<br>
						<span class="rating_star" style="margin:28px;">
		               		<i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i>
		                    <span class="rating_starfull" style="width:${vo.score*20}%;">
		                    	<i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i>
		                    </span>
		                </span>
		                <div style="width:100%; display:flex;">
							<div style="width:20%;">
								<a href="shop-single.jsp?productName=${vo.productName}">
									<img src="${pageContext.request.contextPath}/assets/img/${picture}"style=" width:100%;">
								</a>
							</div>
							<div style="width:80%; display:flex; flex-direction: column">
								<div style="width:100%;">
									<a href="shop-single.jsp?productName=${vo.productName}" style="text-decoration:none; color:black;"><b>${pvo.brand}&nbsp;${vo.productName}</b></a><br>
									${vo.coment}
								</div>
								<div style="width:100%; margin-top:auto;">
									<div class="func_buttons">
									<%
										String getuserid=(String)session.getAttribute("userid");
										int userType=sdao.getUserType(getuserid);
										Object getUserid=session.getAttribute("userid");
										if(userType==0 || vo.getUserId().equals((String)getUserid)){
									%>
										<form action="delMyReview" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?')">
											<input type="hidden" name="userid" value="${userid}">
											<input type="hidden" name="ref" value="${vo.ref_}">
											<input type="hidden" name="pageNum" value="${pageNum}">
											<input type="submit" value="삭제" class="del_button">
										</form>
									<%
										}
									%>
									</div>
								</div>
							</div>
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
				<div class="review_paging">
				<%
					if(count > 10){
						int pageCount=count/pageSize+(count%pageSize == 0? 0:1);
						
						int startPage=1;
						if(currentPage%10 != 0){
							startPage=((int)(currentPage/10))*10+1;
						}else{
							startPage=((int)(currentPage/10)-1)*10+1;
						}
						
						int pageBlock=10;
						int endPage=startPage+pageBlock-1;
						
						if(endPage > pageCount)
							endPage=pageCount;
						
						if(startPage > 10){
				%>
						<a class="pazing_style" href="reviewManagement?pageNum=<%=startPage-10%>">이전</a>
				<%
						}
						for(int i=startPage; i<=endPage; i++)
							if(Integer.parseInt(pageNum) == i){
				%>
							<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="reviewManagement.jsp?pageNum=<%=i%>"><%=i%></a>
				<%
						}
						if(endPage < pageCount){
				%>
							<a class="pazing_style" href="reviewManagement.jsp?pageNum=<%=startPage+10%>">다음</a>
				<%
						}
					}
				%>
				</div>
				</div>
           	</div>

        </div>

    <!-- Start Footer -->
    <%@include file="/footer.jsp"%>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>