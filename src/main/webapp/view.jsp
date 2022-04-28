<%@page import="com.shoes.model.Reply"%>
<%@page import="com.shoes.dao.ReplyDAO"%>
<%@page import="com.shoes.dao.BbsDAO"%>
<%@page import="com.shoes.model.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" href="assets/css/view.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->


<script type="text/javascript">
const amend=document.getElementsByClassName('amend');
const contents=document.getElementsByClassName('contents');
function update(a) {
      amend[a].style.display="block";
      contents[a].style.display="none";
    }
function del(a) {
	amend[a].style.display="none";
	contents[a].style.display="block";
  }    
    
    </script>
</head>

<body>
<%@include file="/header.jsp"%>
<%
String userID=null;
if(session.getAttribute("user_id")!=null){
	userID=(String) session.getAttribute("user_id");
}
int bbsID =0;
if(request.getParameter("bbsID")!= null){
	bbsID=Integer.parseInt(request.getParameter("bbsID"));
}

String pageNumber=request.getParameter("pageNumber");
int pageSize = 10;
if(pageNumber == null){
	pageNumber ="1";
}
int currentPage = Integer.parseInt(pageNumber);
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;

if(bbsID == 0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않는 글입니다.')");
	script.println("location.href='contact.jsp'");
	script.println("</script>");
}
Bbs bbs = new BbsDAO().getBbs(bbsID);
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
    <div class="container">
    	<div class="box">
    	<div>
    	<h3><%= bbs.getBbsTitle() %></h3> 
    	
				<div style="float:right ; margin-top:-42px;">
				<form method="post" action="delete" onsubmit="return confirm('정말로 삭제하시겠습니까?')">
				
				<%
				if(userID!=null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn update_btn">수정</a>
					<input type="hidden" name="bbsID" value="<%=bbsID %>">
					<input class="btn update_btn"type="submit" value="삭제">
					<%
			} 
			%>
			<a href="board.jsp" class="btn update_btn">목록</a>
				</form>
				</div>
			
			<br>
    	<div class="date" style="float:right;margin-top:-30px;">
    	<%= bbs.getBbsDate() %>
    	</div>
    	</div>
    	<div style=margin-top:-30px;>
    	<h5>
    	<%= bbs.getUserID() %>
    	</h5>
		</div>
		
    	<br>
    	<br>
    	<div>
    	<%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %>
    	</div>
    	<br>
    	<br>
    	<br>
    	<br>
    	<br>
    	<div class="reply">
    	댓글
    	</div>
    	<hr>
    	<div style=text-align:center;>
    	깨끗한 댓글 문화를 만들어가요.
    	</div>
    	
    	
    
    		
    		
				
					
						<%
						ReplyDAO replyDAO=new ReplyDAO();
						//ArrayList<Reply> list=replyDAO.getList(bbsID,pageNumber);
						ArrayList<Reply> list=replyDAO.getList(startRow, endRow, bbsID);
						int count=replyDAO.getcount(bbsID);
						int pnum=count-(currentPage-1)*pageSize;
						int num=0;
						for(int i=0;i<list.size();i++){
							
						%>

	
				<form action="replydelete" method="post" onsubmit="return confirm('삭제합니까?')">

					<div class="contents">
						
						<hr>
						<div class="div1">
						<%= list.get(i).getUserID() %>
						</div>
                    	<div>
						<%= list.get(i).getReplyContent() %>
						</div>
						<div class="date2" style=float:right>
						<%=list.get(i).getReplyDate() %>
						</div>
						<%if(userID!=null && userID.equals(list.get(i).getUserID())){ %>
						<div class="up_del" >
						<input class="update_btn" type="button" value="수정" onclick="update(<%=num%>);">
						<input type="hidden" name="bbsID" value="<%=bbsID %>">
						<input type="hidden" name="replyID" value="<%=list.get(i).getReplyID() %>"> 
						<input class="btn del_btn" type="submit" value="삭제" style="margin-bottom: 5px;">
						</div>
						<%} %>
						 
					</div>
					<br>
				</form>
				
					<%if(userID!=null && userID.equals(list.get(i).getUserID())){ %>
					<div class="amend" style=margin:20px;>
					<hr>
					<form action="replyupdate" method="post">
						<textarea class="form-control"
							placeholder="댓글을 입력하세요." name="replyContent" maxlength="2048"
							required></textarea>
						<input type="hidden" name="bbsID" value="<%=bbsID %>"> 
						<input type="hidden" name="replyID" value="<%=list.get(i).getReplyID() %>"> 
						<input type="submit" value="수정"> <input type="button" value="취소" onclick="del(<%=num%>);">
					</form>
					</div>
					
				





						<%	
								}
							num++;
						}
						%>
						
				<div style=text-align:center;>
<%
		
            if(count > 10){
                // 카운터링 숫자를 얼마까지 보여줄껀지 결정
                int pageCount=count/pageSize+(count%pageSize == 0? 0:1);
                //2

                // 시작 페이지 숫자를 지정
                int startPage=1;
                if(currentPage%10 != 0){
                    startPage=((int)(currentPage/10))*10+1;
                }else{
                    startPage=((int)(currentPage/10)-1)*10+1;
                }

                int pageBlock=10;
                int endPage=startPage+pageBlock-1; // 화면에 보여질 페이지의 마지막 숫자

                if(endPage > pageCount)
                    endPage=pageCount;

                // 이전이라는 링크를 만들건지 파악
                if(startPage > 10){
        %>
        		
                <a class="da2" href="view.jsp?bbsID=<%=bbsID%>&pageNumber=<%=startPage-10%>">[이전]</a>
        <%
                }
                // 페이징 처리
                
                for(int i=startPage; i<=endPage; i++){
        %>
        		
                <a class="da2" href="view.jsp?bbsID=<%=bbsID%>&pageNumber=<%=i%>#qScroll"><%=i%></a>
        <%
                }
                // 다음이라는 링크를 만들건지 파악
                if(endPage < pageCount){
        %>
        		
                <a class="da2" href="view.jsp?bbsID=<%=bbsID%>&pageNumber=<%=startPage+10%>">[다음]</a>
                
        <%
                }
            }
        %>
        		
				</div>
				<br>
				<br>
				<div style=margin-bottom:-30px;>
				<%if(userID != null){ %>
				<form method="post" action="reply">
				<textarea class="form-control"
								placeholder="댓글을 입력하세요." name="replyContent"  maxlength="2048" required></textarea>
				<input type="hidden" name="bbsID" value=<%=bbsID%>>	
				<div>		
				<input class="update_btn" type="submit" value="댓글입력" style=float:right;><br>
				</div>
			</form>
			<%} %>
			<br>
			</div>
			</div>
				</div>
			<br>
			<div class="da1">
				<a href="board.jsp" class="update_btn" style="padding:5px 10px;">목록</a>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		


    
 <!-- Start Footer -->
   <div>
   <%@include file="footer.jsp"%>
   </div>
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