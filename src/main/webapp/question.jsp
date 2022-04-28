<%@page import="com.shoes.model.questionsVO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	font-size:0.9em;
}
.question{
	padding:20px;
}
.question_top{
	display:flex;
	justify-content:space-between;
}
.func_buttons{
	display:flex;
	justify-content:flex-end;
}
.answer_do{
	background-color:#59ab6e;
	color:#fcfcfc;
	text-decoration:none;
	border-radius: 4px;
	padding:5px;
	font-size:0.9em;
}
.del_button{
	border:0;
	outline:0;
	background-color:#59ab6e;
	color:#fcfcfc;
	border-radius: 4px;
	padding:5px;
	cursor:pointer;
	font-size:0.9em;
}
.line_div{
}
.question_do{
	background-color:#59ab6e;
	color:#fcfcfc;
	padding:12px 0px 0px 16px;
	margin:10px 0px 10px 0px;
	text-decoration:none;
	width:5em;
	border-radius: 4px;
}
.add_box{
	background-color:#59ab6e;
	padding:1px 5px 1px 1px;
	color:#fcfcfc;
	border-radius: 4px;
}
.question_date{
	float:right;
}
.question_contents{
	margin-top:0.5em;
	padding-bottom:5px;
}
.question_paging{
	text-align:center;
}
.pazing_style{
	background-color:#59ab6e;
	color:#fcfcfc;
	border-radius: 4px;
	text-decoration:none;
	padding:1px 5px 1px 5px;
}
.select_pazing{
	background-color:#427e4f;
	color:#fcfcfc;
	border-radius: 4px;
	text-decoration:none;
	padding:1px 5px 1px 5px;
}
.popupDiv {
	position: absolute;
	background: white;
	width:630px;
	height:360px;
	display: none; 
	border-radius:10px;
	left:50%;
	transform:translateX(-50%) translateY(0%);
}
   
.popup_mask {
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	opacity: 0.8;
}
.popup{
	padding:15px 30px 0 30px;
}
.top_center {
	text-align: center;
}
tr.height{
	height:50px;
}
td.center{
	text-align:center;
}
.table_button{
	text-align:center;
	height:55px;
}
.modal_button, .modal_done_button{
	border:0;
	outline:0;
	background-color:#59ab6e;
	color:#fcfcfc;
	border-radius: 4px;
	padding:5px;
	cursor:pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery-1.11.0.min.js"></script>
</head>
<body>
<%
	String userid="asd123";
	session.setAttribute("userid", userid);
	int qPageSize=10;
	
	String qPageNum=request.getParameter("qPageNum");
	if(qPageNum == null){
		qPageNum="1";
	}
	request.setAttribute("qPageNum", qPageNum);
	
	int qCount=0;
	int qNumber=0;
	int qCurrentPage=Integer.parseInt(qPageNum);
	
	String productName=request.getParameter("productName");
	request.setAttribute("productName",productName);
	shoesDAO sdao=new shoesDAO();
	qCount=sdao.getQuestionCount(productName);
	
	int startRow=(qCurrentPage-1)*qPageSize+1;
	int endRow=qCurrentPage*qPageSize;
	
	Vector<questionsVO> vec=sdao.getProductQuestions(startRow, endRow, productName);
	qNumber=qCount-(qCurrentPage-1)*qPageSize;
%>
<div class="question_box">
	<div class="question">
		<div class="question_top">
			<h2>상품문의</h2>
			<a class="question_do" href="javascript:;">문의하기</a>
		</div>
		
		<div class ="popup_mask" ></div>
	    <div class="popupDiv">
	    	<div class="popup">
		        <div class="top_center">
						<h3>문의하기</h3>
				</div>
				<form action="addQuestion" method="post">
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
								<input type="submit" class="modal_done_button" value="작성하기">
								<input type="button" class="modal_button" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
	    </div>
		<div class="question_contents">
			<div class="question_list">
				<%
					for(int i=0; i<vec.size(); i++){
						questionsVO vo=vec.get(i);
						request.setAttribute("vo", vo);
				%>
				<div class="qestions">
				<%
						if(vo.getLevel_() > 1){
				%>
						└&nbsp;<em class="add_box">답변</em>
				<%
						}else{
				%>
						<em class="add_box">질문</em>
				<%
						}
				%>
						<strong class="question_id">${vo.userId}</strong><span class="question_date">${vo.date} </span>
						<div class="question_contents">${vo.coment}
						</div>
						<div class="func_buttons">
				<%
						String getuserid=(String)session.getAttribute("userid");
						int userType=sdao.getUserType(getuserid);
						if(userType==0 && vo.getLevel_()==1){
				%>
							<a class="answer_do" href="answer.jsp?productName=${productName}&ref=${vo.ref_}" onclick="window.open(this.href, '_blank', 'width=650, height=390'); return false;">답변</a>
				<%
						}
						Object getUserid=session.getAttribute("userid");
						if(userType==0 || vo.getUserId().equals((String)getUserid)){
				%>
							<form action="delQuestion" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?')">
								<input type="hidden" name="productName" value="${productName}">
								<input type="hidden" name="ref" value="${vo.ref_}">
								<input type="hidden" name="qPageNum" value="${qPageNum}">
								<input type="hidden" name="rPageNum" value="${rPageNum}">
								<input type="submit" value="삭제" class="del_button">
							</form>
				<%
						}
				%>
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
			</div>
			<div class="question_paging">
				<%
					if(qCount > 0){
						int qPageCount=qCount/qPageSize+(qCount%qPageSize == 0? 0:1);
						
						int qStartPage=1;
						if(qCurrentPage%10 != 0){
							qStartPage=((int)(qCurrentPage/10))*10+1;
						}else{
							qStartPage=((int)(qCurrentPage/10)-1)*10+1;
						}
						
						int qPageBlock=10;
						int qEndPage=qStartPage+qPageBlock-1;
						
						if(qEndPage > qPageCount)
							qEndPage=qPageCount;
						
						if(qStartPage > 10){
				%>
						<a class="pazing_style" href="question.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=qStartPage-10%>">이전</a>
				<%
						}
						for(int i=qStartPage; i<=qEndPage; i++){
							if(Integer.parseInt(qPageNum) == i){
				%>
								<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="question.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=i%>"><%=i%></a>
				<%
							}
						}
						if(qEndPage < qPageCount){
				%>
						<a class="pazing_style" href="question.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=qStartPage+10%>">다음</a>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
</div>
<script src="assets/js/popupcontoller.js"></script>

</body>
</html>