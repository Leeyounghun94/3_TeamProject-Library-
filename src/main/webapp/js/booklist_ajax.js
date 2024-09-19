// 전역 변수로 선언하여 모든 함수에서 접근 가능하게 함
let currentSortOrder = 'DESC';

$(document).ready(function() {
    // 페이지 로드 시 목록을 자동으로 로드
    loadPage(1, `b.publication_date ${currentSortOrder}`);
    $('sortButton').click(toggleSortOrder);
});

// 정렬 버튼 클릭 시 호출될 함수
function toggleSortOrder() {
    // 현재 정렬 상태를 반대로 변경
    currentSortOrder = (currentSortOrder === 'DESC') ? 'ASC' : 'DESC';

    // 정렬 기준에 따라 정렬 옵션 설정
    const sortOption = `b.publication_date ${currentSortOrder}`;

    // 버튼 텍스트 업데이트
    document.getElementById('sortButton').innerText = (currentSortOrder === 'DESC') ? '최신순' : '오래된순';

    // 첫 페이지에서 정렬된 데이터를 로드
    loadPage(1);
}

// 목록을 로드하는 함수
function loadPage(pageNum, sortOption = `b.publication_date ${currentSortOrder}`, searchQuery='') {
    const searchParams = new URLSearchParams(window.location.search);

    // 필터 값 설정
    const rentalAvailable = $("input[name='rentalAvailable']").is(":checked") ? 'Y' : '';
    const publicationDateFilter = $("select[name='publicationDateFilter']").val() || '';
    const categoryId = $("input[name='categoryId']").val() || '';

    // 필터링/검색 조건을 URL에 추가
    if (rentalAvailable !== '') searchParams.set('rentalAvailable', rentalAvailable);
    if (publicationDateFilter !== '') searchParams.set('publicationDateFilter', publicationDateFilter);
    if (categoryId !== '') searchParams.set('categoryId', categoryId);

    // 정렬 기준 설정
    if (!sortOption) {
        sortOption = `b.publication_date ${currentSortOrder}`; // 기본값으로 현재 정렬 순서 사용
    }
    searchParams.delete('pageNum'); // pageNum이 1일 때 URL에서 제거


    // URL을 업데이트
    const newUrl = window.location.pathname + (searchParams.toString() ? '?' + searchParams.toString() : '');
    history.pushState({}, '', newUrl);

    // AJAX 요청
    $.ajax({
        url: '/ajax/booklist',
        type: 'GET',
        data: {
            pageNum: pageNum,
            rentalAvailable: rentalAvailable,
            publicationDateFilter: publicationDateFilter,
            categoryId: categoryId,
            sort: `b.publication_date ${currentSortOrder}`
        },
        success: function (data) {
            if (data && data.list) {
                renderBookList(data.list);
                renderPaging(data);
            } else {
                alert('데이터를 불러오지 못했습니다.');
            }
        },
        error: function (xhr, status, error) {
            alert('도서 목록을 가져오는데 실패했습니다: ' + error);
        }
    });
}



function renderBookList(bookList) {
    const listBox = $('.list_wrap');
    listBox.empty();
    bookList.forEach(function (book) {
        let publicationDate;
        if(book.publicationDate && typeof(book.publicationDate) === 'object') {
            const {year, month, dayOfMonth} = book.publicationDate;
            const monthIndex = new Date(Date.parse(`${month} 1, ${year}`)).getMonth();
            publicationDate = new Date(year, monthIndex, dayOfMonth);
        }
        const formattedDate = `${publicationDate.getFullYear()}-${String(publicationDate.getMonth() + 1)
            .padStart(2,'0')}-${String(publicationDate.getDate()).padStart(2,'0')}`;
        const bookItem = `
            <div class="card border border-dark mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <span class="img position-absolute border border-dark">
                            <img src="/resources/images/bookimage/${book.photo}" class="img-fluid rounded-start" alt="${book.book}">
                        </span>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <p class="booktitle">${book.book}</p>
                            <p class="card-sub-text">${book.author}</p>
                            <p class="card-sub-text">${book.publisher}</p>
                            <p class="card-sub-text">${formattedDate}</p>
                        </div>
                    </div>
                </div>
            </div>
        `;
        listBox.append(bookItem);
    });
}

function renderPaging(pageData) {
    const pagingBox = $('.pagination');
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
        pagingBox.append(pageItem);
    }

    const nextPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link"  onclick="loadPage(${Math.min(pageData.endPage + 1, pageData.finalPage)})">다음페이지</button>
    </li>`;
    pagingBox.append(nextPageItem);

    const lastPageItem = `<li class="page-item ${pageData.next ? '' : 'disabled'}">
        <button class="page-link"  onclick="loadPage(${pageData.finalPage})">끝으로</button>
    </li>`;
    pagingBox.append(lastPageItem);
    maxPage = pageData.finalPage;
}

var bookService = (function () {
    function add() {
        const bookData = {
            book: document.getElementById('bookTitle').value,
            author: document.getElementById('bookAuthor').value,
            // 기타 필드들 추가. 귀찮다
        };

        $.ajax({
            url: '/ajax/booklist',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(bookData),
            success: function(response) {
                alert('책이 추가되었습니다.');
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('책 추가에 실패했습니다: ' + error);
            }
        });
    }

    function remove(isbn13, callback, error) {
        $.ajax({
            type: 'DELETE',
            url: '/ajax/booklist/' + isbn13,
            success: function (deleteResult, status, xhr) {
                if (callback) callback(deleteResult);
            },
            error: function (xhr, status, er) {
                if (error) error(er);
            }
        });
    }

    function update(book, callback, error) {
        $.ajax({
            type: 'PUT',
            url: '/ajax/booklist/' + book.isbn13,
            data: JSON.stringify(book),
            contentType: 'application/json; charset=utf-8',
            success: function (result, status, xhr) {
                if (callback) callback(result);
            },
            error: function (xhr, status, er) {
                if (error) error(er);
            }
        });
    }

    return {
        add: add,
        remove: remove,
        update: update
    };
})();
