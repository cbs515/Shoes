<%@page import="com.shoes.dao.BbsDAO"%>
<%@page import="com.shoes.model.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - write</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
<%@include file="/header.jsp"%>
<%
String userID=null;
if(session.getAttribute("user_id")!=null){
	userID=(String) session.getAttribute("user_id");
}
if(userID == null){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}
int bbsID =0;
if(request.getParameter("bbsID")!= null){
	bbsID=Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않는 글입니다.')");
	script.println("location.href='board.jsp'");
	script.println("</script>");
}
Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!userID.equals(bbs.getUserID())){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href='board.jsp'");
	script.println("</script>");
}
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
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
        <form method="post" action="update">
            <h1 class="navbar-brand text-success logo h1 align-self-center">게시판</h1>
           <table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
<thead>
<tr>
<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
</tr>
</thead>
<tbody>
<tr>
<td><input type="text" class=form-control placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
</tr>
<tr>
<td><textarea class=form-control placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent()%></textarea></td>
</tr>
</tbody>
</table>
<input type="hidden"  name="bbsID" value="<%=bbsID %>">
<input type="submit" class="btn btn-primary pull-right" value="글 수정">
</form>
</div>
</div>

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
           
        </div>
    </div>
    <!-- End Contact -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>