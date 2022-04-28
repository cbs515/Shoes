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
		String userid="zxc123";
		request.setAttribute("userid", userid);
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
                <ul class="list-unstyled">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp" style="color:black;">
                             	내정보
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="index.html">
                            	주문목록
                        </a>
                        
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="index.html">
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
            <%
				String productName=request.getParameter("productName");
				shoesDAO sdao=new shoesDAO();
				productVO pvo=sdao.getProductInfo(productName);
				request.setAttribute("pvo", pvo);
			%>
            	<div class="row" style="padding:15px 0; border-bottom:1px solid #ddd;"><h2>리뷰 작성</h2></div>
            	<form action="addReview" method="post">
	            	<div style="width:100%;">
	                	<div style="width:100%; display:flex; border-bottom:1px solid #ddd;">
	                		<div style="width:29%">
	                			<img src="${pageContext.request.contextPath}/assets/img/${pvo.productPicture}"style="padding:20px 25px; width:100%;"> 
	                		</div>
	                		<div style="width:71%">
	                			<div style="height:40%"></div>
	                			<div style="height:10%;"><h5>${pvo.brand}&nbsp;${pvo.productName}</h5></div> 
	                			<div style="height:50%;">
	                				<div class="score">
										<span class="star">
										  <i class="text-muted fa fa-star"></i>
										  <i class="text-muted fa fa-star"></i>
										  <i class="text-muted fa fa-star"></i>
										  <i class="text-muted fa fa-star"></i>
										  <i class="text-muted fa fa-star"></i>
										  <span>
										  	<i class="text-warning fa fa-star"></i>
										  	<i class="text-warning fa fa-star"></i>
										  	<i class="text-warning fa fa-star"></i>
										  	<i class="text-warning fa fa-star"></i>
										  	<i class="text-warning fa fa-star"></i>
										  </span>
										  <input type="range" name="score" oninput="drawStar(this)" value="5" step="0.5" min="0" max="5">
										</span>
									</div>
	                			</div>
	                		</div>
	                	</div>
	                </div>
	                <div style="width:100%; display:flex; padding:20px 0 10px 0;">
	                	<div style="width:20%; text-align:center;">
	                		<h5>
	                			<span>아이디</span>
	                		</h5>
	                	</div>
	                	<div style="width:80%;">
	                		<h5>
	                			<span>${userid}</span>
	                		</h5>
	                	</div>
	                </div>
	                <div style="width:100%; display:flex; padding-bottom:20px;">
	                	<div style="width:20%; text-align:center;">
	                		<h5>
	                			<span>상세리뷰</span>
	                		</h5>
	                	</div>
	                	<div style="width:80%;">
	                		<textarea rows="6" style="width:90%;" name="coment"></textarea>
	                	</div>
	                </div>
	                <div style="width:100%; text-align:center;">
	                	<input type="hidden" name="productName" value="${pvo.productName}">
	                	<input type="hidden" name="userid" value="${userid}">
	                	<input type="submit" value="완료" class="insertReview_button">
	                	<input type="reset" value="다시작성" class="insertReview_button">
	                </div>
	           	</form>
           	</div>

        </div>
    </div>

    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">ShoesHub</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            64, Sanggye-ro, Nowon-gu, Seoul, Republic of Korea
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:02-1234-5678">02-1234-5678</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:ShoesHub@company.com">ShoesHub@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="shop.html">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">kids Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">Brand</a></li>

                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="about.html">About Us</a></li>
                        <li><a class="text-decoration-none" href="about.html">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="about.html">FAQs</a></li>
                        <li><a class="text-decoration-none" href="about.html">Contact</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">

                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 ShoesHub
                            | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script type="text/javascript">
	function drawStar(target){
		var size=target.value*20;
	  	document.querySelector(`.star span`).style.width = size+"%";
		}
	</script>
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>