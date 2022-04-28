<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/script/member.js?ver=2"></script>
<script type="text/javascript" src="/script/juso.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="apple-touch-icon"href="assets/img/apple-icon.png" >
    <link rel="shortcut icon" type="image/x-icon" >

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/join.css?ver=1">

   <!--  Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="assets/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap&subset=korean" rel="stylesheet">


</head>




<body>

<%@include file="header.jsp"%>


<div class="join-page">
<div class="form">
<h2 class="h2">회원 가입</h2>
<p class="write">'*' 표시 항목은 필수 입력 항목입니다.</p>
	<form action="join.do" method="post" name="frm">
	
	
		
	
		<h4>이름 * </h4>
		<span>
			<input type="text" name="user_name" size="20">
		</span>
		
		
		<h4>아이디 * </h4>
		<span>
			<input type="text" name="user_id" size="20" class="btn1">
			
			<input type="hidden" name="reid" size="20">
			<input type="button" value="중복체크" class="btn2" onclick="return idCheck()">		
		</span>
		
		
		<h4>비밀번호 * </h4>
		<span>
			<input type="password" name="user_pw" size="20">
		</span>
		
		
		<h4>비밀번호 확인 * </h4>
		<span>
			<input type="password" name="pwd_check" size="20">
		</span>
		
		
		
		<h4>이메일</h4>
		<span>
			<input type="text" name="user_email" size="20">
		</span>
		
		
		
		<h4>전화번호</h4>
		<span>
			<input type="text" name="user_phone" size="20">
		</span>
		
		
		<h4>주소</h4>
		<span>
			<input type="text" name="user_add" id="user_add" size="20" class="btn1">
			<input type="button" value="주소검색" class="btn2" onclick="goPopup();">	
		</span>
	
	
		
		
		<p>
			<input type="hidden" class="grade" name="user_number" value="1">
			<input type="submit" value="확인" class="button" onclick="return joinCheck()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="reset" value="취소" class="button" onClick="history.go(-1)"></p>
		
		<p>	${message}</p>
	
	</form>
</div>
</div>





<%@include file="footer.jsp"%>

</body>
</html>







