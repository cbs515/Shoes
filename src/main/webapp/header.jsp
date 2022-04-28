<%@page import="com.shoes.dao.JjimDAO"%>
<%@page import="com.shoes.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:ShoesHub@company.com">ShoesHub@company.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:02-1234-5678">02-1234-5678</a>
                </div>
                <div>
				<% String user_id = (String)session.getAttribute("user_id");
                
                
                if(user_id == null){
				%>
					<a class="navbar-sm-brand text-light text-decoration-none" href="login.jsp">로그인</a>&nbsp;&nbsp;&nbsp;
				<%
				}
				else{
				%>
					 <a class="navbar-sm-brand text-light text-decoration-none" href="logout.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
				<%
					}
				%>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="about.jsp">고객센터</a>&nbsp;&nbsp;&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href="about.jsp">회사소개</a>

                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
                ShoesHub
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex flex-row justify-content-around" style="margin:0 50px;">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.jsp">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="board.jsp">Board</a>
                        </li>

                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="2글자이상 입력하세요">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <!--마이페이지-->
                    <%
	                    CartDAO cartdao=new CartDAO();
	                	int cartCount=cartdao.myCartCount(user_id);
	                	JjimDAO jjimdao=new JjimDAO();
	                	int jjimCount=jjimdao.myJjimCount(user_id);
                    %>
                    <a class="nav-icon position-relative text-decoration-none" href="myPage.jsp?m2=myinfo">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="myPage.jsp?m2=cart">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><%=cartCount%></span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="myPage.jsp?m2=jjim">
                        <i class="fa fa-fw fa-heart text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+<%=jjimCount%></span>
                    </a>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    
    
   