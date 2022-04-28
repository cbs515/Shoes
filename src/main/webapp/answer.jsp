<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/answerpopup.css">
</head>
<body>
<%
	int ref=Integer.parseInt(request.getParameter("ref"));
	String productName=request.getParameter("productName");
	request.setAttribute("ref",ref);
	request.setAttribute("productName",productName);
%>
	<div class="top_center">
		<h3>답변작성</h3>
	</div>
	<form action="addAnswer" method="post">
		<table>
			<tr class="height">
				<td class="center">아이디</td>
				<td><strong>&nbsp;&nbsp;${userid}</strong></td>
			</tr>
			<tr>
				<td class="center">내용</td>
				<td><textarea rows="10" cols="70" name="coment" required></textarea></td>
			</tr>
			<tr class="table_button">
				<td colspan="2">
					<input type="hidden" name="userid" value="${userid}">
					<input type="hidden" name="productName" value="${productName}">
					<input type="hidden" name="ref" value="${ref}">
					<input type="submit" class="popup_button" value="작성하기">
					<input type="button" class="popup_button" value="취소" onclick="window.close()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>