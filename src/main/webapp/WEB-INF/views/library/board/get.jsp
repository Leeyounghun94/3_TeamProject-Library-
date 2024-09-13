<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/resources/styles/news_styles.css">
<link rel="stylesheet" type="text/css"
	href="/resources/styles/news_responsive.css">



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
											class="news_post_comments">좋아요 : 구현중</span>

									</div>
								</div>
							</div>
							<div class="news_post_text">
								<p>
									<c:out value="${board.content}" />
								</p>
							</div>
							<!-- 좋아요 이미지 출력되는 칸 -->
							<div class="like-body"> 
								<ul class="likeResult">

								</ul>
								<button data-oper='likeBtn' class="likeBtn btn-default">좋아요</button>
								 session id : ${userId} <c:out value="${userId}" />
								 <c:out value="${userId}" />
							</div>

							<button data-oper='modify' class="btn btn-default">글수정</button>
							<button data-oper='list' class="btn btn-info">목록</button>

							<div class='row'>

								<div class="col-lg-12">

									<!-- /.panel -->
									<div class="panel panel-default">
										<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

										<div class="panel-heading">
											<i class="fa fa-comments fa-fw"></i> Reply
											<button id='addReplyBtn'
												class='btn btn-primary btn-xs pull-right'>New Reply</button>
										</div>


										<!-- /.panel-heading -->
										<div class="panel-body">

											<ul class="chat">

											</ul>
											<!-- ./ end ul -->
										</div>
										<!-- /.panel .chat-panel -->

										<div class="panel-footer"></div>


									</div>
								</div>
								<!-- ./ end row -->
							</div>


						</div>

					</div>

				</div>

			</div>

		</div>

	</div>
</div>

<form id='operForm' action="/library/board/modify" method="get">
	<input type='hidden' id='bno' name='bno'
		value='<c:out value="${board.bno}"/>'> <input type='hidden'
		name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input
		type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword'
		value='<c:out value="${cri.keyword}"/>'> <input type='hidden'
		name='type' value='<c:out value="${cri.type}"/>'>
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
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name='reply'
						value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name='replyer'
						value='replyer'>
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control"
						name='replyDate' value='2018-01-01 13:13'>
				</div>

			</div>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<!-- JQuery 사용 -->

<script>
	$(document).ready(function() {

						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");

						showList(1);
						likeCheck(); // 좋아요 함수 호출
						
						function showList(page) {

							console.log("show list " + page);

							replyService.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {

												console.log("replyCnt: "
														+ replyCnt);
												console.log("list: " + list);
												console.log(list);

												if (page == -1) {
													pageNum = Math
															.ceil(replyCnt / 10.0);
													showList(pageNum);
													return;
												}

												var str = "";

												if (list == null || list.length == 0) {
													return;
												}
												//댓글 작성되면 나오는 칸 관련
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
													str += "  <div class='replyBox'><strong class='primary-font'>["
															+ list[i].rno
															+ "] "
															+ list[i].replyer
															+ "</strong>";
													str += "    <small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].replyDate)
															+ "</small>";
													str += "    <p>"
															+ list[i].reply
															+ "</p></div></li>";
												}

												replyUL.html(str);

												showReplyPage(replyCnt);

											});//end function

						}//end showList
						

						//게시글 좋아요
						
						
						
						var likeChk = '<c:out value="${likeChk.bno}"/>'; // model을 통해 들어온 likeChk 값을 받음,  bno는 list로 부터 전달 받음 list 자바 스크립트 .move쪽에서 넘어옴
						// 아이디까지 체크하는 것이 필요함.

						function likeCheck() {// 좋아요 체크 (빈하트 / 찬하트)
							console.log("번호 체크2---- " + likeChk);
							
							var likeImg = $(".likeResult");
							var str = ""; // 함수 호출시 마다 초기화

							if (likeChk == null || likeChk === '') { // 뭔가 값이 들어있을 경우.
								// 특정 문장을 찍어내서 색있는 하트를 이미지를 출력해야함
								str = "<li>빈 하트</li>";
							} else if (parseInt(likeChk) >= 0) { // 그렇지 않을 경우 좋아요를 누르지 않았다 판정 > 빈하트
								
								str = "<li>꽉찬 하트</li>";
								
							}
							
							likeImg.html(str); // 결과를 출력
						} //end likeCheck()
						
							
						$("button[data-oper='likeBtn']").on("click", function(e){ // 좋아요 버튼을 누르면 LikeVO 테이블에 bno와 userId가 저장됨.
		
							var likeUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>';
							//< %=session.getAttribute("UserId")%> 이 방법은 서버 사이드에서 세션 값을 받아오지만, 자바스크립트에서는 이를 텍스트로 처리합니다. 만약 세션 값이 존재하지 않으면 빈 문자열이 아닌 "null" 또는 "undefined"와 같은 문자열로 처리될 가능성이 있습니다.
							var likeBno = '<c:out value="${board.bno}"/>';
							
							if(likeUserId || likeUserId.trim() === ""){
								alert("로그인 먼저 진행해 주세요.");
								return false;
							}else{
							$.ajax({
								url: '/likeUp', // boardController 의 likeUp 호출
								data: {userId : likeUserId, bno : likeBno}, // 각각 변수 대입
								dataType:'text', // 데이터 타입
								type:'POST', //POST 방식 
								 success: function(likeResult){
									 console.log(result); 
								 }
							}); // end ajax
							
							}// end else
							
						});
						
						

						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) {

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
										+ (startNum - 1)
										+ "'>Previous</a></li>";
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
						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");

							var targetPageNum = $(this).attr("href");

							console.log("targetPageNum: " + targetPageNum);

							pageNum = targetPageNum;

							showList(pageNum);
						});


						/*     function showList(page){
						
						 replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
						
						 var str="";
						 if(list == null || list.length == 0){
						
						 replyUL.html("");
						
						 return;
						 }
						 for (var i = 0, len = list.length || 0; i < len; i++) {
						 str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
						 str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
						 str +="    <p>"+list[i].reply+"</p></div></li>";
						 }


						 replyUL.html(str);

						 });//end function
						
						 }//end showList */

						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#modalCloseBtn").on("click", function(e) {

							modal.modal('hide');
						});

						$("#addReplyBtn").on("click", function(e) {

							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide();
							modal.find("button[id !='modalCloseBtn']").hide();

							modalRegisterBtn.show();

							$(".modal").modal("show");

						});

						modalRegisterBtn.on("click", function(e) {

							var reply = {
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								bno : bnoValue
							};
							replyService.add(reply, function(result) {

								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								//showList(1);
								showList(-1);

							});

						});

						//댓글 조회 클릭 이벤트 처리 
						$(".chat").on("click","li",
										function(e) {

											var rno = $(this).data("rno");

											replyService.get(rno,
													function(reply) {

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

			operForm.attr("action", "/library/board/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/library/list")
			operForm.submit();

		});
	});
</script>


<script>
	$(document)
			.ready(
					function() {

						(function() {

							var bno = '<c:out value="${board.bno}"/>';

							/* $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
							
							  console.log(arr);
							  
							  
							}); *///end getjson
							$
									.getJSON(
											"/library/getAttachList",
											{
												bno : bno
											},
											function(arr) {

												console.log(arr);

												var str = "";

												$(arr)
														.each(
																function(i,
																		attach) {

																	//image type
																	if (attach.fileType) {
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/s_"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<img src='/display?fileName="
																				+ fileCallPath
																				+ "'>";
																		str += "</div>";
																		str
																				+ "</li>";

																	} else {

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<span> "
																				+ attach.fileName
																				+ "</span><br/>";
																		str += "<img src='/resources/img/attach.png'></a>";
																		str += "</div>";
																		str
																				+ "</li>";
																	}
																});

												$(".uploadResult ul").html(str);

											});//end getjson

						})();//end function

						$(".uploadResult").on(
								"click",
								"li",
								function(e) {

									console.log("view image");

									var liObj = $(this);

									var path = encodeURIComponent(liObj
											.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));

									if (liObj.data("type")) {
										showImage(path.replace(
												new RegExp(/\\/g), "/"));
									} else {
										//download 
										self.location = "/download?fileName="
												+ path
									}

								});

						function showImage(fileCallPath) {

							alert(fileCallPath);

							$(".bigPictureWrapper").css("display", "flex")
									.show();

							$(".bigPicture").html(
									"<img src='/display?fileName="
											+ fileCallPath + "' >").animate({
								width : '100%',
								height : '100%'
							}, 1000);

						}

						$(".bigPictureWrapper").on("click", function(e) {
							$(".bigPicture").animate({
								width : '0%',
								height : '0%'
							}, 1000);
							setTimeout(function() {
								$('.bigPictureWrapper').hide();
							}, 1000);
						});

					});
</script>


<%@include file="../../includes/footer.jsp"%>
