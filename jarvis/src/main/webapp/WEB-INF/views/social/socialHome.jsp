<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=3">

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
<style>
#createPostContainer {
	width: 42%;
    margin-left: 14%;
}

.postAttachContainer img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.2s;
    -moz-transition:.2s;
    -ms-transition:.2s;
    -o-transition:.2s;
    transition:.2s;
}

.postAttachContainer:hover img {
    -webkit-transform:scale(1.05);
    -moz-transform:scale(1.05);
    -ms-transform:scale(1.05);   
    -o-transform:scale(1.05);
    transform:scale(1.05);
}

#createPostContainer {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.2s;
    -moz-transition:.2s;
    -ms-transition:.2s;
    -o-transition:.2s;
    transition:.2s;
}

#createPostContainer:hover {
    -webkit-transform:scale(1.03);
    -moz-transform:scale(1.03);
    -ms-transform:scale(1.03);   
    -o-transform:scale(1.03);
    transform:scale(1.03);
    z-index: 100 !important;
}
</style>
	
	<!-- 게시글 등록 미리보기. 클릭시 #postModal이 연결 돼 실제 입력창 나타난다. -->
	<div id="createPostContainer" data-toggle="modal" data-target="#postModal">
		<div class="modal-header">
			<h4 class="modal-title">Welcome to Jarvis</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		
		<div class="modal-body">
			<textarea rows="5" id="postContents" class="form-control" name="postContents" placeholder="문구 입력..." disabled></textarea>
		</div>
	</div>
	

	
	<!-- postModal -->
	<div class="modal fade" id="postModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 올리기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
								
				<!-- Modal body -->
				<form id="createPostFrm" method="post" action="${path }/post/insertPost.do" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" id="postWriter" name="postWriter" value="yong"/>
						<textarea class="form-control" rows="5" id="postContents" name="postContents" placeholder="문구 입력..."></textarea>
						<hr>
						
						<!-- 이미지 업로드 -->
						<div id="imgDisplayContainer"></div>
						<hr>
						
						<div class="privacyBoundContainer">
						    <label for="privacyBound" style="display: inline;">공개 범위</label>
						    <select class="form-control" id="privacyBound" name="privacyBound">
							    <option value="public">전체 보기</option>
							    <option value="friend">친구만</option>
							    <option value="private">나만 보기</option>
						    </select>
						</div>
						
						<div class="filebox"> <label for="imgInput">업로드</label> <input type="file" id="imgInput" name="upFile" multiple> </div>
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
	
	<hr>
	
	<!-- 게시물 패널 -->
	<c:forEach items="${postList}" var="post" varStatus="vs">
	<div class="panel panel-default" >
	    <div class="panel-heading">
	        <span class="userName" style="font-size: 1.5em">${post.getPostWriter() }</span>&nbsp;&nbsp;<span>${post.getPostDate() }</span>
	    </div>
	    <div class="panel-body">
	    	<div id="postContentsContainer">
	    		<pre>${post.getPostContents() }</pre>
			</div>
			
	    	<c:forEach items="${attachmentList }" var="attach" varStatus="vs">
	    		<c:if test='${post.getPostNo() == attach.getPostNo() }'>
	    			<div class="postAttachContainer">
		        		<img class="imgSize" src="${path }/resources/upload/post/${attach.getRenamedFileName() }">
			        </div>
	        	</c:if>
	        </c:forEach>
	        <div style="clear: both"></div>
	    </div>
	    <div class="panel-footer">
			<form id="createCommentFrm" method="post" action="">
				<img src="${path }/resources/upload/post/dd.gif"><input type="text" id="commentTxt" class="form-control"/>
				<div style="clear: both"></div>
			</form>
	    </div>
	</div>
	</c:forEach>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>