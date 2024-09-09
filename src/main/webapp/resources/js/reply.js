/**
 *  댓글 ajax 처리용 javaScript 파일 입니다.
 */

console.log('댓글용 모듈 실행중.....');

var replyService = (function() {
      
      function add(reply, callback, error){ // 외부에서 replyService.add(객체, 콜백)을 전달함
         console.log("댓글 추가용 함수....");
         
         $.ajax({
            type : 'post', // @PostMapping
            url : '/replies/new', // http://localhost:80/replies/new
            data : JSON.stringify(reply), // Json으로 받아 객체로 넘김
            contentType : 'application/json; charset=utf-8',
            success : function(result, status, xhr){
               // result : 결과
               // status : 200 | 500
               // xhr : xmlHttpRequest 객체(서블릿에서 요청 객체와 유사함.)
               if(callback){ // callback = true 면 아래 코드 실행
                  callback(result);
               } // 콜백 종료
            }, // success 종료
            error : function(xhr, status, er){
               if(error){
                  error(er)
               } // 에러 ir 종료
            } // error 종료
         }) // ajax 종료
      } // function add 종료
      
	function getList(param, callback, error) {

	    var bno = param.bno;
	    var page = param.page || 1;
	    
	    $.getJSON("/replies/pages/" + bno + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	            callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }
	

	// 댓글 삭제
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			}, // success 종료
			error : function(xhr, status, er){
				if (error){
					error(er);
				}// error ir 종료
			} // error 종료
		}) // ajax 종료
	} // function remove 종료
      
      // 댓글 수정
      function update(reply, callback, error){
	  	console.log("RNO: " + reply.rno);
	  	
	  	$.ajax({
		type : 'put',
		url : '/replies/' + reply.rno,
		data : JSON.stringify(reply),
		contentType : 'application/json; charset=utf-8',
		success : function(result, status, xhr){
        // result : 결과
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
	
	// 특정 번호 댓글 조회 처리
	function get(rno, callback, error){
		
		$.get("/replies/" + rno + ".json", function(result){
			
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	} // function get 종료
	
	// 시간 처리
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
	 	add : add,
	 	getList : getList,
	 	remove : remove,
	 	update : update,
	 	get : get,
	 	displayTime : displayTime
	 	
	  };
     })(); // 변수 생성
