function loginCheck(){
	
	if(document.frm.user_id.value.length == 0){
		alert("아이디를 입력하세요.");
		document.frm.user_id.focus();
		
		return false;
	}
	
	if(document.frm.user_pw.value == ""){
		alert("패스워드는 반드시 입력해야 합니다.")
		document.frm.user_pw.focus();
		
		return false;
	}
	
	return true;
}

function idCheck(){
	
	if(document.frm.user_id.value == ""){
		alert("아이디를 입력해 주세요.")
		document.frm.user_id.focus();
		
		return;
	}
	
	var url="../idCheck.do?user_id="+document.frm.user_id.value;
	window.open(url,"_blank_1","toolbar=no,menubar=no,"+"scrollbars=yes,resizable=no,width=450,height=200");
}

function idok(user_id){
	opener.frm.user_id.value=document.frm.user_id.value;
	opener.frm.reid.value=document.frm.user_id.value;
	self.close();
}





function joinCheck(){
	if(document.frm.user_name.value.length == 0){
		alert("이름을 써 주세요.");
		document.frm.user_name.focus();
	
	return false;
	}
	
	if(document.frm.user_id.value.length == 0){
		alert("아이디 써 주세요.");
		document.frm.user_id.focus();
	
	return false;
	}
	
	if(document.frm.user_id.value.length < 4){
		alert("아이디 4글자 이상이어야 합니다.");
		document.frm.user_id.focus();
	
	return false;
	}
	
	if(document.frm.user_pw.value == ""){
		alert("암호는 반드시 입력해야 합니다.");
		document.frm.user_pw.focus();
	
		return false;
	}
	
	if(document.frm.user_pw.value != document.frm.pwd_check.value){
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd_check.focus();
	
		return false;
	}
	
	if(document.frm.reid.value.length == 0){
		alert("중복 체크를 하지 않았습니다.");
	    document.frm.user_id.focus();
	
	    return false;
	}
	
	return true;
}














