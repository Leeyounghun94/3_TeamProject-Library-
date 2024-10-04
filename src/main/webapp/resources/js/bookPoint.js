/**
 *  댓글 ajax 처리용 javaScript 파일 입니다.
 */

console.log('요청 청도서 ajax 실행.....');

var boardPointService = (function() {
      
      
      // 포인트 값 업데이트 (로그 기록 삭제)
      function updatePoint(bookPointUpdate, callback, error){
	  	
	  	$.ajax({
		type : 'put',
		url : '/library/asd/' + bookPointUpdate.PointRno,
		data : JSON.stringify(bookPointUpdate),
		contentType : 'application/json; charset=utf-8',
		success : function(result, status, xhr){
        // result : 결과 (성공시 result를 반환하여 동작이 마무리.)
        // status : 200 | 500
        // xhr : xmlHttpRequest 객체(서블릿에서 요청 객체와 유사함.)
           if(callback){ // callback = true 면 아래 코드 실행
                  callback(result);
               } // 콜백 종료
            }, // success 종료
		 error : function(xhr, status, er){
			if(error){
				error(er);
			}
		}// error 종료
	}) // ajax 종료
	
	}// function update 종료
	
		function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	
      
      return {
	 	updatePoint : updatePoint,
	 	displayTime : displayTime
	 	
	  };
     })(); // 변수 생성
