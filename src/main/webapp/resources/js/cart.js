/**
 * cart.js -> cart.jsp
 */
console.log("...cart.js 실행중....");

$(document).ready(function() {

	$("#checkAll").on("click", function() {// 전체 선택 체크박스를 선택하였을 때 동작

		if ($('#checkAll').is(':checked')) {//checkAll이 체크가 된다면?
			$("input[name='check']").prop("checked", true);
		} else {
			$("input[name='check']").prop("checked", false);
		}
	});//#checkAll end

	$("input[name='check']").on("click", function() {// 개별 체크박스를 선택하였을때 동작

		var total = $("input[name='check']").length;
		var checked = $("input[name='check']:checked").length;

		if (total != checked) {
			$("#checkAll").prop("checked", false);
		} else {
			$("#checkAll").prop("checked", true);
		}
	});// "input[name='check']" end
	// 전체 선택 -> 아래 개별 선택을 true 아니면 false
	// 개별선택 다 하면 전체 선택 체크 아니면 체크해제

	$("#clearCart").on("click", function() {//카트 비우기(전체삭제) 클릭 하였을 때 동작

		var cartid = $("#cart_id").val();
		console.log("cartid : " + cartid);

		$.ajax({
			url: '/library/clearCart/' + cartid,
			type: 'delete',
			success: function(result, status, xhr) {
				console.log("result 값은 ?" + result);
			}
		});// ajax end

		alert('전체 삭제가 되었습니다.');
		location.replace('/library/home');

		//	clearCart 누르면 전체 삭제가 되고 "전체 삭제 되었습니다." 
		//	알럿창 띄우고 메인 페이지 이동
	});// #clearCart end

	$(".deleteCart").on("click", function(e) {//삭제 버튼 눌렀을 때 동작
		var target = $(this).parent().parent();
		var cartid = $("#cart_id").val();
		var isbn13 = $(target).find("input[name='book']").val();

		console.log("cartid : " + cartid);
		console.log("isbn13 : " + isbn13);

		cartService.deleteOne(cartid, isbn13, function(result) {

			if (result == "success") {
				alert("삭제 되었습니다.");
				target.remove();
			} else {
				alert("삭제 실패.");
			}

		});// #deleteCart end
	});

// 1. 예약 확정 버튼 눌렀을 때 1.체크가 0이면 예약할 도서 선택하라고 알럿
// 2. 도서 3권이상이면 알럿으로 예약은 3권까지 가능하다고 띄우기
// 3. 둘다 아니면 -> 체크한 tr을 찾아서 isbn + userid 를 컨트롤러에게 보낸다.

	$("#rsBtn").on("click", function(){
		
		var check = $("input[name='check']:checked").length;
		
		if(check==0){
			alert("예약할 도서를 선택하세요!");
		
		}else if(check>3){			
			alert("3권까지 예약 할 수 있습니다.");
			
		}else{
			cartData.bookData();
			var sendData = $("#bookData").val();
			cartService.rsButton(sendData, function(result){
				
				cosole.log(result);
				
			});		
			alert("예약이 확정됐습니다.");
		}
		
		
	});


});//  $(document).ready END

//체크박스에 체크한 행 데이터 보내기
	
//ajax로 보내기
var cartData = (function(){
	
	//배열형태로 책 데이터 넣기
	function bookData(){
		
		var books = [];
		var checkedTr = $("#tableBody tr").find("input[name='check']:checked");
		var user = $("#user_id").val();
		
		
		checkedTr.each(function(index, item){
			var data = $(item).find("input[name='book']").val();
			var json = {"user_id":user, "isbn13":data};
			books.push(json);
		});
		
		$("#bookData").val(JSON.stringify(books));
	}
	return{
		bookData:bookData
	};
})();

var cartService = (function() {// ready가 아닌 이렇게 선언해버리면 즉시 실행된다.

	function deleteOne(cartid, isbn13, callback, error) {// 개별 삭제 했을 때의 함수

		$.ajax({
			url: '/library/deleteCart/' + cartid + '/' + isbn13,
			type: 'delete',
			success: function(result, status, xhr) {
				console.log("결과 값은 ? " + result);				

				if (callback) {
					callback(result);
				}
			}, // sussess 종료

			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}//  error if 종료 
			}// error 종료			
		});// ajax end

	}// function end
	
	// 예약 확정(컨트롤러에게 전송)
	function rsButton(sendData, callback, error){
		
		$.ajax({
			url:'/library/inserRs',
			type:'post',
			data : sendData,	 // Json으로 받아서 객체로 넘긴다.
			contentType : "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				console.log("결과 값은 ? " + result);				

				if (callback) {
					callback(result);
				}
			}, // sussess 종료

			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}//  error if 종료 
			}// error 종료
			
		});// $.ajax end
	}// function rsButton end

	return {
		deleteOne: deleteOne,
		rsButton: rsButton
	};// return end
})();// cartService = (function() end