<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shoes.model.questionsVO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.shoes.model.productVO"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>ShoesHub - Product Detail Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/questions.css">
    <link rel="stylesheet" href="assets/css/shop-single.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
    
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
    <%@include file="/header.jsp"%>
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Open Content -->
<%
	String productName=request.getParameter("productName");
	shoesDAO dao=new shoesDAO();
	productVO vo=dao.getProductInfo(productName);
	request.setAttribute("vo", vo);
	DecimalFormat formatter=new DecimalFormat("###,###");
	String price=formatter.format(vo.getPrice());
	request.setAttribute("price", price);
	if(productName==null){
		out.println("<script>alert('유효하지 않은 상품입니다.'); location.href='shop.jsp';</script>");
	}
%>
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="${pageContext.request.contextPath}/assets/img/${vo.productPicture}" alt="Card image cap" id="product-detail">
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h1>${vo.productName}</h1>
                            <p class="h3 py-2">${price}원</p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Brand:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${vo.brand }</strong></p>
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>상품후기:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <span class="score_star">
						               		<i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i>
						                    <span class="score_starfull" style="width:${vo.score*20}%;">
						                    	<i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i>
						                    </span>
						            </span>
                                </li>
                            </ul>

                            <h6>설명:</h6>
                            <div>
                            	<p>${vo.productInfo }</p>
                            </div>
                            
                            <form action="" method="post">
                                <input type="hidden" name="productName" value="${vo.productName}">
                                <input type="hidden" name="price" value="${vo.price}">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">사이즈 :
                                            </li>
                                            <li class="list-inline-item">
                                            	<select name="shoesSize" required>
                                            		<option value="" >선택</option>
                                            		<option>225</option>
                                            		<option>230</option>
                                            		<option>240</option>
                                            		<option>245</option>
                                            		<option>250</option>
                                            		<option>255</option>
                                            		<option>260</option>
                                            		<option>265</option>
                                            		<option>270</option>
                                            		<option>275</option>
                                            		<option>280</option>
                                            		<option>285</option>
                                            		<option>290</option>
                                            		<option>295</option>
                                            		<option>300</option>
                                            	</select>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                            	수량
                                            </li>
                                            <li><input type="number" name="product-quantity" class="quantity" value="1"></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <input type="submit" class="btn btn-success btn-lg" value="구매" onclick="javascript: form.action='/addBought';">
                                    </div>
                                    <div class="col d-grid">
                                        <input type="submit" class="btn btn-success btn-lg" value="장바구니에 담기" onclick="javascript: form.action='/addCart';">
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->
	<section class="scroll_section">
		<div class="container">
			<div class="scroll_center">
				<a class="scroll_box" href="#rScroll" style="border-right:1px solid white">리뷰</a><a class="scroll_box" href="#qScroll" style="border-left:1px solid white">문의</a>
			</div>
		</div>
	</section>
    <!-- Start Article -->
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4>관련 상품</h4>
            </div>

            <!--Start Carousel Wrapper-->
            <div id="carousel-related-product">
			<%
			Vector<productVO> vec = dao.randomProduct(vo.getCategory());
			
			for(int i=0; i<vec.size(); i++){
				productVO pvo=vec.get(i);
				request.setAttribute("pvo", pvo);
                String randomPrice=formatter.format(pvo.getPrice());
                request.setAttribute("randomPrice",randomPrice);

                if(vo.getProductName().equals(pvo.getProductName()) == false){
			%>
				<div class="p-2 pb-3">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid" src="assets/img/${pvo.productPicture}">
                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                    <li>
                                    	<form action="insertJjim" method="post">
                                        		<input type="hidden" name="productName" value="${pvo.productName}">
                                        		<span style="position:relative;">
                                        			<a class="btn btn-success text-white" href="#" style="width:100%;"><i class="far fa-heart"></i></a>
                                        			<input class="jjim_Submit" type="submit" value="찜">
                                        		</span>
                                        </form>
                                    </li>
                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.jsp?productName=${pvo.productName}"><i class="far fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="text-center mb-0"><a href="shop-single.jsp?productName=${pvo.productName}" class="h3 text-decoration-none"><b>${pvo.brand}&nbsp;${pvo.productName}</b></a></p>
                            <p class="text-center mb-0"><strong>사이즈 :</strong>  225~300</p>
                            <ul class="list-unstyled d-flex justify-content-center mb-1">
                                <li>
                                    <span class="score_star">
						               		<i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i>
						                    <span class="score_starfull" style="width:${pvo.score*20}%;">
						                    	<i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i>
						                    </span>
						            </span>
                                </li>
                            </ul>
                            <p class="text-center mb-0">${randomPrice}원</p>
                        </div>
                    </div>
                </div>
			<%
                }
			}
			%>
            </div>


        </div>
    </section>
    <section>
    	<jsp:include page="reviews.jsp"/>
    </section>
    <section>
    	<jsp:include page="questions.jsp"/>
    </section>
    <!-- End Article -->
    <!-- Start Footer -->
    <%@include file="/footer.jsp"%>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/popupcontoller.js"></script>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/shop-single.js"></script>
    <!-- End Slider Script -->

</body>

</html>