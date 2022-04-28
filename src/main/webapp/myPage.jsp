<%@page import="com.shoes.model.Jjim"%>
<%@page import="com.shoes.dao.JjimDAO"%>
<%@page import="com.shoes.model.boughtVO"%>
<%@page import="com.shoes.dao.BoughtDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shoes.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoes.dao.CartDAO"%>
<%@page import="com.shoes.model.productVO"%>
<%@page import="com.shoes.model.questionsVO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@page import="com.shoes.model.MemberVo"%>
<%@page import="com.shoes.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ShoesHub - Product Listing Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet" href="assets/css/myPage.css">
<link rel="stylesheet" href="assets/css/myInfo.css">
<link rel="stylesheet" href="assets/css/joinModal.css">
<link rel="stylesheet" href="assets/css/questions.css">
<link rel="stylesheet" href="assets/css/reviewManager.css">
<link rel="stylesheet" href="assets/css/cart.css">
<link rel="stylesheet" href="assets/css/buy.css">
<link rel="stylesheet" href="assets/css/jjim.css">
<link rel="stylesheet" href="assets/css/insertReview.css">

<!-- Load fonts style after rendering the layout styles -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">



<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>

	<div class="m-blur" id="m-blur"></div>


	<%@include file="/header.jsp"%>

	<%

	
	
	if(user_id == null){

%>
	<script>alert("로그인을 해주세요.");
		location.href='login.jsp';
	</script>

	<%
	}
%>

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="2글자이상 입력하세요">
					<button type="submit"
						class="input-group-text bg-success text-light">
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
				<h1 class="h2 pb-4">MyPage</h1>
				<ul class="list-unstyled">
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp?m2=myinfo"> 내정보 </a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp?m2=orderList"> 주문목록 </a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp?m2=reviewMana"> 리뷰관리 </a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp?m2=cart"> 장바구니 </a>
					</li>
					<li class="pb-3">
						<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="myPage.jsp?m2=jjim"> 찜리스트 </a>
					</li>
				</ul>
			</div>
			<%

        	MemberDAO mdao=new MemberDAO();
        	MemberVo vo=mdao.getMember(user_id);
        	
        	request.setAttribute("vo", vo);
            %>




			<div class="col-lg-9">




				<!-- 시작 -->
				<div class="member-grade-box">
					<span class="icon-grade member-integrated"></span>
					<div class="grade-info-box">
						<h3 class="membership-info">안녕하세요!</h3>
						<span class="grade-info"><span><%=vo.getUser_name() %></span>
							<span class="bold">(${vo.user_id}님)</span></span>
					</div>
					<!-- S : 나의 정보 상세 -->
					<div class="right-box">
						<div class="shopping-info">
							<div class="info-item">
								<p class="info-title">장바구니</p>
								<span class="info-data"><a href="myPage.jsp?m2=cart"><%=cartCount%>개</a></span>
							</div>
						</div>

						<div class="shopping-info">
							<div class="info-item">
								<p class="info-title">찜한상품</p>
								<span class="info-data"><a href="myPage.jsp?m2=jjim"><%=jjimCount%>개</a></span>
							</div>
							<!-- E : 나의 정보 상세 -->
						</div>
					</div>
				</div>




				<%
	
	
	
	String m2 = request.getParameter("m2");
	if(m2.equals("myinfo")){
%>




				<div class="form">
					<h2 class="h2">내정보</h2>
					<h4>이름</h4>
					<span> <input type="text" value="${vo.user_name}" readonly></span>
					<h4>아이디</h4>
					<span> <input type="text" value="${vo.user_id}" readonly></span>
					<h4>이메일</h4>
					<span> <input type="text" value="${vo.user_email}" readonly></span>
					<h4>전화번호</h4>
					<span> <input type="text" value="${vo.user_phone}" readonly></span>
					<h4>주소</h4>
					<span> <input type="text" value="${vo.user_add}" readonly></span>
					<span style="float: right"> <input type="button" value="회원 정보 변경" class="button" id="btn-modal">
					</span>


				</div>

				<div id="modal" class="modal-overlay">
					<div class="modal-window">

						<div class="title">
							<div class="close-area" id="close">X</div>
						</div>


						<div class="m-form">
							<form action="memberUpdate.do" method="post" name="frm">

								<h2 class="info">회원정보수정</h2>
								<p class="write">'*' 표시 항목은 필수 입력 항목입니다.</p>

								<h4>이름</h4>
								<span> <input type="text" name="user_name" size="20"
									value="${vo.user_name}" readonly>
								</span>


								<h4>아이디</h4>
								<span> <input type="text" name="user_id" size="20"
									value="${vo.user_id}" readonly>
								</span>


								<h4>새로운 비밀번호 *</h4>
								<span> <input type="password" name="user_pw" size="20">
								</span>


								<h4>비밀번호 확인 *</h4>
								<span> <input type="password" name="pwd_check" size="20">
								</span>



								<h4>이메일</h4>
								<span> <input type="text" name="user_email" size="20"
									value="${vo.user_email}">
								</span>



								<h4>전화번호</h4>
								<span> <input type="text" name="user_phone" size="20"
									value="${vo.user_phone}">
								</span>


								<h4>주소</h4>
								<span> <input type="text" name="user_add" id="user_add"
									size="20" class="btn1" value="${vo.user_add}"> <input
									type="button" value="주소검색" class="btn2" onclick="goPopup();">

								</span>



								<p>
									<input type="submit" value="확인" class="button"
										onclick="return joincheck()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="취소" class="button" id="close2">
								</p>
							</form>
						</div>
					</div>
				</div>
				<% 
	}
		if(m2.equals("reviewMana")){
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
				<div class="row" style="padding:15px 0; border-bottom:1px solid #ddd; margin-bottom:20px;"><h2>내가 작성한 리뷰</h2></div>
	            <%
				for(int i=0; i<vec.size(); i++){
					questionsVO qvo=vec.get(i);
					request.setAttribute("qvo", qvo);
					String productName=qvo.getProductName();
					productVO pvo=sdao.getProductInfo(productName);
					String picture=pvo.getProductPicture();
					request.setAttribute("pvo", pvo);
					request.setAttribute("picture", picture);
				%>
            	<div class="reviews">
					<p><em class="add_box">리뷰</em>
						<strong class="review_id">${qvo.userId}</strong><span class="review_date">${qvo.date} </span></p>
						<p>
							<span class="rating_star" style="margin:28px;">
			               		<i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i>
			                    <span class="rating_starfull" style="width:${qvo.score*20}%;">
			                    	<i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i>
			                    </span>
			                </span>
		                </p>
		                <div style="width:100%; display:flex; justify-content: space-between;">
							<div style="width:20%;">
								<a href="shop-single.jsp?productName=${qvo.productName}">
									<img src="${pageContext.request.contextPath}/assets/img/${picture}"style=" width:100%;">
								</a>
							</div>
							<div style="width:75%; display:flex; flex-direction: column">
								<div style="width:100%;">
									<a href="shop-single.jsp?productName=${qvo.productName}" style="text-decoration:none; color:black;"><b>${pvo.brand}&nbsp;${qvo.productName}</b></a><br>
									${qvo.coment}
								</div>
								<div style="width:100%; margin-top:auto;">
									<div class="func_buttons">
									<%
										int userType=sdao.getUserType(user_id);
										if(userType==0 || qvo.getUserId().equals(user_id)){
									%>
										<form action="delMyReview" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?')">
											<input type="hidden" name="productName" value="${qvo.productName }">
											<input type="hidden" name="userid" value="${user_id}">
											<input type="hidden" name="ref" value="${qvo.ref_}">
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
						<a class="pazing_style" href="myPage.jsp?m2=reviewMana&pageNum=<%=startPage-10%>">이전</a>
				<%
						}
						for(int i=startPage; i<=endPage; i++)
							if(Integer.parseInt(pageNum) == i){
				%>
							<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="myPage.jsp?m2=reviewMana&pageNum=<%=i%>"><%=i%></a>
				<%
						}
						if(endPage < pageCount){
				%>
							<a class="pazing_style" href="myPage.jsp?m2=reviewMana&pageNum=<%=startPage+10%>">다음</a>
				<%
						}
					}
				%>
				</div>

				<%
	}
	if(m2.equals("cart")){
%>
				<div>
					<div class="jjim_box">

					<div class="cart_div1">
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
						if(list.size()==0){
					%>
						<div style="width:100%; text-align:center; margin:40px 0;"><h3 style="color:#ddd">장바구니가 비어있습니다.</h3></div>
					<%
						}
						for (int i = 0; i < list.size(); i++) {
							Cart cart = list.get(i);
							DecimalFormat formatter = new DecimalFormat("###,###");
							String price = formatter.format(cart.getPrice());
					%>
					<form action="" method="post">
						<div class="cart_div2">
							<div style="width: 15%; word-wrap: break-word;">
								<input type="hidden" name="pic"
									value="<%=cart.getProduct_Picture()%>"> <a
									href="shop-single.jsp?productName=<%=cart.getProduct_Name()%>"><img
									src="assets/img/<%=cart.getProduct_Picture()%>" width="100%"
									alt="" /></a>
							</div>
							<div style="width: 20%; word-wrap: break-word;">
								<input type="hidden" name="pn" value="<%=cart.getProduct_Name()%>"> 
								<a href="shop-single.jsp?productName=<%=cart.getProduct_Name()%>" style="text-decoration:none;">
									<%=cart.getProduct_Name()%>
								</a>
							</div>
							<div style="width: 10%;">
								<input type="hidden" name="ss" value="<%=cart.getShoessize()%>">
								<%=cart.getShoessize()%>
							</div>
							<div style="width: 15%; word-wrap: break-word;">
								₩<%=price%></div>
							<div style="width: 10%;">
								<input class="input-number" type="number" name="qy" value="<%=cart.getQuantity()%>" onchange="test(<%=num++%>);" min="0" max="99">
							</div>
							<div style="width: 20%">
								<input type="hidden" name="pr" value="<%=cart.getPrice()%>">
								₩ <span class="sum"> <input type="hidden" name="prsum" value="<%=cart.getPrice() * cart.getQuantity()%>"> 
									<%=cart.getPrice() * cart.getQuantity()%>
								</span>
							</div>
							<div style="width: 10%;">
								<input class="cart_btn" type="submit" value="삭제" onclick="javascript: form.action='cartdelete?i=<%=i%>';">
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
							<div style="width: 100%; padding: 20px 0;">
								<div>
									<input class="cart_btn" type="submit" value="비우기" onclick="javascript: form.action='cartalldelete';" style="float:left;">
									<input class="cart_btn" type="submit" value="구매" onclick="javascript: form.action='bought';" style="float:right;">
								</div>
							</div>
						</div>
					</form>
					</div>
				</div>
<%
	}if(m2.equals("orderList")){
%>
				<div class="jjim_box">
					<div class="order_div1">
						<div style="width:30%;">상품</div>
		            	<div style="width:10%;">사이즈</div>
		            	<div style="width:20%;">가격</div>
		            	<div style="width:10%;">수량</div>
		            	<div style="width:20%">합계</div>
		            	<div style="width:10%">비고</div>
					</div>



					<%
						BoughtDAO bdao = new BoughtDAO();
						ArrayList<boughtVO> list = bdao.getbought(user_id);
						if(list.size()==0){
					%>
						<div style="width:100%; text-align:center; margin:40px 0;"><h3 style="color:#ddd">아직 주문한 상품이 없습니다.</h3></div>
					<%
						}
						for (int i = 0; i < list.size(); i++) {
							boughtVO bought = list.get(i);
							shoesDAO sdao = new shoesDAO();
							productVO pvo = sdao.getProductInfo(bought.getProductName());
							DecimalFormat formatter = new DecimalFormat("###,###");
							String price = formatter.format(pvo.getPrice());
					%>
					<form action="" method="post">
						<div class="order_div2">
							<div style="width: 10%;">
								<a href="shop-single.jsp?productName=<%=bought.getProductName()%>"><img
									src="/assets/img/<%=pvo.getProductPicture()%>" width="100%"
									alt="" /></a>
							</div>
							<div style="width: 20%;">
								<a href="shop-single.jsp?productName=<%=bought.getProductName()%>" style="text-decoration:none;"><%=bought.getProductName()%></a>
							</div>
							<div style="width: 10%;"><%=bought.getShoesSize()%></div>
							<div style="width: 20%;">
								₩<%=price%></div>
							<div style="width: 10%;">
								<%=bought.getQuantity()%>
							</div>
							<div style="width: 20%">
								₩<%=bought.getTotal()%>
							</div>
							<div style="width:10%;">
								<input type="hidden" name="bqy" value="<%=bought.getQuantity()%>">
								<input type="hidden" name="bpr" value="<%=bought.getTotal()%>">
			            		<input type="hidden" name="pix_productName" value="<%=bought.getProductName()%>">
			            		<input type="hidden" name="pix_shoesSize" value="<%=bought.getShoesSize() %>">
			            		<%
			            		if(bought.getFix()==1){
			            		%>
			            		<input class="delrivew_btn" type="submit" value="구매확정" onclick="javascript: form.action='fixed?i=<%=i%>'" style="margin-bottom:10px;">
			            		<%
			            		}if(bought.getFix()==0){
			            		%>
			            		<p><a href="shop-single.jsp?productName=<%=bought.getProductName()%>" class="delrivew_btn" style="text-decoration:none; white-space:nowrap;">재구매</a></p>
			            		<p><a href="myPage.jsp?m2=insertReview&productName=<%=bought.getProductName()%>" class="delrivew_btn" style="text-decoration:none; white-space:nowrap;">리뷰작성</a></p>
			            		<%
			            		}
			            		%>
		            		</div>
						</div>
					</form>

					<%
						}
					%>

					<div
						style="width: 100%; display: flex; justify-content: space-between; text-align: center; align-items: center; padding: 20px 0;">
						<div style="width: 20%;">
							<b>합계</b>
						</div>
						<div style="width: 20%;">
							<b>₩<span id="bsum"></span></b>
						</div>
					</div>
				</div>
<%
	}if(m2.equals("jjim")){
%>
				<div>
					<div class="jjim_box">
						<div class="jjim_div1">
							<div style="width: 60%;">상품</div>
							<div style="width: 30%;">가격</div>
						</div>
						<%
							JjimDAO jdao = new JjimDAO();
							ArrayList<Jjim> list = jdao.getjim(user_id);
							if(list.size()==0){
						%>
							<div style="width:100%; text-align:center; margin:40px 0;"><h3 style="color:#ddd">찜한 상품이 없습니다.</h3></div>
						<%
									}
							for (int i = 0; i < list.size(); i++) {
								Jjim jjim = list.get(i);
								DecimalFormat formatter = new DecimalFormat("###,###");
								String price = formatter.format(jjim.getPrice());
						%>
						<form action="" method="post">
							<div class="jjim_div2">
								<div style="width: 20%; word-wrap: break-word;">
									<a
										href="shop-single.jsp?productName=<%=jjim.getProduct_Name()%>"><img
										src="assets/img/<%=jjim.getProduct_Picture()%>" width="100%"
										alt="" /></a>
								</div>
								<div style="width: 40%; word-wrap: break-word;">
									<input type="hidden" name="jn" value="<%=jjim.getProduct_Name()%>">
									<a href="shop-single.jsp?productName=<%=jjim.getProduct_Name()%>" style="text-decoration: none;"><%=jjim.getProduct_Name()%></a>
								</div>
								<div style="width: 30%; word-wrap: break-word;">
									₩<%=price%></div>
								<div style="width: 10%; word-wrap: break-word;">
									<span class="input_icon">
										<i class="fas fa-times"></i>
										<input type="submit" class="x_button" value="제거" onclick="javascript: form.action='jjimdelete?i=<%=i%>';">
									</span>
								</div>

							</div>

							<%
								}
							%>
							<div>
								<div style="margin:10px 0">　
									<input class="jjim_btn" type="submit" value="전체 제거" onclick="javascript: form.action='jjimalldelete';">
								</div>
							</div>
						</form>
					</div>
				</div>
<%
	}if(m2.equals("insertReview")){
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
	                			<span><%=user_id%></span>
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
<%
	}
%>	           
			</div>
		</div>
	</div>
	<!-- End Content -->

	<%@include file="/footer.jsp"%>


	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/myPageModal.js"></script>
	<script src="assets/js/bought.js"></script>
	<script src="assets/js/insertReview.js"></script>
	<script src="assets/js/cart.js"></script>
	<!-- End Script -->


	<script type="text/javascript" src="script/juso.js?ver=2"></script>

</body>

</html>