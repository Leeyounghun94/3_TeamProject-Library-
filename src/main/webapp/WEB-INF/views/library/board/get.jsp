<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/styles/news_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/news_responsive.css">



<!-- Home -->

<div class="home">
	<div class="home_background_container prlx_parent">
		<div class="home_background prlx"
			style="background-image: url(/resources/images/news_background.jpg)"></div>
	</div>
	<div class="home_content">
		<h1>The News</h1>
	</div>
</div>


<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>



<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li { /* 사진을 감싸고 있는 테두리 */
	list-style: none;
	padding: 10px; /* 상하 두께 */
	align-content: center;
	text-align: center;
}

.uploadResult ul li img { /* 썸네일 이미지의 크기 */
	width: 350px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img { /* 사진을 클릭했을때 보여주는 이미지 */
	width: 600px;
}

.likeResult li img { /* 썸네일 이미지의 크기 */
	width: 30px;

}

.svg-heart-container{
	cursor : pointer;
}


ul.chat li{
 display: inline-block;
    width: 100%;
    height: 60px;
    border-bottom: 1px solid gray;
}

ul.adminChat li{
 display: inline-block;
    width: 100%;
    height: 60px;
    border-bottom: 1px solid gray;
}



/* 관리자 표시 */
.button {
  width: fit-content;
  display: flex;
  padding: 0.5em 0.2rem;
  cursor: pointer;
  gap: 0.4rem;
  font-weight: bold;
  border-radius: 20px; /* 테두리 둥글기 */
  text-shadow: 2px 2px 3px rgb(136 0 136 / 50%);
  background: linear-gradient(15deg, #880088, #aa2068, #cc3f47, #de6f3d, #f09f33, #de6f3d, #cc3f47, #aa2068, #880088) no-repeat;
  background-size: 100%;
  color: #fff;
  border: none;
  background-position: left center;
  box-shadow: 0 30px 10px -20px rgba(0,0,0,.2);
  transition: background .5s ease;
}

.button:hover {
  background-size: 320%;
  background-position: right center;
}

.button:hover svg {
  fill: #fff;
}

.button svg { /* 왕관 크기 */
  width: 23px;
  fill: #f09f33;
  transition: .3s ease;
}



</style>

<!-- News -->

<div class="news">
	<div class="container">
		<div class="row">

			<!-- News Column -->

			<div class="col-lg-8">

				<div class="news_posts">

					<!-- 이미지 나오던 곳 -->
					<!-- 업로드한 이미지가 들어가는 장소 -->
					<div class="news_post">

						<div class='uploadResult'>
							<ul>
							</ul>
						</div>

						<div class="news_post">
							<div class="news_post_image"></div>
							<div class="news_post_top d-flex flex-column flex-sm-row">
								<div class="news_post_date_container">
									<div
										class="news_post_date d-flex flex-column align-items-center justify-content-center">
										<div>
											<c:out value="${board.bno }" />
										</div>
										<div>글번호</div>
									</div>
								</div>
								<div class="news_post_title_container">
									<div class="news_post_title">
										<h1>
											<c:out value="${board.title }" />
										</h1>
									</div>
									<div class="news_post_meta">
										<span class="news_post_comments">작성자</span> <span>|</span> <span
											class="news_post_author"><c:out
												value="${board.nickName}" /></span> <span>|</span> <span
											class="news_post_comments"><c:out
												value="${board.regdate}" /></span> <span>|</span> <span
											class="news_post_comments">조회수 : <c:out
												value="${board.viewNum}" /></span> <span>|</span> <span
											class="news_post_comments">좋아요 : <c:out 
												value="${board.likeNum}" /> </span>
									</div>
								</div>
							</div>
							<div class="news_post_text">
								<p>
									<c:out value="${board.content}" />
								</p>
							</div>
							
							<!-- 좋아요 버튼 -->
							<div class='svg-heart-container-div'>
								<i class="svg-heart-container"></i>
								
								<span> <- 좋아요버튼</span>
							</div>
							
							<div class='row'>
								<div class="col-lg-12">
									<!-- /.panel -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<i class="fa fa-comments fa-fw"></i> 댓글
											<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button>
											<button data-oper='modify' class="btn btn-default">글수정</button>
											<button data-oper='list' class="btn btn-info">목록</button>
											<span class='adminBtn'><!-- 히든 버튼이 나올 창 -->
											</span>
										</div>

										<!-- /.panel-heading -->
										<br>
										<div class="panel-body"><!-- 댓글이 작성되는 창 -->
											<ul class="adminChat"><!-- 운영자가 답글을 작성하면 입력되는 칸 -->
											</ul>
											<br><br>
											<ul class="chat">
											</ul>
											<!-- ./ end ul -->
										</div>
										<!-- /.panel .chat-panel -->

										<div class="panel-footer"></div>
									</div>
								</div>
							</div><!-- ./ end row -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

 <form id='operForm' action="/library/board/modify" method="get">
	<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword'	value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='hidden' id='category' name='category' value='<c:out value="${board.category}"/>'><!-- 게시판별 카테고리 구별 2024 09 28 -->
</form>

<!-- 댓글 좋아요 눌렀을 때 -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
			</div>
			
			<div class="modal-body"> <!-- 댓글 작성을 누르면 나오는 창 -->
				<div class="form-group">
					<label>댓글 내용</label> <input class="form-control" name='reply'>
				</div>
				<div class="form-group">
					<label>닉네임</label> <input type=text class="form-control" name='replyer' value='<c:out value="${user.nickName}"/>' readonly>
				</div>

				<div class="form-group">
					<label>Reply Date</label> <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
				</div>
				<!-- 댓글 작성자 아이디 입력 2024 09 29 -->
				<div class="form-group">
					<label>아이디체크</label> <input type='hidden' class="form-control" name='replyerUserId' value='<c:out value="${user.id}"/>' readonly>
				</div>
			</div> <!-- end 댓글 작성을 누르면 나오는 창 -->
			<!-- end modal body 2024 09 29 -->
			
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script type="text/javascript" src="/resources/js/reply.js">
	/* 외부파일 include 용 */
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<!-- JQuery 사용 -->

<script>
	$(document).ready(function() {
						
						
						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");
						var replyULAdmin = $(".adminChat");
					    var authorityValue = '<%=session.getAttribute("userAuthority") != null ? session.getAttribute("userAuthority") : "" %>' ; // 세션 계정 등급 확인

						showList(1); // 댓글 리스트를 보여줌
						likeCheck(); // 좋아요 함수 호출
						adminCheck(); // 관리자 로그인 체크
						
						
						// 댓글 리스트를 출력할 때, 관리자 댓글은 adminChat에 출력
						function showList(page) {
						    console.log("show list " + page);

						    replyService.getList({
						        bno: bnoValue,
						        page: page || 1
						    }, function(replyCnt, list) {
						        console.log("replyCnt: " + replyCnt);
						        console.log("list: " + list);

						        var userStr = "";
						        var adminStr = "";

						        if (list == null || list.length == 0) {
						            return;
						        }

						        // 댓글 목록 출력
						        for (var i = 0, len = list.length || 0; i < len; i++) {
						            var replyHtml = "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						            replyHtml += "<div class='replyBox'><strong class='primary-font'>" + list[i].replyer + "</strong>";
						            replyHtml += "<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small>";
						            replyHtml += "<small class='editDelReply'>&nbsp&nbsp&nbsp&nbsp수정/삭제</small>"; 
						            replyHtml += "<input type='hidden' class='replyerUserId' value='"+list[i].replyerUserId+"'>";  // 수정
						            replyHtml += "<p>" + list[i].reply + "</p></div></li>";
						            
						            var adminHtml = "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
						            adminHtml += "<div class='replyBox'>";
						            adminHtml += "<span class='button'>";
						            adminHtml += "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 36 24'>";
						            adminHtml += "<path d='M18 0l8 12 10-8-4 20H4L0 4l10 8 8-12z'></path>";
						            adminHtml += "</svg>관리자</span>";
						            adminHtml += "<span>" + list[i].reply + "</span></div></li>";
						            
						            // 관리자인 경우 adminChat에 출력
						            if (list[i].authority) {
						                adminStr += adminHtml;
						            } else {
						                userStr += replyHtml;
						            }
						        }

						        // 일반 유저 댓글은 .chat에, 관리자 댓글은 .adminChat에 출력
						        $(".chat").html(userStr);
						        
						        $(".adminChat").html(adminStr);

						        showReplyPage(replyCnt);
						    });
						}
						

						//게시글 좋아요 관련 코드
							

						//< %=session.getAttribute("UserId")%> 이 방법은 서버 사이드에서 세션 값을 받아오지만, 자바스크립트에서는 이를 텍스트로 처리합니다. 만약 세션 값이 존재하지 않으면 빈 문자열이 아닌 "null" 또는 "undefined"와 같은 문자열로 처리될 가능성이 있습니다.

					function likeCheck() { // 좋아요 체크 (빈하트 / 찬하트)
					    var likeChk = '<c:out value="${likeChk.userId}"/>'; // DB에서 받은 likeChk 값
					    var likeSessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>'; // 세션의 유저 ID
					    console.log("아이디 체크 DB = " + likeChk);
					    console.log("아이디 체크 세션 = " + likeSessionUserId);
					
					    var likeImg = $(".svg-heart-container");
					    var str = ""; // 함수 호출시 마다 초기화
					
					    if (likeChk === likeSessionUserId) { // DB의 아이디와 세션의 아이디 비교
					        console.log("찬하트 아이디 체크 DB = " + likeChk);
					        console.log("찬하트 아이디 체크 세션 = " + likeSessionUserId);
					
					        // 찬 하트
					        str = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-heart-fill' viewBox='0 0 16 16'>";
					        str += "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>";
					        str += "</svg>";
					
					    } else { // 좋아요가 아닌 경우 빈 하트
					        console.log("빈하트 아이디 체크 DB = " + likeChk);
					        console.log("빈하트 아이디 체크 세션 = " + likeSessionUserId);
					
					        // 빈 하트
					        str = "<svg viewBox='0 0 24 24' width='30' height='30' class='svg-outline' xmlns='http://www.w3.org/2000/svg'>";
					        str += "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15'/>";
					        str += "</svg>";
					    }
					
					    likeImg.html(str); // 결과 출력
					} // end likeCheck()
						
							
						$(".svg-heart-container").on("click", function(e){ // 좋아요 버튼을 누르면 LikeVO 테이블에 bno와 userId가 저장됨.
		
							var likeSessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>';
							var likeBno = '<c:out value="${board.bno}"/>';
							var likeChk = '<c:out value="${likeChk.userId}"/>';
							// model을 통해 들어온 likeChk 값을 받음,  bno는 list로 부터 전달 받음 list 자바 스크립트 .move쪽에서 넘어옴

							if(!likeSessionUserId || likeSessionUserId.trim() === "" ){
								console.log("로그인 아이디 확인 : "+likeSessionUserId); 
								console.log("컨트롤러에서 가져온아이디 : "+likeChk); 
								console.log("번호 가져오는지 : "+likeBno);
								
								alert("로그인 먼저 진행해 주세요.");
								return false;
								
							}else if (likeSessionUserId != likeChk){ // 좋아요 없을 경우 (빈 하트 일 경우) 
							$.ajax({
								url: '/library/likeUp', // boardController 의 likeUp 호출
								data: {likeUserId : likeSessionUserId, bno : likeBno}, // 각각 변수 대입
								dataType:'text', // 데이터 타입
								type:'POST', //POST 방식 
								success: function(){
								console.log("좋아요 업 성공"); 
								location.reload(); // 페이지 자동 새로고침
								
								 }
							}); // end ajax
							
							}else if (likeSessionUserId == likeChk){ // 좋아요 된 경우(색칠 하트일 경우)
								$.ajax({
								url: '/library/likeDown', // boardController 의 likeDown 호출
								data: {likeUserId : likeSessionUserId, bno : likeBno}, // 각각 변수 대입
								dataType:'text', // 데이터 타입
								type:'POST', //POST 방식 
								success: function(){
								console.log("좋아요 다운 성공"); 
								location.reload(); // 페이지 자동 새로고침
								
								 }
							}); // end ajax
								
								
							}// end else if 
							
						}); // end click like Btn function
						

						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) { // 댓글 페이징

							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;

							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}

							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class='pagination pull-right'>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1) + "'>Previous</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {

								var active = pageNum == i ? "active" : "";

								str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}

							str += "</ul></div>";

							console.log(str);

							replyPageFooter.html(str);
						} // end showReplyPage

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");

							var targetPageNum = $(this).attr("href");

							console.log("targetPageNum: " + targetPageNum);

							pageNum = targetPageNum;

							showList(pageNum);
						});

						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal.find("input[name='replyer']");
						var modalInputReplyerUserId = modal.find("input[name='replyerUserId']");// 유저 아이디 체크용 2024 09 29
						var modalInputReplyDate = modal.find("input[name='replyDate']");
						

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#modalCloseBtn").on("click", function(e) {

							modal.modal('hide');
						});

						$("#addReplyBtn").on("click", function(e) { // 댓글 작성 창을 보여줌
							
						    var loginSessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>'; // 세션의 유저 ID
						    console.log(loginSessionUserId);
							if(!loginSessionUserId || loginSessionUserId.trim() === ""){
								alert("로그인 먼저 진행해 주세요.");
								return false;
							}else{
								
							//modal.find("input").val(""); // input val을 초기화를 삭제 하여 value값 정상 입력 2024 09 29
							
							modalInputReplyDate.closest("div").hide(); // 작성일.hide()
							modal.find("button[id !='modalCloseBtn']").hide();// close 누르면 hide()

							modalRegisterBtn.show();

							$(".modal").modal("show");
							}

						});
						
						function adminCheck() {
						    var loginSessionUserAuthority = '<%=session.getAttribute("userAuthority") != null ? session.getAttribute("userAuthority") : "" %>' ; // 세션 계정 등급 확인
						    console.log("userAuthority 값: ", loginSessionUserAuthority);
						    var adminBtn = $(".adminBtn");

						    if (loginSessionUserAuthority === '1') { // 관리자 권한이 '1'일 경우
						    	console.log("userAuthority 값: ", loginSessionUserAuthority);
						        var str = "<button id='addReplyAdmin' class='btn btn-primary btn-xs pull-right'>관리자 답변</button>";

						        // 관리자가 댓글 작성할 수 있도록 버튼을 표시
						        adminBtn.html(str);
						        
						        // 관리자 댓글 작성 버튼 클릭 이벤트
						        $("#addReplyAdmin").on("click", function(e) {
						            modal.find("input").val(""); // 입력창 초기화
						            modalInputReplyDate.closest("div").hide(); // 작성일 필드를 숨김
						            modal.find("button[id !='modalCloseBtn']").hide(); // 닫기 버튼 제외한 다른 버튼 숨김

						            modalRegisterBtn.show(); // 등록 버튼 표시
						            
						            $(".modal").modal("show"); // 모달 창 열기
						        });
						        
								//관리자 댓글 조회 클릭 이벤트 처리 
								$(".adminChat").on("click","li",function(e) {

									var rno = $(this).data("rno");

									replyService.get(rno, function(reply) {

										modalInputReply.val(reply.reply);
										modalInputReplyer.val(reply.replyer);
										modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly",	"readonly");
										modal.data("rno", reply.rno);
										modal.find("button[id !='modalCloseBtn']").hide();
										modalModBtn.show();
										modalRemoveBtn.show();
										$(".modal").modal("show");
									});
							});

						    } else {
						        return; // 권한이 없으면 아무것도 하지 않음
						    }
						}
						
						modalRegisterBtn.on("click", function(e) { // modal에서 register를 눌렀을때 작동

							var reply = { // modal 입력창에서 받은 갑 입력
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								replyerUserId : modalInputReplyerUserId.val(), // 유저 아이디 추가 2024 09 29
								bno : bnoValue,
								authority : authorityValue // 권한도 넘어가게 함.

								
							};
						
							replyService.add(reply, function(result) {

								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								//showList(1);
								showList(-1);

							});

						});
						
						//댓글 수정/삭제 버튼 클릭 
							$(".chat").on("click", ".editDelReply", function(e){
							
							
							var SessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>';
							var sessionAuthority = '<c:out value = "${user.authority}"/>';
							if(!SessionUserId || SessionUserId.trim() === "" ){
								
								alert("로그인 먼저 진행해 주세요.");
								
								return false;
							}else{
								var CreplyerUserId = $(this).closest("li").find(".replyerUserId").val();  // 수정
							        console.log("CreplyerUserId 값 확인 : " + CreplyerUserId);
								
								if(SessionUserId == CreplyerUserId || sessionAuthority == '1'){
									
									//var rno = $(this).data("rno");
									var rno = $(this).closest("li").data("rno");

									replyService.get(rno, function(reply) {

											modalInputReply.val(reply.reply);
											modalInputReplyer.val(reply.replyer);
											modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly",	"readonly");
											modal.data("rno", reply.rno);
											modal.find("button[id !='modalCloseBtn']").hide();
											modalModBtn.show();
											modalRemoveBtn.show();
											$(".modal").modal("show");
									});// end replyService.get
									
								}else{
									alert("댓글 작성자만 수정 가능합니다.");
									return false;
								}//end inside else
								
							}//end outside else
								
						});// end .chat on click
						

						modalModBtn.on("click", function(e) {

							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val()
							};

							replyService.update(reply, function(result) {

								alert(result);
								modal.modal("hide");
								showList(pageNum);

							});

						});

						modalRemoveBtn.on("click", function(e) {

							var rno = modal.data("rno");

							replyService.remove(rno, function(result) {

								alert(result);
								modal.modal("hide");
								showList(pageNum);

							});

						});

					});
</script>





<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			
		//아이디 체크
			var SessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>';
			var boardUserId = '<c:out value="${board.boardUserId}"/>';
			
			if(SessionUserId != boardUserId ){
				
				alert("로그인 하거나 아이디를 확인해주세요.");
				
				return false;
				
			}else{
		
			operForm.attr("action", "/library/board/modify").submit();
			}

		});

		$("button[data-oper='list']").on("click", function(e) { // category 별 리스트 되돌아가기 변경 
			
			var listTypeCheck = '<c:out value="${board.category}"/>'; // 게시글의 카테고리 체크
			
			   switch(listTypeCheck) {
		        case '자유':
		            operForm.find("#bno").remove();
		            operForm.attr("action", "/library/listFree");
		            operForm.submit();
		            break;

		        case 'QnA':
		            operForm.find("#bno").remove();
		            operForm.attr("action", "/library/listQnA");
		            operForm.submit();
		            break;

		        default:
		            operForm.find("#bno").remove();
		            operForm.attr("action", "/library/list");
		            operForm.submit();
		            break;
		    }

		});
	});
</script>


<script>
	$(document).ready(function() {( function() {

							var bno = '<c:out value="${board.bno}"/>';

							$.getJSON("/library/getAttachList",{ bno : bno }, function(arr) { // getAttachList를 bno 조건을 통해 가져옴

							console.log("arr 이 뭔지 확인 : "+arr);

							var str = "";

							$(arr).each(function(i,	attach) {

							//image type
								if (attach.fileType) { // 이미지 파일의 경우 썸네일을 출력
								var fileCallPath = encodeURIComponent(attach.uploadPath	+ "/s_"	+ attach.uuid+ "_" + attach.fileName);

									str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									str += "<img src='/display?fileName="+ fileCallPath	+ "'>";
									str += "</div>";
									str	+ "</li>";

								} else { // 아닐 경우 파일 그림 출력
	
									str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									str += "<span> "+ attach.fileName+ "</span><br/>";
									str += "<img src='/resources/img/attach.png'></a>";
									str += "</div>";
									str	+ "</li>";
									}
								});

								$(".uploadResult ul").html(str);

								});//end getjson

								})();//end function

						$(".uploadResult").on("click", "li", function(e) {

									console.log("view image");

									var liObj = $(this);

									var path = encodeURIComponent(liObj.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));

									if (liObj.data("type")) {
										showImage(path.replace(
												new RegExp(/\\/g), "/"));
									} else {
										//download 
										self.location = "/download?fileName=" + path
									}

								});

						function showImage(fileCallPath) { // 페이지 상단에 이미지 썸네일 출력

							alert(fileCallPath);

							$(".bigPictureWrapper").css("display", "flex").show();

							$(".bigPicture").html(
									"<img src='/display?fileName="
											+ fileCallPath + "' >").animate({
								width : '100%',
								height : '100%'
							}, 1000);

						}// end showImage

						$(".bigPictureWrapper").on("click", function(e) { // 이미지 클릭시 원본 이미지 출력
							$(".bigPicture").animate({
								width : '0%',
								height : '0%'
							}, 1000);
							setTimeout(function() {
								$('.bigPictureWrapper').hide();
							}, 1000);
						});

					});// end $(".bigPictureWrapper").on("click", function(e)
</script>


<%@include file="../../includes/footer.jsp"%>
