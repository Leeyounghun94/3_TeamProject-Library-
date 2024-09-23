<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../../includes/header.jsp" %>
<html>
<style>
.bookDetail *{
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-size: 1rem;
  font-weight: 500; /* 일반 글씨 */
  font-style: normal;
}
.home2 {
  width: 100%;
  height: 50vh;

}
.breadcrumb-btn {
  background: none;
  border: none;
  color: #0D6EFD;
  cursor: pointer;
  text-decoration: underline;
}
.breadcrumb-btn:hover {
  text-decoration: none;
}
.img-thumbnail{
  max-height: 50vh;
}
.bold{
  font-weight: bold;

}

</style>
<head>
    <title>책 상세정보</title>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_styles.css">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_responsive.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
          rel="stylesheet">

</head>


<body>
<div class="home2">
    <div class="home_background_container prlx_parent">
        <div class="home_background prlx2"
             style="background-image:url(/resources/images/courses_background.jpg)"></div>
    </div>
</div>


	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
				<br><br><br><br>		
					<div class="section_title text-center">					
						<h1>도서 예약 신청</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->
	

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h1 class="text-center">
                <c:out value="${bookDetail.book}"/>
            </h1>
            <span class="img">
            <img src="${bookDetail.photo}" class="img-thumbnail" style="margin-left: 40%;" alt="${bookDetail.book}">
        </span>
        </div>
            <div class="row">
                <div class="col-md-12">
                    <dl>
                        <dt>
                            작가
                        </dt>
                        <dd>
                            <c:out value="${bookDetail.author}"/>
                        </dd>
                        <dt>
                            출판사
                        </dt>
                        <dd>
                            <c:out value="${bookDetail.publisher}"/>
                        </dd>
                        <dt>
                            출판일
                        </dt>
                        <dd>
                            <c:out value="${bookDetail.publicationDate}"/>
                        </dd>
                        <dt>
                            책 소개
                        </dt>
                    </dl>
                    <p>
                        <c:out value="${bookDetail.bookDescription}"/>
                    </p>
                    <dl>
                        <dd>
                            <span class="bold">페이지 수 : </span><c:out value="${bookDetail.pageCount}"/><br>
                            <span class="bold">무게 : </span><c:out value="${bookDetail.weight}"/><br>
                            <span class="bold">크기 : </span><c:out value="${bookDetail.bookSize}"/>
                        </dd>
                        <dt>
                            대여 및 구매 여부 : <span id="available"></span>
                        </dt>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                    <button type="button" class="btn btn-warning">
                        Button
                    </button>
                </div>
                <div class="col-md-4">

                    <button type="button" class="btn btn-info">
                        Button
                    </button>
                </div>
                <div class="col-md-4">

                    <button type="button" class="btn btn-primary">
                        Button
                    </button>
                </div>
            </div>
        </div>
    </div>





<div id="bookDetail" data-isbn13="${bookDetail.isbn13}">


    <div style="margin-top: 5%">
        <button onclick='backtolist()'>뒤로가기</button>

        <div class="row">
            <div class="col-md-12">

            </div>

    <p>isbn13 : <c:out value="${bookDetail.isbn13}"/></p>

    <p>Average Rating: <fmt:formatNumber value="${bookDetail.averageRating}" minFractionDigits="1"/></p>

    <p>Review Count: <c:out value="${bookDetail.reviewCount}"/></p>


    <div>
        <p>Star 1: <c:out value="${bookDetail.star1Count}"/></p>
        <p>Star 2: <c:out value="${bookDetail.star2Count}"/></p>
        <p>Star 3: <c:out value="${bookDetail.star3Count}"/></p>
        <p>Star 4: <c:out value="${bookDetail.star4Count}"/></p>
        <p>Star 5: <c:out value="${bookDetail.star5Count}"/></p>
    </div>
</div>
</div>
    <div class="breadcrumb_container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
        </ol>
    </nav>
    </div>

</div>

<%@ include file="../../includes/footer.jsp" %>
</body>


<script>

  // 뒤로 가기 버튼 함수
  function backtolist() {
    history.back();
  }

  // 카테고리 ID를 변환하여 구조를 만드는 함수
  function transformCategoryId(categoryId) {
    const result = [];
    let currentId = categoryId;

    // 자릿수가 7이 남을 때까지 반복
    while (currentId.length > 7) {
      result.unshift(currentId); // 현재 ID를 결과 리스트 앞에 추가
      currentId = currentId.slice(0, -3); // 끝에서 3자리 잘라내기
    }

    result.unshift(currentId); // 마지막 남은 7자리 ID 추가
    return result;
  }

  // 브레드크럼 생성 함수
  function createBreadcrumb(categoryIds) {
    const categoryData = getCategoryDataFromSessionStorage(); // 세션 저장소에서 카테고리 데이터 불러오기

    if (!categoryData) {
      console.error('세션 저장소에서 카테고리 데이터를 찾을 수 없습니다.');
      return;
    }

    let breadcrumbHtml = '';
    categoryIds.forEach(categoryId => {
      // 카테고리 ID를 분해하여 상위 카테고리 ID 배열을 가져옴
      const transformedIds = transformCategoryId(categoryId);

      breadcrumbHtml += '<ol class="breadcrumb">'; // 새로운 <ol> 태그 열기

      transformedIds.forEach((id, index) => {
        const categoryName = categoryData.find(cat => cat.categoryId === id)?.categoryName || id;

        breadcrumbHtml += '<li class="breadcrumb-item">' +
            '<a href="/library/booklist/?category=' + id + '">' + categoryName + '</a>' +
            '</li>';
      });
      breadcrumbHtml += '</ol>'; // 하나의 경로가 끝날 때마다 <ol> 닫기
  });
    $('.breadcrumb_container').html(breadcrumbHtml); // 브레드크럼에 동적으로 생성된 HTML 추가
  }

  $(document).ready(function() {
    const isbn13 = $('#bookDetail').data('isbn13'); // 책의 isbn13 가져오기

    // AJAX로 카테고리 ID 요청
    $.ajax({
      url: '/ajax/getBookCategoryIds', // REST 컨트롤러 url
      type: 'GET',
      data: { isbn13: isbn13 },
      dataType: 'json',
      success: function(categoryIds) {
        createBreadcrumb(categoryIds); // 성공 시 브레드크럼 생성 함수 호출
      },
      error: function(xhr, status, error) {
        console.error('카테고리 ID를 가져오는데 실패했습니다:', error);
      }
    });
    isable = '${bookDetail.rentalAvailable}';
    console.log('${bookDetail.rentalAvailable}');
    if (isable === 'Y'){
      $("#available").html('<span id="available" style="color: blue">가능</span>');
    } else {
      $("#available").html('<span id="available" style="color: red">불가능</span>');
    }
  });


</script>
<script src="/resources/js/booklist_ajax.js"></script>
<script src="/resources/js/category_ajax.js"></script>
</html>