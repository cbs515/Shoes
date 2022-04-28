<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shoes.model.productVO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ShoesHub - Product Listing Page</title>
    <meta charset="utf-8">	
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/shop.css">
    <link rel="stylesheet" href="assets/css/add-product.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
<%
	String userid=(String)session.getAttribute("user_id");
	shoesDAO sdao=new shoesDAO();
	int userNumber=sdao.getUserType(userid);
	if(userNumber != 0){
		response.sendRedirect("shop.jsp");
	}
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
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-3">
                <h1 class="h2 pb-4">상품</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <div class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="shop.jsp">
							전체
                        </a>
                    </div>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
						브랜드
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="shop.jsp?brand=나이키">나이키</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?brand=닥터마틴">닥터마틴</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?brand=반스">반스</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?brand=아디다스">아디다스</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?brand=컨버스">컨버스</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
						카테고리
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="shop.jsp?category=구두">구두</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?category=로퍼">로퍼</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?category=슬리퍼">슬리퍼</a></li>
                            <li><a class="text-decoration-none" href="shop.jsp?category=운동화">운동화</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
            	<form action="addProduct" method="post" enctype="multipart/form-data">
	             	<div class="comp">
	             		<div class="comp_name">
	             			<span class="title">상품명</span>
	             		</div>
	             		<div class="comp_value">
	             			<input type="text" name="productName" style="width:100%" required>
	             		</div>
	             	</div>
	             	<div class="comp">
	             		<div class="comp_name">
	             			<span class="title">브랜드명</span>
	             		</div>
	             		<div style="width:30%;">
	             			<input type="text" name="brand" style="width:100%" required>
	             		</div>
	             		<div class="comp_name">
	             			<span class="title">가격</span>
	             		</div>
	             		<div style="width:30%;">
	             			<input type="number" name="price" style="width:100%" required>
	             		</div>
	             	</div>
	             	<div class="comp">
	             		<div class="comp_name">
	             			<span class="title">성별</span>
	             		</div>
	           			<div class="gender_box">
	           				<div class="gender_value"><input type="radio" name="gender" value="all" required> 전체</div>
	           				<div class="gender_value"><input type="radio" name="gender" value="man"> 남성</div>
	           				<div class="gender_value"><input type="radio" name="gender" value="woman"> 여성</div>
	           			</div>
	           			<div class="comp_name">
	             			<span class="title">카테고리</span>
	             		</div>
	             		<div style="width:30%;">
	             			<select name="category" style="width:100%;" required>
	             				<option value="" selected="selected">카테고리를 선택하세요</option>
	             				<option value="">======================</option>
	             				<option value="운동화">운동화</option>
	             				<option value="구두">구두</option>
	             				<option value="슬리퍼">슬리퍼</option>
	             				<option value="로퍼">로퍼</option>
	             			</select>
	             		</div>
	             	</div>
	             	<div class="comp">
	             		<div class="comp_name">
	             			<span class="title">설명</span>
	             		</div>
	             		<div class="comp_value">
	             			<textarea name="productInfo" rows="8" style="width:100%;" required></textarea>
	             		</div>
	             	</div>
	             	<div class="comp">
	             		<div class="comp_name">
	             			<span class="title">제품사진</span>
	             		</div>
	             		<div class="comp_value">
	             			<input type="file" name="uploadImg" style="width:100%;" required>
	             		</div>
	             	</div>
	             	<div style="text-align:right; margin-top:20px; width:93%;">
	             		<input type="submit" value="완료" class="product_button">&nbsp;<input type="button" value="취소" class="product_button">
	             	</div>
             	</form>
			</div>
        </div>
    </div>
    <!-- End Content -->

    <!-- Start Brands -->
    <section class="bg-light py-5">
        <div class="container my-4">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Our Brands</h1>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        Lorem ipsum dolor sit amet.
                    </p>
                </div>
                <div class="col-lg-9 m-auto tempaltemo-carousel">
                    <div class="row d-flex flex-row">
                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-light fas fa-chevron-left"></i>
                            </a>
                        </div>
                        <!--End Controls-->

                        <!--Carousel Wrapper-->
                        <div class="col">
                            <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel">
                                <!--Slides-->
                                <div class="carousel-inner product-links-wap" role="listbox">

                                    <!--First slide-->
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End First slide-->

                                    <!--Second slide-->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Second slide-->

                                    <!--Third slide-->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Third slide-->

                                </div>
                                <!--End Slides-->
                            </div>
                        </div>
                        <!--End Carousel Wrapper-->

                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-light fas fa-chevron-right"></i>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--End Brands-->

    <%@include file="/footer.jsp"%>

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>