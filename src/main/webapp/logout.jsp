<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
    
%>
<!-- 세션만 확인하고 이전페이지로 -->


</body>
</html>