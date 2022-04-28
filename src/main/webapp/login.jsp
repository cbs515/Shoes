<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="script/login.js?ver=123"></script>

    
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="apple-touch-icon" href="assets/img/apple-icon.png" >
    <link rel="shortcut icon" type="image/x-icon" >

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/login.css?after">

   <!--  Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="assets/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap&subset=korean" rel="stylesheet">
	


</head>




<body>

<%@include file="/header.jsp"%>



<div class="login-page">

  <div class="form">
   <h2 class="h2">로그인</h2>
    <form action="login.do" method="post" name="frm" >
      <input type="text" name="user_id" value="${user_id}" placeholder="아이디를 입력해주세요."/>
      <input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요."/>
      <input type="submit" value="로그인" class="button" onclick="return loginCheck()">
      <p class="msg">회원이 아니신가요? <a onclick="location.href='join.jsp'">가입하기</a></p>
    </form>
  </div>
</div>



<%@include file="/footer.jsp"%>


</body>
</html>