<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=2">


<style>

</style>

<script>
$(function() {
    $("#imgInput").on('change', function(){
    	ext = $(this).val().split(".").pop().toLowerCase(); // 확장자 확인
    	
    	if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    		resetFormElement($(this)) // resetFormElement실행
    		alert('이미지 파일이 아닙니다.');
    	} else {
    		readURL(this);	
    	}
    	
    });
});

function readURL(input) {
	for(var i=0; i<input.files.length; i++) {
	    if (input.files[i]) {
	    	var reader = new FileReader();
	
	    	reader.onload = function (e) {
	    		var img = $('<img id="imgDisplay" class="img-thumbnail">');
	    		img.attr('src', e.target.result);
	    		img.appendTo('#imgDisplayContainer');
	    	}
	    	reader.readAsDataURL(input.files[i]);
	    }
	}
}

function resetFormElement(e) { 
	e.wrap('<form>').closest('form').get(0).reset(); // 폼으로 감싼후 지워준다.
	e.unwrap();
}
</script>

	<button class="btn btn-primary" data-toggle="modal" data-target="#postModal">게시글 등록</button>
	
	<!-- postModal -->
	<div class="modal fade" id="postModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
								
				<!-- Modal body -->
				<form id="createPostFrm" method="post" action="${path }/post/insertPost" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" id="postWriter" value="${memberLoggedIn.get }"/>
						<textarea class="form-control" rows="5" id="comment" name="postText" placeholder="문구 입력..."></textarea>
						<hr>
						
						<!-- 이미지 업로드 -->
						<div id="imgDisplayContainer"></div>
						<hr>
						
						<div class="privacyBoundsContainer">
						    <label for="privacyBounds" style="display: inline;">공개 범위</label>
						    <select class="form-control" name="privacyBounds" id="privacyBounds">
							    <option value="public">전체 보기</option>
							    <option value="friends">친구만</option>
							    <option value="private">나만 보기</option>
						    </select>
						</div>
						
						<div class="filebox"> <label for="imgInput">업로드</label> <input type="file" id="imgInput" multiple> </div>
					</div>
					
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary text-center">등록하기</button>
						<input type="reset" class="btn btn-danger text-center" value="취소" data-dismiss="modal"/>
					</div>
				</form>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
