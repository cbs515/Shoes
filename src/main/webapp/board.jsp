<%@page import="com.shoes.model.Bbs"%>
<%@page import="com.shoes.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/contact.css">
    

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
<%@include file="/header.jsp"%>

<body>
<%
String userID=null;
if(session.getAttribute("user_id")!=null){
	userID=(String) session.getAttribute("user_id");
}
String pageNumber=request.getParameter("pageNumber");
int pageSize = 10;
if(pageNumber == null){
	pageNumber ="1";
}
int currentPage = Integer.parseInt(pageNumber);
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;
%>

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


    <!-- Start Content Page -->
	<div class="contents-wrap">
		<div class="col m-auto text-center">
			<div>
				<h1 class="navbar-brand text-success logo h1 align-self-center"
					style="margin-top: 15px;">게시판</h1>

				<a href="write.jsp" class="wr" style="float: right;">글쓰기</a>
			</div>
			<table class="table" style="text-align: center;">
				<thead>
					<tr>
						<th class="th1">번호</th>
						<th class="th1">제목</th>
						<th class="th1">작성자</th>
						<th class="th1">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(startRow, endRow);
						int count = bbsDAO.getcount();
						int num = count - (currentPage - 1) * pageSize;
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr class="th1">
						<td><%=num--%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div style="margin-bottom: 30px;">
				<%
					if (count > 10) {
						// 카운터링 숫자를 얼마까지 보여줄껀지 결정
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						//2

						// 시작 페이지 숫자를 지정
						int startPage = 1;
						if (currentPage % 10 != 0) {
							startPage = ((int) (currentPage / 10)) + 1;
						} else {
							startPage = ((int) (currentPage / 10) - 1) + 1;
						}

						int pageBlock = 10;
						int endPage = startPage + pageBlock - 1; // 화면에 보여질 페이지의 마지막 숫자

						if (endPage > pageCount)
							endPage = pageCount;

						// 이전이라는 링크를 만들건지 파악
						if (startPage > 10) {
				%>
				<a class="da2" href="board.jsp?pageNumber=<%=startPage - 10%>">[이전]</a>
				<%
					}
						// 페이징 처리
						for (int i = startPage; i <= endPage; i++) {
				%>
				<a class="da2" href="board.jsp?pageNumber=<%=i%>"
					class="pull-right"><%=i%></a>
				<%
					}
						// 다음이라는 링크를 만들건지 파악
						if (endPage < pageCount) {
				%>
				<a class="da2" href="board.jsp?pageNumber=<%=startPage + 10%>">[다음]</a>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>






	<!-- Start Footer -->
		<%@include file="footer.jsp"%>
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