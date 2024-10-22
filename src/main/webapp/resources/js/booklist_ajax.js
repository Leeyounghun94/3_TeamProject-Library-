let currentSortOrder = 'DESC';
let currentCategoryId = ''; // 현재 선택된 카테고리 ID를 저장하는 변수
let currentAmount = 10; // 현재 출력 개수를 저장할 전역 변수, 초기값 10
let currentSearchQuery = '';
// 현재 필터, 정렬 상황을 저장하는 변수
// 이 변수들이 하나하나 나열된것, loadPage를 호출하는 부분,
// 매번 선언되는 searchParams 부분, loadPage함수 그 자체의 복잡성 때문에
// 동료 개발자가 혼란을 겪기 쉽겠다 판단되어 상태변수들을 객체화하고, 함수들을 좀 더 모듈화를 하는 등
// 리팩토링을 하려 했으나 몸살 이슈로 인해 진행하지 못했습니다. 좋지 못한 코드 가독성에 미리 죄송합니다.


$(document).ready(function() {
  const params = new URLSearchParams(window.location.search);
  currentCategoryId = params.get('category'); // URL에서 카테고리 추출

  document.getElementById('itemsPerPageButton').textContent = currentAmount + '개씩 보기';
  updateDropdownText();

  if (!currentCategoryId) {
    // 카테고리 필터가 없는 경우 ?category= 를 URL에서 지워 깔끔하게 목록 불러오기
    loadPage(1, `b.publicationDate ${currentSortOrder}`, currentSearchQuery, '', currentAmount);
  }
});

document.getElementById('itemsPerPageMenu').addEventListener('click', changeItemsPerPageButton);

function changeItemsPerPageButton(event) {
  // 드롭다운 메뉴 최상위 버튼 텍스트 변경
  currentAmount = event ? parseInt(event.target.getAttribute('data-value')) : currentAmount; // 이벤트가 발동하면 값 갱신
  document.getElementById('itemsPerPageButton').textContent = currentAmount + '개씩 보기'; // 드롭다운 버튼의 텍스트 업데이트
  loadPage(1, `b.publicationDate ${currentSortOrder}`, '', currentCategoryId, currentAmount); // 페이지 로드
}

function updateDropdownText(){
  // 드롭다운 하위 메뉴들 텍스트 변경
  const dropdownItems = document.querySelectorAll('.dropdown-item2');
  dropdownItems.forEach(item =>{
    const value = parseInt(item.getAttribute('data-value'));
    item.textContent = `${value}`+'개씩 보기'; // data-value 를 기준으로 텍스트 설정
  })
}

function toggleSortOrder() {
  currentSortOrder = (currentSortOrder === 'DESC') ? 'ASC' : 'DESC';
  document.getElementById('sortButton').innerText = (currentSortOrder === 'DESC') ? '최신순' : '오래된순';
  const sortOption = `b.publicationDate ${currentSortOrder}`;
  loadPage(1, sortOption, '', currentCategoryId);
}

function loadPage(pageNum, sortOption = `b.publicationDate ${currentSortOrder}`, searchQuery = '', categoryId = currentCategoryId, amount = currentAmount) {
  const searchParams = new URLSearchParams(window.location.search);
/*  const publicationDateFilter = $("select[name='publicationDateFilter']").val() || '';*/

  currentCategoryId = categoryId;

 /* if (publicationDateFilter) updateURLParam('publicationDateFilter', publicationDateFilter, false);*/
  if (categoryId) updateURLParam('category', categoryId, false); // URL에는 'category'로 표시

  // 검색어와 페이지 번호를 URL에 반영
  if (searchQuery !== '') {
    searchParams.set('searchQuery', searchQuery);
  } else if (searchParams.has('searchQuery')) {
    searchQuery = searchParams.get('searchQuery');
  }

  // amount가 10이 아닐 때만 URL에 추가
  if (amount !== 10) {
    searchParams.set('amount', amount);
  } else if (searchParams.has('amount')) {
    searchParams.delete('amount');
  }

  const newSearchQuery = searchParams.toString();
  const newUrl = window.location.pathname + (newSearchQuery ? '?' + newSearchQuery : '');
  window.history.pushState({ path: newUrl }, '', newUrl); // 히스토리 스택 업데이트

  // AJAX 요청으로 페이지 데이터 로드
  $.ajax({
    url: '/ajax/booklist',
    type: 'GET',
    data: {
      pageNum: pageNum,
      amount: amount,
  /*    publicationDateFilter: publicationDateFilter,*/
      categoryId: categoryId,
      searchQuery: searchQuery,
      sort: sortOption
    },
    success: function (data) {
      if (data && data.list) {
        const radioButton = document.querySelector('input[name="tabs"]:checked');
        let selectView;
        if (radioButton) {
          selectView = radioButton.value;  // 선택된 라디오 버튼이 있는 경우 그 값을 가져옴
        } else {
          selectView = 'list';  // 선택된 것이 없으면 기본값으로 'list' 설정
        }
        if (selectView === 'list') {
          renderBookList(data.list);
        } else {
          renderBookGrid(data.list);
        }
        renderPaging(data);
        totalValue();
      } else {
        alert('데이터를 불러오지 못했습니다.');
      }
    },
    error: function (xhr, status, error) {
      alert('도서 목록을 가져오는데 실패했습니다: ' + error);
    }
  });
}

const radioButtons = document.querySelectorAll('input[name="tabs"]');
const listContainer = document.querySelector('.list_wrap');
const gridContainer = document.querySelector('.grid_wrap'); // 그리드 컨테이너 추가

radioButtons.forEach(function(radio) {
  radio.addEventListener('change', function() {
    if (this.value === 'list') {
      // 그리드형 숨기기, 리스트형 보이기
      listContainer.style.display = 'block';
      gridContainer.style.display = 'none';

      document.querySelector('[data-value="12"]').setAttribute('data-value', '10');
      document.querySelector('[data-value="24"]').setAttribute('data-value', '20');
      document.querySelector('[data-value="48"]').setAttribute('data-value', '50');

      currentAmount = 10;
      changeItemsPerPageButton();
      updateDropdownText();

      // 리스트형 렌더링
      renderBookList(bookList);

    } else {
      // 리스트형 숨기기, 그리드형 보이기
      listContainer.style.display = 'none';
      gridContainer.style.display = 'flex';

      document.querySelector('[data-value="10"]').setAttribute('data-value', '12');
      document.querySelector('[data-value="20"]').setAttribute('data-value', '24');
      document.querySelector('[data-value="50"]').setAttribute('data-value', '48');

      currentAmount = 12;
      changeItemsPerPageButton();
      updateDropdownText();

      // 그리드형 렌더링
      renderBookGrid(bookList);
    }
  });
});

function renderBookList(bookList) {
  const listBox = $('.list_wrap');
  listBox.empty();
  bookList.forEach(function (book) {
    const rentalStatus = book.rentalAvailable === 'Y' ? '가능' : '불가능'; // Y 또는 N에 따라 텍스트 설정
    const rentalColor = book.rentalAvailable === 'Y' ? 'blue' : 'red'; // 색상 설정
    const imageFilter = book.rentalAvailable === 'Y' ? '' : 'filter: grayscale(100%);'; // 대여 가능 여부에 따른 흑백 처리

    // 책 목록 HTML 생성
    const bookItem = `
    <div class="listcard border border-secondary mb-3" data-isbn="${book.isbn13}" data-able="${book.rentalAvailable}">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="${book.photo.startsWith('http') ? book.photo : '/library/books/' + book.photo}" class="listcard-image rounded-start" alt="${book.book}" style="${imageFilter}">
        </div>
        <div class="col-md-8">
          <div class="listcard-body">
            <p class="booktitle" data-end-value=""> ${book.book}</p>
            <div class="info-line">
              <span class="author">${book.author}</span>
              <span class="publisher">${book.publisher}</span>
              <span class="publicationDate">발행일 : ${book.publicationDate}</span>
              <span class="rentalAvailable">대여 가능 여부: <span style="color: ${rentalColor};">${rentalStatus}</span></span>
            </div>
            <div class="info-line">
              <span class="price">정가 : ${book.price}</span>
              <span class="bookCount">재고 수 : ${book.bookCount}</span>
              <span class="reviewCount">리뷰 수 : ${book.reviewCount}</span>
              <span class="averageRating">평점 : ${book.averageRating}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  `;
    // 편집 버튼 생성 (관리자일 경우에만 추가)
    const editButton = isAdmin === true ? `
    <button type="button" data-isbn="${book.isbn13}" onclick="window.location.href='/library/manage?mode=edit&isbn13=${book.isbn13}';" class="btn btn-outline-warning">편집</button>
  ` : '';
    // 전체 HTML 요소를 결합
    listBox.append(bookItem + editButton);
  });

  $('.listcard').each(function() { // 리스트 생성 후 대여 못하는거 판별
    const rentalAvailable = $(this).data('able');

    if (rentalAvailable === 'N') {
      // listcard에 마우스를 올리면 listcard-image의 필터 제거
      $(this).on('mouseenter', function() {
        $(this).find('.listcard-image').css('filter', 'none');
      });
      // listcard에서 마우스를 떼면 다시 흑백 처리
      $(this).on('mouseleave', function() {
        $(this).find('.listcard-image').css('filter', 'grayscale(100%)');
      });
    }
  });
  $('.listcard').on('click', function () {
    const isbn = $(this).data('isbn');
    window.location.href = `/library/read/${isbn}`;
  });
}

function renderBookGrid(bookList) {
  const gridBox = $('.grid_wrap');
  gridBox.empty();
  console.log('bookList:', bookList);
  bookList.forEach(function (book) {
    const rentalStatus = book.rentalAvailable === 'Y' ? '가능' : '불가능';
    const rentalColor = book.rentalAvailable === 'Y' ? 'blue' : 'red';
    const imageFilter = book.rentalAvailable === 'Y' ? '' : 'filter: grayscale(100%);';
    const bookItem = `
            <div class="gridcard" data-isbn="${book.isbn13}" data-able="${book.rentalAvailable}">
                <div class="gridcard__image">
                <div style="display: flex; justify-content: center">
                    <span class="img position-absolute border border-dark">
                        <img src="${book.photo.startsWith('http') ? book.photo : '/library/books/' + book.photo}"
                         class="img-fluid rounded-start" alt="${book.book}" style="${imageFilter}">
                    </span>
                    </div>
                    <div class="gridcard__content">
                        <p class="gridcard__title">${book.book}</p>
                        <p class="gridcard__text">${book.author}</p>
                        <p class="gridcard__text">${book.publisher}</p>
                        <span class="rentalAvailable" style="position: absolute; left: 70%;">대여 : <span style="color: ${rentalColor};">${rentalStatus}</span></span>
                        <p class="gridcard__text">발행일 : ${book.publicationDate}</p>
                    </div>
                </div>
            </div>
            `;
    const editButton = isAdmin === true ? `
            <button type="button" data-isbn="${book.isbn13}" onclick="window.location.href =
             '/library/manage?mode=edit&isbn13=${book.isbn13}';" class="btn btn-outline-warning">편집</button>
        ` : '';
    gridBox.append(bookItem + editButton);
  });
  $('.gridcard').each(function () {

  const isable = $(this).data('able');
  if ( isable === 'N'){
    $(this).on('mouseenter', function() {
      $(this).find('.img-fluid').css('filter', 'none');
    });
    $(this).on('mouseleave', function() {
      $(this).find('.img-fluid').css('filter', 'grayscale(100%)');
    });
  }
  })
  $('.gridcard').on('click', function () {
    const isbn = $(this).data('isbn');
    window.location.href = `/library/read/${isbn}`;
  });
}

function renderPaging(pageData) {
  const pagingBox = $('.pagination');
  totalBook = pageData.total;
  pagingBox.empty();

  const firstPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <button class="page-link" onclick="loadPage(1)">처음으로</button>
    </li>`;
  pagingBox.append(firstPageItem);

  const prevPageItem = `<li class="page-item ${pageData.startPage === 1 ? 'disabled' : ''}">
        <button class="page-link" onclick="loadPage(${Math.max(1, pageData.startPage - 10)})">이전페이지</button>
    </li>`;
  pagingBox.append(prevPageItem);

  for (let i = pageData.startPage; i <= pageData.endPage; i++) {
    const pageItem = `<li class="page-item ${pageData.pge.pageNum === i ? 'active' : ''}">
            <button class="page-link" onclick="loadPage(${i})">${i}</button>
        </li>`;
    pagingBox.append(pageItem); // 현재 페이지 나타낼땐 pageDate.pge.pageNum 임
  }

  const nextPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link" onclick="loadPage(${Math.min(pageData.endPage + 1, pageData.finalPage)})">다음페이지</button>
    </li>`;
  pagingBox.append(nextPageItem);

  const lastPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link" onclick="loadPage(${pageData.finalPage})">끝으로</button>
    </li>`;
  pagingBox.append(lastPageItem);
  maxPage = pageData.finalPage; // 페이지 이동 입력창에 쓰이는 코드
}

function updateURLParam(paramName, paramValue, shouldReplace = false) {
  const searchParams = new URLSearchParams(window.location.search);

  if (paramName !== 'pageNum' && paramName !== 'sortOption') {
    if (paramValue) {
      searchParams.set(paramName, paramValue);
    } else {
      searchParams.delete(paramName);
    }
  }

  const newSearchQuery = searchParams.toString();
  const newUrl = window.location.pathname + (newSearchQuery ? '?' + newSearchQuery : '');

  if (shouldReplace) {
    window.history.replaceState({ path: newUrl }, '', newUrl);
  } else {
    const currentState = window.history.state || {};
    const currentCategory = currentState.categoryId;

    if (currentCategory !== paramValue) {
      window.history.pushState({ categoryId: paramValue }, '', newUrl);
    }
  }
  window.resetBookFilters = resetBookFilters;

  function resetBookFilters() {
    // 이 함수를 만들면서 상태관리를 하는 로직은 따로 구현을 하거나, 상태관리를 돕는 도구의 필요성을 느꼈습니다.
    // 기타 필터 초기화 로직
    currentSortOrder = 'DESC';
    if (listContainer.classList.contains('grid-view')){
      currentAmount = 12;
    } else {
      currentAmount = 10;
    }
    currentSearchQuery ='';
    currentCategoryId = '';
    document.getElementById('sortButton').innerText = '최신순';
    document.getElementById('itemsPerPageButton').textContent = currentAmount + '개씩 보기';
    document.getElementById('searchInput').value = '';

    // URL 파라미터 초기화
 /*   updateURLParam('publicationDateFilter', '');*/
    updateURLParam('searchQuery', '', true);

    loadPage(1); // 기본 페이지 로드
  }
}
// 페이지가 로드 될때 URL에서 카테고리 정보를 찾아오는 함수
window.onload = function (){
  const params = new URLSearchParams(window.location.search);
  currentCategoryId = params.get('category');
  loadPage(1, `b.publicationDate ${currentSortOrder}`, currentSearchQuery, currentCategoryId, currentAmount);
}
