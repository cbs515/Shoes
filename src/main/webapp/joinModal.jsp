<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/joinModal.css?ver=1">
<style>
      
    </style>
    

</head>
<body>
<div id="container">
  <h2>Lorem Ipsum</h2>
  <div id="lorem-ipsum"></div>
  <input type="button" id="btn-modal" value="button">
</div>
    
   
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
       
       <div class="title">
          <div class="close-area" id="close">X</div>
       </div>
       
       
        <div class="m-form">
           <form action="../memberUpdate.do" method="post" name="frm">
            
				<h2 class="info">회원정보수정</h2>
                <p class="write">'*' 표시 항목은 필수 입력 항목입니다.</p>

						<h4>이름</h4>
						<span> <input type="text" name="user_name" size="20"
							value="${mvo.user_name}" readonly>
						</span>


						<h4>아이디</h4>
						<span> <input type="text" name="user_id" size="20"
							value="${mvo.user_id}" readonly>
						</span>


						<h4>새로운 비밀번호 *</h4>
						<span> <input type="password" name="user_pw" size="20">
						</span>


						<h4>비밀번호 확인 *</h4>
						<span> <input type="password" name="pwd_check" size="20">
						</span>



						<h4>이메일</h4>
						<span> <input type="text" name="user_email" size="20"
							value="${mvo.user_email}">
						</span>



						<h4>전화번호</h4>
						<span> <input type="text" name="user_phone" size="20"
							value="${mvo.user_phone}">
						</span>


						<h4>주소</h4>
						<span> <input type="text" name="user_add" id="user_add"
							size="20" class="btn1" value="${mvo.user_add}"> <input
							type="button" value="주소검색" class="btn2" onclick="goPopup();">

						</span>



						<p>
							<input type="submit" value="확인" class="button"
								onclick="return joincheck()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" class="button" id="close2">
						</p>




					</form>
					
</div>
            
            
            
            
            
            
            
            
            
            
               
            
        </div>
        </div>

    
     <script>
        const modal = document.getElementById("modal")
        
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
        	modal.style.display = "block"
        })
        
        
       const closeBtn = document.getElementById("close")
        closeBtn.addEventListener("click", e =>{
        	modal.style.display= "none"
        })
        
        
        const closeBtn2 = document.getElementById("close2")
        closeBtn2.addEventListener("click", e =>{
        	modal.style.display= "none"
        })
        
        
    /*     
        fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
            .then(response => response.text())
            .then(result => loremIpsum.innerHTML = result) */
    </script>
    
    
    
</body>
</html>