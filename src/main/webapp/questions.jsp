<%@page import="java.util.Vector"%>
<%@page import="com.shoes.dao.shoesDAO"%>
<%@page import="com.shoes.model.questionsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qPageNum=request.getParameter("qPageNum");
	if(qPageNum == null){
		qPageNum="1";
	}
	request.setAttribute("qPageNum",qPageNum);
	int rPageSize=10;
	int qPageSize=10;
	
	String rPageNum=request.getParameter("rPageNum");
	if(rPageNum == null){
		rPageNum="1";
	}
	request.setAttribute("rPageNum",rPageNum);
		
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
<div class="question_box" id="qScroll">
	<div class="container" style="border:1px solid #dddddd; padding-top:20px; border-radius:5px; margin-bottom:100px;">
		<div class="question_top">
			<h2>상품문의</h2>
		</div>
		<div class="func_buttons">
			<a class="question_do" href="javascript:;">문의하기</a>
		</div>
<%if(vec.size()==0){%>
		<div class="coment_none">
			<h4 style="color:#ddd;">작성된 문의가 없습니다.</h4>
		</div>
<%}%>
		
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
							<td><strong>&nbsp;&nbsp;${user_id}</strong></td>
						</tr>
						<tr>
							<td class="center">내용</td>
							<td><textarea rows="7" cols="60" name="coment" required></textarea></td>
						</tr>
						<tr class="table_button">
							<td colspan="2">
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
						String getqUserId=(String)session.getAttribute("user_id");
						int userType=sdao.getUserType(getqUserId);
						if(userType==0 && vo.getLevel_()==1){
				%>
							<a class="answer_do" href="answer.jsp?productName=${productName}&ref=${vo.ref_}" onclick="window.open(this.href, '_blank', 'width=650, height=390'); return false;">답변</a>&nbsp;
				<%
						}
						Object getUserid=session.getAttribute("userid");
						if(userType==0 || vo.getUserId().equals(getqUserId)){
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
			</div>
			<div class="question_paging">
				<%
					if(qCount > 10){
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
						<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=qStartPage-10%>">이전</a>
				<%
						}
						for(int i=qStartPage; i<=qEndPage; i++){
							if(Integer.parseInt(qPageNum) == i){
				%>
								<a class="select_pazing"><%=i%></a>
				<%
							}else{
				%>
							<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=i%>#qScroll"><%=i%></a>
				<%
							}
						}
						if(qEndPage < qPageCount){
				%>
						<a class="pazing_style" href="shop-single.jsp?productName=${productName}&rPageNum=${rPageNum}&qPageNum=<%=qStartPage+10%>">다음</a>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
</div>
<script src="assets/js/popupcontoller.js"></script>