<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js?ver=5"></script>
</head>
<body>
<h2>아이디 중복 확인</h2>
<form action="idCheck.do" method="get" name="frm">
	아이디<input type="text" name="user_id" value="${user_id}">
	    <input type="submit" value="중복 체크"><br>
	    
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			opener.document.frm.user_id.value="";
		</script>
		${user_id}는 이미 사용 중인 아이디입니다.
	</c:if>
	<c:if test="${result == -1 }">
		${user_id}는 사용 가능한 아이디입니다.
		<input type="button" value="사용" onclick="idok('${user_id}')">
	</c:if>
</form>
</body>
</html>