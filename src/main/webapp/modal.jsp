<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Modal</title>

<style>
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position:absolute;
	top:50%;
	left:50%;
	width:600px;
	height:340px;
	padding:40px;
	background-color: rgb(255, 255, 255);
	border-radius:10px;
	box-shadow:0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform:translateX(-50%) translateY(-50%);
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
.modal_button{
	border:0;
	outline:0;
	background-color:#59ab6e;
	color:#fcfcfc;
	border-radius: 4px;
	padding:5px;
	cursor:pointer;
}
</style>
</head>
<body>
<%
	String userid="asd123";
	String productName="조던1";
	session.setAttribute("userid", userid);
	request.setAttribute("productName",productName);
%>
	<div class="modal">
		<div class="modal_body">
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
							<input type="submit" class="modal_button" value="작성하기">
							<input type="button" class="modal_button" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	
	<button class="btn-open-popup">Modal 띄우기</button>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	<h1>ㅁㄴ이ㅓ만아ㅣㅓㅁ니아먼이ㅏ머이ㅏ머이ㅏ먼이ㅏ먼이ㅏ먼이ㅏ먼이마ㅓ이ㅏㅁ너이ㅏㅁ너임너임ㄴ어</h1><br>
	
	<script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>
</body>
</html>