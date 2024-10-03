<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../views/includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/styles/news_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/news_responsive.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/* 게시판 아이콘 */
	.gps{ 
		height : 25px ;
		weight : 35px ;
	}
	
	.phone{
		height : 25px ;
		weight : 35px ;
	}
		
	.letter{
		height : 25px ;
		weight : 35px ;
	}
	
	
	
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

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

  .home2{
      width : 100%;
      height : 50vh;
   }
   
</style>

	<!-- Home --><!-- 백그라운드 이미지 안나옴 -->

   <div class="home2">
      <div class="home_background_container prlx_parent">
         <div class="home_background prlx" style="background-image:url(/resources/images/courses_background.jpg)"></div>
      </div>
      <div class="home_content">
         <h1><b>도서 요청</b></h1>
      </div>
   </div>



	<!-- Contact -->

	<div class="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					
					<!-- Contact Form -->
					<div class="contact_form">
						<div class="contact_title"><br></div>

						<div class="contact_form_container">
						
						
						
						<div class="row">
						  <div class="col-lg-12">
						    <div class="panel panel-default">
						
						      <div class="panel-heading">희망 도서를 신청합니다. 정확한 입고를 위해 아래 양식을 작성해 주세요.</div><br>
						      <!-- /.panel-heading -->
						      <div class="panel-body">
						        <form role="form" action="/library/listRequest" method="post"> <!-- 희망도서 Form --><!-- action 경로 수정 필요 -->
						        	<div class="form-group">
						        		<label>닉네임</label> 
						        		<input class="form-control" name='r_bookUserNickName' value="${user.nickName}" readonly>
						        		<label>아이디</label>
						        		<input class="form-control" name='r_bookUserId' value="${user.id}" readonly>
						    	 	</div>
						          	<div class="form-group">
						            	<label>희망도서 제목</label> <input class="form-control" name='r_bookTitle' placeholder="제목을 입력해주세요.">
						          	</div>
						          	<div class="form-group">
						            	<label>희망도서 저자</label> <input class="form-control" name='r_bookAuthor' placeholder="저자를 입력해주세요.">
						          	</div>
						          	<div class="form-group">
						            	<label>희망도서 출판사</label> <input class="form-control" name='r_bookCompany' placeholder="출판사를 입력해주세요.">
						          	</div>
						          	<div class="form-group">
						            	<label>희망도서 카테고리</label> <input class="form-control" name='r_bookCategory' placeholder="카테고리를 입력해주세요.">
						          	</div>
						        </form> 
								<!-- end 희망도서 Form -->
						      </div>
						      <!--  end panel-body -->
						    </div>
						    <!--  end panel-body -->
						  </div>
						  <!-- end panel -->
						</div>
						<!-- /.row -->


						<div class="row">
						  <div class="col-lg-12">
						    <div class="panel panel-default">
						      <div class="panel-heading"></div>
						      <!-- /.panel-heading -->
						      	<label>파일업로드(선택)</label>
						      	<div class="input-group mb-3">
						 			<input type="file" class="form-control" name='uploadFile' multiple>
								</div>
						        <div class='uploadResult'> <!-- 새 게시글 등록에서 이미지 첨부 했을 때 나오는 곳 -->
						          <ul>
						          </ul>
						        </div>
						        <div align="center" style="padding-bottom:20px;">
						        	<button type="submit" class="btn btn-primary">등록</button>
						          	<button type="reset" class="btn btn-secondary">초기화</button>
						        </div>
						    </div>
						    <!--  end panel-body -->
						  </div>
						  <!-- end panel -->
						</div>
						<!-- /.row -->
			
						</div>
					</div>
						
				</div>



				<div class="col-lg-4">
					<div class="about">
						<div class="about_title"><br><br><br><br><b>희망도서 신청시 유의사항</b></div>
						<p class="about_text">*일부 도서는 희망도서에서 제외될 수 있습니다.
						<br>- 미풍양속이나 정서 등에 문제를 유발할 수 있는 유해자료, 19세 이상 선정적인 도서
						<br>- 소장자료나 구입중 또는 정리중 도서, 신청 또는 주문중복도서
						<br>- 서지불명도서나 미간행도서, 비매품, 품절이나 절판 도서
						<br>- 신판이 발간되었음에도 구판을 신청한 경우
						<br>- 개인 및 출판사의 영리를 목적으로 하는 자료로 판단되는 경우
						</p>

					</div>
				</div>

			</div>

		</div>
	</div>
	
				<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
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
			

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous">
</script> <!-- 외부 js 삽입 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- JQuery 사용 -->

<script>

$(document).ready(function(e){
	
  
  var formObj = $("form[role='form']"); // 파일업로드는 별도의 업로드 버튼 없이 <input type='file'>의 내용이 변경되는 것을 감지
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
    var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){ //업로드된 파일 리스트에서 정보를 추출해 숨겨진 input으로 추
      
      var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
      
      str += "<input type='hidden' name='attachListRequest["+i+"].r_fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachListRequest["+i+"].r_uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachListRequest["+i+"].r_uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachListRequest["+i+"].r_fileType' value='"+ jobj.data("type")+"'>";
      
    });
    
    console.log(str);
    
    formObj.append(str).submit(); // 폼을 제출
    
  });

  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']"); // 업로드 파일 확인
    
    var files = inputFile[0].files; // 업로드 된 파일 배열로 저장(파일 여러개 업로드일 경우)
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){ // 이미지 파일일 경우
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{ // 파일의 경우
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/images/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }

  $(".uploadResult").on("click", "button", function(e){ // 게시글 작성하고 파일 업로드하면 버튼 생기는데 그 버튼임 
	    
    console.log("delete file");
      
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    
    $.ajax({
      url: '/deleteFile', // UploadController url 과 같음
      data: {fileName: targetFile, type:type}, // 괄호 안에 들어가는 매개 변수들
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           
           targetLi.remove();
         }
    }); //$.ajax
    
   });
  
  var result = '<c:out value="${result}"/>'; // 넘어오는 result 값을 받아줄 변수가 필요했음
  
  checkModal(result); // function checkModal에 result값 들어오면 작동
  
	function checkModal(result) { // 모달 알림창 띄우기

		if (result === '' || history.state) {
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}

		$("#myModal").modal("show"); // Modal id= myModal 을 show(창을 띄운다)
	} // 모달창 띄우는 메서드
	
  


  
});

</script>


<%@include file="../../views/includes/footer.jsp"%>
<!-- Footer -->
