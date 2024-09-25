<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<style>
  .bookManagement * {
    font-family: "Noto Sans KR", sans-serif;
    font-optical-sizing: auto;
    font-size: 1rem;
    font-weight: 500; /* 일반 글씨 */
    font-style: normal;
    color: #000;
  }
  .home2 {
    width: 100%;
    height: 50vh;
  }
  .supercon {
    padding: 200px;
  }
  .manage {
    margin-bottom: 1vh;
  }

  .bookform {
    background-color: #fff;

    border: 1px solid rgb(159, 159, 160);
    border-radius: 20px;
    padding: 2rem .7rem .7rem .7rem;
    text-align: center;
    font-size: 1.125rem;
    max-width: 320px;
  }

  .bookform-title {
    color: #000000;
    font-size: 1.8rem;
    font-weight: 500;
  }

  .bookform-paragraph {
    margin-top: 10px;
    font-size: 0.9375rem;
    color: rgb(105, 105, 105);
  }

  .bookdrop-container {
    background-color: #fff;
    position: relative;
    display: flex;
    gap: 10px;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 10px;
    margin-top: 2.1875rem;
    border-radius: 10px;
    border: 2px dashed rgb(171, 202, 255);
    color: #444;
    cursor: pointer;
    transition: background .2s ease-in-out, border .2s ease-in-out;
  }

  .bookdrop-container:hover {
    background: rgba(0, 140, 255, 0.164);
    border-color: rgba(17, 17, 17, 0.616);
  }

  .bookdrop-container:hover .bookdrop-title {
    color: #222;
  }

  .bookdrop-title {
    color: #444;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    transition: color .2s ease-in-out;
  }

  #fileInput {
    width: 350px;
    max-width: 100%;
    color: #444;
    padding: 2px;
    background: #fff;
    border-radius: 10px;
    border: 1px solid rgba(8, 8, 8, 0.288);
    font-size: initial;
    line-height: normal;
  }

  #fileInput::file-selector-button {
    margin-right: 20px;
    border: none;
    background: #084cdf;
    padding: 10px 20px;
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
    transition: background .2s ease-in-out;
  }

  #fileInput::file-selector-button:hover {
    background: #0d45a5;
  }

</style>
<head>
    <title>도서 관리</title>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_styles.css">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_responsive.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
          rel="stylesheet">
    <jsp:include page="../includes/header.jsp"/>
</head>
<body>
<div class="home2">
    <div class="home_background_container prlx_parent">
        <div class="home_background prlx2"
             style="background-image:url(/resources/images/courses_background.jpg)"></div>
    </div>
    <div class="home_content">
        <h1>도서 관리</h1>
    </div>
</div>
<main class="supercon" style="color:#000;">
    <button type="button" class="btn btn-primary" onclick='backtolist()'>
        뒤로가기
    </button>
    <div class="row g-5">
        <div class="col-md-5 col-lg-4">
        </div>
        <div class="col-md-7 col-lg-8">
            <form class="needs-validation was-validated" enctype="multipart/form-data" novalidate="">
                <div class="bookform">
                    <span class="bookform-title">Upload your file</span>
                    <p class="bookform-paragraph">
                        File should be an image
                    </p>
                    <label for="fileInput" class="bookdrop-container">
                        <span class="bookdrop-title">Drop files here</span>
                        or
                        <input type="file" name="file" accept="image/*" required="" id="fileInput">
                    </label>
                </div>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="bookTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="bookTitle" placeholder=""
                               value="" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                    <div class="manage col-sm-6">
                        <label for="bookAuthor" class="form-label">작가</label>
                        <input type="text" class="form-control" id="bookAuthor" placeholder=""
                               value="" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="bookPublisher" class="form-label">출판사</label>
                        <input type="text" class="form-control" id="bookPublisher" placeholder=""
                               value="" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                    <div class="manage col-sm-6">
                        <label for="publicationDate" class="form-label">발행일</label>
                        <input type="text" class="form-control" id="publicationDate" placeholder=""
                               value="" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                    <div class="manage col-12">
                        <label for="bookDescription" class="form-label">책 소개 <span
                                class="text-body-secondary">(선택)</span></label>
                        <input type="text" class="form-control" id="bookDescription">
                    </div>


                    <div class="manage col-12">
                        <label for="address" class="form-label">카테고리</label>
                        <input type="text" class="form-control" id="address" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                    <div id="categoryListContainer">
                        <!-- 추가된 카테고리들이 이곳에 표시 -->
                    </div>
                    <div class="btn-group" role="group">
                        <button id="dropdownMenuButton" type="button"
                                class="btn btn-secondary dropdown-toggle"
                                data-toggle="dropdown" aria-expanded="false">
                            카테고리
                        </button>
                        <ul id="categoryDropdownContainer" class="dropdown-menu">
                        </ul>
                        <div id="subMenuWrapper">
                        </div>
                    </div>
                    <button id="addCategoryButton" type="button">카테고리 추가</button>



                    <div class="manage col-12">
                        <label for="isbn13" class="form-label">ISBN13</label>
                        <input type="text" class="form-control" id="isbn13"
                               placeholder="Apartment or suite" required="">
                        <div class="invalid-feedback">
                            필수 항목 입니다.
                        </div>
                    </div>
                </div>
                <hr class="my-4">
                <h4 class="mb-3">대여 가능 여부</h4>
                <div class="my-3">
                    <div class="form-check">
                        <input id="available" name="rentalAvailable" type="radio"
                               class="form-check-input" checked="" required="">
                        <label class="form-check-label" for="available">가능</label>
                    </div>
                    <div class="form-check">
                        <input id="notAvailable" name="rentalAvailable" type="radio" class="form-check-input"
                               required="">
                        <label class="form-check-label" for="notAvailable">불가능</label>
                    </div>
                </div>
                <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="bookPrice" class="form-label">가격</label>
                        <input type="text" class="form-control" id="bookPrice" placeholder="">
                        <div class="invalid-feedback">
                            Name on card is required
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label for="bookCount" class="form-label">재고수</label>
                        <input type="text" class="form-control" id="bookCount" placeholder=""
                               required="">
                        <div class="invalid-feedback">
                            Expiration date required
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label for="pageCount" class="form-label">쪽수</label>
                        <input type="text" class="form-control" id="pageCount" placeholder="">

                    </div>
                    <div class="col-md-3">
                    <label for="weight" class="form-label">무게</label>
                    <input type="text" class="form-control" id="weight" placeholder="">
                    <div class="invalid-feedback">
                        필수 항목 입니다.
                    </div>
                </div>
                <div class="col-md-3">
                    <label for="bookSize" class="form-label">크기</label>
                    <input type="text" class="form-control" id="bookSize" placeholder="">
                    <div class="invalid-feedback">
                        Security code required
                    </div>
                </div>
                <div class="col-md-3">
                <label for="averageRating" class="form-label">평점</label>
                <input type="text" class="form-control" id="averageRating" placeholder="">
                <div class="invalid-feedback">
                    Security code required
                </div>
                </div>
                <div class="col-md-3">
                <label for="reviewCount" class="form-label">리뷰수</label>
                <input type="text" class="form-control" id="reviewCount" placeholder="">
                <div class="invalid-feedback">
                    Security code required
                </div>
                </div>
                <div class="col-md-6">
                    <label for="starRating1"></label><input type="number" id="starRating1" name="starRating1" placeholder="별 1개 비율" min="0" max="100">
                    <label for="starRating2"></label><input type="number" id="starRating2" name="starRating2" placeholder="별 2개 비율" min="0" max="100">
                    <label for="starRating3"></label><input type="number" id="starRating3" name="starRating3" placeholder="별 3개 비율" min="0" max="100">
                    <label for="starRating4"></label><input type="number" id="starRating4" name="starRating4" placeholder="별 4개 비율" min="0" max="100">
                    <label for="starRating5"></label><input type="number" id="starRating5" name="starRating5" placeholder="별 5개 비율" min="0" max="100">
                </div>
        </div>
        <hr class="my-4">
        <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </form>
    </div>
    </div>
</main>
<script>

  $(document).ready(function() {
    // 책 추가 버튼 클릭 시
    $('#addBookButton').on('click', function() {
      var formData = new FormData();
      var bookData = {
        title: $('#bookTitle').val(),
        author: $('#bookAuthor').val(),
        publisher: $('#bookPublisher').val(),
        price: $('#bookPrice').val(),
        isbn13: $('#bookIsbn13').val()
      };

      formData.append('bookData', JSON.stringify(bookData));

      // 파일 처리
      var fileInput = $('#fileInput')[0].files[0];
      if (fileInput) {
        formData.append('file', fileInput);
      }

      $.ajax({
        url: '/ajax/book/add',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          alert('책이 성공적으로 추가되었습니다.');
        },
        error: function() {
          alert('책 추가에 실패했습니다.');
        }
      });
    });

    // 책 수정 버튼 클릭 시
    $('#editBookButton').on('click', function() {
      var formData = new FormData();
      var bookData = {
        title: $('#bookTitle').val(),
        author: $('#bookAuthor').val(),
        publisher: $('#bookPublisher').val(),
        price: $('#bookPrice').val(),
        isbn13: $('#bookIsbn13').val()
      };
      formData.append('bookData', JSON.stringify(bookData));

      // 파일 처리
      var fileInput = $('#fileInput')[0].files[0];
      if (fileInput) {
        formData.append('file', fileInput);
      }

      $.ajax({
        url: '/ajax/book/' + bookData.isbn13,
        type: 'PUT',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          alert('책 정보가 성공적으로 수정되었습니다.');
        },
        error: function() {
          alert('책 정보 수정에 실패했습니다.');
        }
      });
    });

    $('#bookForm').on('submit', function(e) {
      e.preventDefault();

      // 별점 비율 값을 가져와 합산
      var starRating1 = parseInt($('#starRating1').val()) || 0;
      var starRating2 = parseInt($('#starRating2').val()) || 0;
      var starRating3 = parseInt($('#starRating3').val()) || 0;
      var starRating4 = parseInt($('#starRating4').val()) || 0;
      var starRating5 = parseInt($('#starRating5').val()) || 0;

      var total = starRating1 + starRating2 + starRating3 + starRating4 + starRating5;

      // 합이 100 또는 0이어야 유효성 통과
      if (total === 100 || total === 0) {
        $('#errorMessage').hide();  // 오류 메시지 숨기기
        this.submit();  // 폼 제출
      } else {
        $('#errorMessage').show();  // 오류 메시지 표시
      }
    });

    // 책 삭제 버튼 클릭 시
    $('#deleteBookButton').on('click', function() {
      var isbn13 = $('#bookIsbn13').val();

      $.ajax({
        url: '/ajax/book/' + isbn13,
        type: 'DELETE',
        success: function(response) {
          alert('책이 성공적으로 삭제되었습니다.');
        },
        error: function() {
          alert('책 삭제에 실패했습니다.');
        }
      });
    });
  });

  document.addEventListener('DOMContentLoaded', function () {
    const forms = document.querySelectorAll('.needs-validation')

    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        // 기본 HTML5 유효성 검사
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
          form.classList.add('was-validated');
          return; // HTML5 유효성 검사 통과 못하면 바로 종료
        }

        // 별점 비율 추가 유효성 검사
        var starRating1 = parseInt(document.getElementById('starRating1').value) || 0;
        var starRating2 = parseInt(document.getElementById('starRating2').value) || 0;
        var starRating3 = parseInt(document.getElementById('starRating3').value) || 0;
        var starRating4 = parseInt(document.getElementById('starRating4').value) || 0;
        var starRating5 = parseInt(document.getElementById('starRating5').value) || 0;

        var total = starRating1 + starRating2 + starRating3 + starRating4 + starRating5;

        if (total !== 100 && total !== 0) {
          event.preventDefault();
          event.stopPropagation();
          document.getElementById('errorMessage').style.display = 'block';  // 오류 메시지 표시
        } else {
          document.getElementById('errorMessage').style.display = 'none';  // 오류 메시지 숨기기
        }
        form.classList.add('was-validated');  // 폼 제출 전 유효성 검사 시각적 피드백
      }, false)
    })
  });

</script>

<script>
  let selectedCategories = []; // 저장된 카테고리 목록

  // 최하위 카테고리 ID와 이름 저장 변수
  let currentLowestCategoryId = null;
  let currentLowestCategoryName = null;

  // 세션 스토리지에서 카테고리 데이터 가져오기
  function getCategoryDataFromSessionStorage() {
    const data = sessionStorage.getItem('categoryData');
    return data ? JSON.parse(data) : null;
  }

  // 'onCategorySelected' 함수에서 세션 스토리지 데이터 활용
  function onCategorySelected(categoryId) {
    const categoryData = getCategoryDataFromSessionStorage();

    if (categoryData) {
      // 선택한 카테고리 ID에 맞는 카테고리 이름을 찾아서 저장
      const selectedCategory = categoryData.find(category => category.categoryId === categoryId);
      if (selectedCategory) {
        currentLowestCategoryId = selectedCategory.categoryId;
        currentLowestCategoryName = selectedCategory.categoryName;

      } else {
        console.error('해당 카테고리 ID를 찾을 수 없습니다:', categoryId);
      }
    } else {
      console.error('세션에서 카테고리 데이터를 찾을 수 없습니다.');
    }
  }



  // UI에 카테고리 목록을 업데이트하는 함수
  function updateCategoryListUI() {
    const container = document.getElementById('categoryListContainer');
    container.innerHTML = ''; // 기존 목록 초기화

    // 카테고리 목록을 표시
    selectedCategories.forEach(category => {
      const item = document.createElement('div');
      item.textContent = category.categoryName; // 화면에 카테고리 이름 표시
      container.appendChild(item);

      // 제거 버튼 추가
      const removeButton = document.createElement('button');
      removeButton.textContent = '제거';
      removeButton.addEventListener('click', function () {
        removeCategory(category.categoryId); // 제거 함수 호출
      });
      item.appendChild(removeButton);
    });
  }

  // 카테고리 목록에서 제거하는 함수
  function removeCategory(categoryId) {
    selectedCategories = selectedCategories.filter(category => category.categoryId !== categoryId);
    updateCategoryListUI(); // UI 업데이트
  }

  // 부모 요소인 categoryDropdownContainer에 이벤트 위임 적용 (1차 카테고리)
  document.getElementById('categoryDropdownContainer').addEventListener('click', function (event) {
    if (event.target && event.target.matches('.dropdown-item div')) {
      const categoryId = event.target.getAttribute('data-category-id');
      const categoryName = event.target.textContent;

      onCategorySelected(categoryId, categoryName);
    }
  });

  // 하위 카테고리 메뉴에도 이벤트 위임 적용 (2차 카테고리 이후)
  document.getElementById('subMenuWrapper').addEventListener('click', function (event) {
    if (event.target && event.target.matches('.dropdown-item div')) {
      const categoryId = event.target.getAttribute('data-category-id');
      const categoryName = event.target.textContent;

      onCategorySelected(categoryId, categoryName);
    }
  });

  // '카테고리 추가' 버튼 클릭 시 호출될 함수
  document.getElementById('addCategoryButton').onclick = function() {
    if (currentLowestCategoryId && currentLowestCategoryName) {

      let shouldAdd = true;

      // 1. 하위 카테고리인지 확인 (목록의 카테고리가 새로 추가하려는 카테고리의 부모인지 확인)
      selectedCategories.forEach(category => {
        const isParentCategory = currentLowestCategoryId.startsWith(category.categoryId); // 하위 카테고리인지 확인
        const isSubCategory = category.categoryId.startsWith(currentLowestCategoryId); // 상위 카테고리인지 확인
        const isExactMatch = currentLowestCategoryId === category.categoryId; // 정확히 일치하는지 확인

        if (isExactMatch) {
          // 카테고리가 정확히 일치하는 경우
          alert('이미 추가된 카테고리와 동일한 카테고리입니다.');
          shouldAdd = false;
        } else if (isParentCategory) {
          // 하위 카테고리인 경우, 상위 카테고리를 교체
          selectedCategories = selectedCategories.filter(c => c.categoryId !== category.categoryId);
        } else if (isSubCategory) {
          // 상위 카테고리 추가를 막음
          alert('하위 카테고리가 이미 추가되어 있으므로 상위 카테고리를 추가할 수 없습니다.');
          shouldAdd = false;
        }
      });
      // 카테고리 추가
      if (shouldAdd) {
        selectedCategories.push({ categoryId: currentLowestCategoryId, categoryName: currentLowestCategoryName });
      }

      updateCategoryListUI(); // UI 업데이트
    } else {
      alert('카테고리를 선택해주세요.');
    }
  };

  // 뒤로 가기 버튼 함수
  function backtolist() {
    history.back();
  }

</script>

<jsp:include page="../includes/footer.jsp"/>
<script src="/resources/js/booklist_ajax.js"></script>
<script src="/resources/js/category_ajax.js"></script>
</body>
</html>