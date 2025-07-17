/**
 * join.js
 */


// onsubmit 시
function signInCheck(){
	
}

// ID 중복 확인
function confirmId(){
	
}

// 이메일 셀렉박스 값 변경시 
function selectEmailChk(){
	if(document.inputform.user_email3.value == "0"){
		document.inputform.user_email2.value = "";
		console.log(document.inputform.user_email2.value);
		document.inputform.user_email2.focus();
		return false;
	}else{
		document.inputform.user_email2.value = document.inputform.user_email3.value;
		console.log(document.inputform.user_email2.value);
		return false;
	}
}