function loginCheck(){
	var userId = $('input[name="userId"]').val();
	var userPw = $('input[name="userPw"]').val();
	var rememberId = $('#rememberId:checked').val();
	
	if(rememberId == 'on') {
		localStorage.setItem("saveId", userId);
	}
}