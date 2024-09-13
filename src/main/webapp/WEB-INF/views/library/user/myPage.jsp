<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/styles/myPage-style.css">
<%@include file="../../includes/header.jsp" %>
<!-- ##### Main Content Wrapper Start ##### -->
<div class="main-content-wrapper d-flex clearfix">
  <div class="cart-table-area section-padding-100">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12 col-lg-12">
          <div class="checkout_details_area mt-50 clearfix">

            <div class="cart-title">
              <h2>마이페이지</h2>
            </div>

				<form action="#" method="post">
					<div class="row">
						<div class="col-md-6 mb-3">
							<small>아이디</small>
							<input type="text" class="form-control" id="txtId" value="" placeholder="아이디 입력" required readOnly="readOnly">
                        </div>
						<div class="col-md-3 mb-3">
							<small>&nbsp;</small>
							&nbsp;
						</div>
						<div class="col-md-6 mb-3">
							<small>비밀번호</small>
							<input type="password" class="form-control" id="txtPwd" value="" placeholder="비밀번호 입력" required>
						</div>
						<div class="col-md-6 mb-3">
							<small>비밀번호 확인</small>
							<input type="password" class="form-control" id="txtPwd2" value="" placeholder="비밀번호 다시 입력" required>
						</div>
						<div class="col-md-6 mb-3">
							<small>사용자명</small>
							<input type="text" class="form-control" id="txtName" value="" placeholder="성명 입력">
						</div>
						<div class="col-md-6 mb-3">
							<small>전화번호</small>
							<input type="number" class="form-control" id="txtTel" min="0" placeholder="전화번호 입력" value="">
						</div>
						<div class="col-md-6 mb-3">
							<small>이메일</small>
							<input type="email" class="form-control" id="txtMail" placeholder="이메일 입력" value="">
						</div>
					</div>
				</form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$
</script>
<%@include file="../../includes/footer.jsp"%>