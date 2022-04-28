<%@page import="com.shoes.model.Cart"%>
<%@page import="com.shoes.dao.CartDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="assets/css/cart.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->


<style type="text/css">

</style>
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

            <div class="col-lg-9">

				<div class="container">

					<div class="div1">
						<div style="width: 35%;">상품</div>
						<div style="width: 10%;">사이즈</div>
						<div style="width: 15%;">가격</div>
						<div style="width: 10%;">수량</div>
						<div style="width: 20%">합계</div>
						<div style="width: 10%">비고</div>
					</div>



					<%
						CartDAO cdao = new CartDAO();
						ArrayList<Cart> list = cdao.getcart(user_id);
						int num = 0;
						for (int i = 0; i < list.size(); i++) {
							Cart cart = list.get(i);
							DecimalFormat formatter = new DecimalFormat("###,###");
							String price = formatter.format(cart.getPrice());
					%>
					<form action="" method="post">
						<div class="div2">
							<div style="width: 15%; word-wrap: break-word;">
								<input type="hidden" name="pic"
									value="<%=cart.getProduct_Picture()%>"> <a
									href="shop-single.jsp?productName=<%=cart.getProduct_Name()%>"><img
									src="assets/img/<%=cart.getProduct_Picture()%>" width="100%"
									alt="" /></a>
							</div>
							<div style="width: 20%; word-wrap: break-word;">
								<input type="hidden" name="pn"
									value="<%=cart.getProduct_Name()%>"> <a
									href="shop-single.jsp?productName=<%=cart.getProduct_Name()%>"><%=cart.getProduct_Name()%></a>
							</div>
							<div style="width: 10%;">
								<input type="hidden" name="ss" value="<%=cart.getShoessize()%>">
								<%=cart.getShoessize()%>
							</div>
							<div style="width: 15%; word-wrap: break-word;">
								₩<%=price%></div>
							<div style="width: 10%;">
								<input class="input-number" type="number" name="qy"
									value="<%=cart.getQuantity()%>" onchange="test(<%=num++%>);"
									min="0" max="99">
							</div>
							<div style="width: 20%">
								<input type="hidden" name="pr" value="<%=cart.getPrice()%>">
								₩ <span class="sum"> <input type="hidden" name="prsum"
									value="<%=cart.getPrice() * cart.getQuantity()%>"> <%=cart.getPrice() * cart.getQuantity()%>
								</span>
							</div>
							<div style="width: 10%;">
								<input class="btn btn-success" type="submit" value="삭제"
									onclick="javascript: form.action='cartdelete?i=<%=i%>';">
							</div>

						</div>

						<%
							}
						%>

						<div
							style="width: 100%; display: flex; text-align: center; align-items: center; padding: 20px 0;">
							<div style="width: 20%;">
								<h4>합계</h4>
							</div>
							<div style="width: 20%;"></div>
							<div style="width: 20%;"></div>
							<div style="width: 20%;"></div>
							<div style="width: 20%;">
								<h4>
									₩<span id="sum"></span>
								</h4>
							</div>
						</div>
						<div>
							<div
								style="width: 100%; display: flex; text-align: center; align-items: center; padding: 20px 0;">
								<div style="width: 20%;">
									<input class="btn btn-success" type="submit" value="비우기"
										onclick="javascript: form.action='cartalldelete';">
								</div>
								<div style="width: 20%;"></div>
								<div style="width: 20%;"></div>
								<div style="width: 10%;"></div>
								<div style="width: 20%;"></div>
								<div style="width: 10%;">

									<input class="btn btn-success" type="submit" value="구매"
										onclick="javascript: form.action='/ShoesHub2/bought';">
								</div>
							</div>
						</div>
					</form>
				</div>

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
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <script type="text/javascript">
                      var price=document.getElementsByName("pr");
                      var quantity=document.getElementsByName("qy");
                      var sum=document.getElementsByClassName("sum");
                      var hsum=0;
                      
                      for(var j=0;j<price.length;j++){
                    	  hsum+=price[j].value*quantity[j].value;
                    	  
                      }
                      document.getElementById("sum").innerHTML=hsum;
                      
                       function test(num){
                    	 var sum2=0;
                    	 var snum = price[num].value*quantity[num].value;
                    	 sum[num].innerHTML=snum;
                    	 for(var i=0;i<price.length;i++ ){
                    		  sum2+=Number(sum[i].innerText);
                    	 }
                    	 document.getElementById("sum").innerHTML=sum2;
                      }
                      </script>
                      
    <!-- End Script -->
</body>

</html>