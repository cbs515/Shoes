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
<%
	String gender=request.getParameter("gender");
	String category=request.getParameter("category");
	String brand=request.getParameter("brand");
	
	if(gender==null) {
		gender="%";
	}
	if(brand==null) {
		brand="%";
	}
	if(category==null) {
		category="%";
	}
%>
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
            	<div class="row">
            		<h2>
            			<%
            				int check=0;
            				if(category.equals("%") && brand.equals("%")){
            					check=1;
            			%>
            				전체
            			<%
            				}
            				if(category.equals("%") == false){
            					check=1;
            			%>
            			<%=category%>
            			<%
            				}if(brand.equals("%") == false){
            					check=1;
            			%>
            			<%=brand%>
            			<%
            				}if(gender.equals("%") == false){
            					String sex=null;
            					if(gender.equals("man")){
            						sex="남성";
            					}if(gender.equals("woman")){
            						sex="여성";
            					}
            					if(check==1){
            			%>
            			>&nbsp;<%=sex%>
            			<%
            					}else{
            			%>
            			<%=sex%>
            			<%
            					}
            				}
            			%>
            		</h2>
            	</div>
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="shop.jsp?brand=<%=brand%>&category=<%=category%>">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="shop.jsp?gender=man&brand=<%=brand%>&category=<%=category%>">남성</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="shop.jsp?gender=woman&brand=<%=brand%>&category=<%=category%>">여성</a>
                            </li>
                        </ul>
                    </div>
                <%	
                	shoesDAO sdao=new shoesDAO();
                	int usertype=sdao.getUserType(user_id);
                	if(usertype==0){
                %>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex" style="justify-content:flex-end;">
                            <a href="add-product.jsp" class="add_product">상품등록</a>
                        </div>
                    </div>
                <%
                	}
                %>
                </div>
                <div class="row">
             	<%
				int pageSize=6;
				
				String pageNum=request.getParameter("pageNum");
				if(pageNum==null){
					pageNum="1";
				}
				
				int count=0;
				int currentPage=Integer.parseInt(pageNum);
				count=sdao.productCount(gender, category, brand);
				
				int startRow=(currentPage-1)*pageSize+1;
				int endRow=currentPage*pageSize;
				Vector<productVO> vec=sdao.getProduct(gender, category, brand, startRow, endRow);
				
				for(int i=0; i<vec.size(); i++){
					productVO pvo=vec.get(i);
					request.setAttribute("pvo", pvo);
					DecimalFormat formatter=new DecimalFormat("###,###");
	                String price=formatter.format(pvo.getPrice());
	                request.setAttribute("price",price);
				%>
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/assets/img/${pvo.productPicture}">
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
                            	<p class="text-center mb-0"><a href="shop-single.jsp?productName=${pvo.productName}" class="h3 text-decoration-none"><b>${pvo.brand}</b></a></p>
                                <p class="text-center mb-0"><a href="shop-single.jsp?productName=${pvo.productName}" class="h3 text-decoration-none"><b>${pvo.productName}</b></a></p>
                                <p class="text-center mb-0" style="margin-bottom:10px;"><strong>사이즈 :</strong>  225~300</p>
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
                                <p class="text-center mb-0">${price}원</p>
                            </div>
                        </div>
                    </div>
<%
				}
%>				</div>
                <div class="row">
                    <ul class="pagination pagination-lg justify-content-end">
				<%
					if(count > 0){
						int pageCount=count/pageSize+(count%pageSize == 0? 0:1);
						
						int startPage=1;
						if(currentPage%5 != 0){
							startPage=((int)(currentPage/5))*5+1;
						}else{
							startPage=((int)(currentPage/5)-1)*5+1;
						}
						
						int pageBlock=5;
						int endPage=startPage+pageBlock-1;
						
						if(endPage > pageCount)
							endPage=pageCount;
						
						if(startPage > 5){
				%>
						<li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="shop.jsp?gender=<%=gender%>&category=<%=category%>&brand=<%=brand%>&pageNum=<%=startPage-5%>">이전</a>
                        </li>
				<%
						}
						for(int i=startPage; i<=endPage; i++)
						if(Integer.parseInt(pageNum) == i){
				%>
						<li class="page-item disabled">
                           <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1"><%=i%></a>
                        </li>
				<%
							}else{
				%>
						<li class="page-item">
                           <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="shop.jsp?gender=<%=gender%>&category=<%=category%>&brand=<%=brand%>&pageNum=<%=i%>"><%=i%></a>
                        </li>
				<%
						}
						if(endPage < pageCount){
				%>
						<li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="shop.jsp?gender=<%=gender%>&category=<%=category%>&brand=<%=brand%>&pageNum=<%=startPage+5%>">다음</a>
                        </li>
				<%
						}
					}
				%>
                    </ul>
                </div>
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