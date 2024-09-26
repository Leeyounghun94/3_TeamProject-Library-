<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>
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
         <h1><b>게시글 작성</b></h1>
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

      <div class="panel-heading">게시글을 작성 합니다. 귀하의 소중한 의견을 공유해 주세요.</div><br>
      <!-- /.panel-heading -->
      <div class="panel-body">

		
        <form role="form" action="/library/board/register" method="post">
        	<div class="form-group">
        		<label>닉네임</label> 
        		<input class="form-control" name='nickName' value="${userNickName}" readonly>
        		<input class="form-control" type='hidden' name='boardUserId' value="${userId}" readonly>
    	 	</div>
        	<div class="input-group mb-3">
  			<label class="input-group-text" for="inputGroupSelect01">카테고리</label>
  			<select class="form-select" id="inputGroupSelect01" name="category">
    			<option selected>선택</option>
    			<option value="자유">자유</option>
    			<option value="Q&A">Q&A</option>
  			</select>
			</div>
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title' placeholder="제목을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="3" name='content' placeholder="내용을 입력해주세요."></textarea>
          </div>
        </form>

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
						<div class="about_title"><br><br><br><br><b>게시글 작성시 유의사항</b></div>
						<p class="about_text">*게시글 작성 시 유의사항 개인적인 친분의 수준을 넘어선 과도한 비방, 음담패설, 도배, 근거 없는 사실 유포 이외 기타 악성 게시글들을 엄격히 금지하며, 위 항목에 해당하는 댓글 역시 철저히 금지합니다.
위와 같은 게시글/댓글은 경고없이 삭제되며, 작성자는 경고없이 탈퇴될 수 있습니다.<br>*규정에 어긋난 심한 욕설로 삭제 처리되며 지속적으로 남겨주실 경우 탈퇴처리 될 수 있으니 유의바랍니다.</p>

					</div>
				</div>

			</div>

		</div>
	</div>

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
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
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


  
});

</script>


<%@include file="../../includes/footer.jsp"%>
<!-- Footer -->
