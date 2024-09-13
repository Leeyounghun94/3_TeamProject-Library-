<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/styles/news_styles.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/styles/news_responsive.css"> -->

<style>
  .home2{
      width : 100%;
      height : 50vh;
   }
 .panel-body{
 	/* background-color:black; */
 	width:90%;
 	
 }
 .text{
    width: 250px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
</style>

	<!-- Home --><!-- 백그라운드 이미지 안나옴 -->

   <div class="home2">
      <div class="home_background_container prlx_parent">
         <div class="home_background prlx" style="background-image:url(/resources/images/courses_background.jpg)"></div>
      </div>
      <div class="home_content">
         <h1><b>게시판</b></h1>
      </div>
   </div>
	
	

	
	<!-- Popular -->

	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>게시판</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->
	
							
	<div class="col-lg-12">
		<div class="panel panel-default" style="padding-left:10%;">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">새 게시글 등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead align="center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board"> <!-- 리스트 처리 하겠다. -->
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" /> <b>[  <c:out value="${board.replyCnt}" />  ]</b>
							</a></td>
							<td><c:out value="${board.category}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
							<td><c:out value="${board.viewNum}" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 검색 조건 관련 -->
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/list" method='get' align="end">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>닉네임</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> 
							<input type='text' class="text" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-warning'>검색</button>
						</form>
					</div>
				</div>
				<!-- 페이징 처리 관련 -->
				<div class='news_page_nav'>
					<ul class="pagination" style="align-items:center;">

						 <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous text-center"><a href="${pageMaker.startPage -1}">이전</a></li>
						</c:if> 

						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button text-center ${pageMaker.cri.pageNum == num ? 'active':''} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						 <c:if test="${pageMaker.next}">
							<li class="paginate_button next text-center"><a href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if> 


					</ul>
				</div>
				<!--  end Pagination -->
			</div>
			<!-- endpanel-heading -->

			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>
							
					


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->
			

<!-- Java Script -->
<script type="text/javascript">
	$(document).ready(function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						}); // 새 게시글 등록

						var actionForm = $("#actionForm");

						$(".paginate_button a").on("click",	function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click", function(e) {

											e.preventDefault();
											actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
											actionForm.attr("action", "library/board/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>





<%@include file="../includes/footer.jsp"%>
<!-- Footer -->
