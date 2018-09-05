<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="kh.mark.jarvis.member.model.vo.Member" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>
<%! private static List<String> sessionList = new ArrayList<>(); %>
<%	
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	sessionList.add(memberLoggedIn.getMemberName());
	System.out.println("세션리스트 수 : "+sessionList.size());
%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=1111">
<style>


.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

#myInput {
    border-box: box-sizing;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 14px 20px 12px 45px;
    border: none;
    border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    border: 1px solid #ddd;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}

</style>


<script>
$(function() {
	// 게시글 등록
    $("#imgInput").on('change', function(){
    	ext = $(this).val().split(".").pop().toLowerCase(); 
    	
    	if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    		resetFormElement($(this)) // resetFormElement실행
    		alert('이미지 파일이 아닙니다.');
    	} else {
    		readURL(this);	
    	}
    });
	
	// 로그인안하면 글, 댓글 못달아!! 근데 이거하면 이미지 미리보기가 안나와 일단 보류!
	<%-- 
	if(<%=session.getAttribute("memberLoggedIn") %> == null) {
		var inputComment = $('.inputCommentTxt');
		
		inputComment.attr('disabled', true);
		inputComment.attr('value', '로그인 후 이용 가능합니다.')
		
		$('#createPostContainer').attr('data-target', "");
		$('#fakePostContents').attr('placeholder', '로그인 후 이용 가능합니다.')
	}
	 --%>

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

/* 댓글 input 엔터 이벤트 */
$('#inputCommentTxt').keydown(function(e) {
	if(e.keyCode == 13) {
		$('#createCommentFrm').submit();
	}
});







</script>
	<!-- 게시글 등록 미리보기. 클릭시 #postModal이 연결 돼 실제 입력창 나타난다. -->
	<div id="createPostContainer" data-toggle="modal" data-target="#postModal">
		<div class="modal-header">
			<h4 class="modal-title">Welcome to Jarvis</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		
		<div class="modal-body">
			<textarea rows="5" id="fakePostContents" class="form-control" name="postContents" placeholder="문구 입력..." disabled></textarea>
		</div>
	</div>

	
	<!-- 게시글 등록 -->
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
	
	<!-- 게시물 출력 -->
	<c:forEach items="${postList}" var="post" varStatus="vs">
	<div class="panel panel-default" >
	    <div class="panel-heading">
	        <span class="userName" style="font-size: 1.5em">${post.getPostWriter() }</span>&nbsp;&nbsp;
	        <span><fmt:formatDate value="${post.getPostDate()}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	    </div>
	    <div class="panel-body">
	    	<div id="postContentsContainer">
	    		<pre>${post.getPostContents() }</pre>
			</div>
	    	<c:forEach items="${attachmentList }" var="attach" varStatus="vs">
	    		<c:if test='${post.getPostNo() == attach.getPostNo() }'>
	    			<div class="postAttachContainer">
		        		<img class="imgSize img-thumbnail" src="${path }/resources/upload/post/${attach.getRenamedFileName() }">
			        </div>
	        	</c:if>
	        </c:forEach>
	        <div style="clear: both"></div>
	    </div>
	    
	    <!-- 댓글 쓰기 -->
	    <div class="panel-footer">
	    	<div class="commentContainer">
	    	
				<form id="createCommentFrm" method="post" action="${path }/post/postCommentInsert.do">
					<input type="hidden" name="commentWriter" value="${memberLoggedIn.getMemberNickname() }"/>
					<input type="hidden" name="postRef" value="${post.getPostNo() }"/>
					<input type="hidden" name="commentLevel" value="1"/>
					
					<span><img class="commentProfil rounded-circle" src="${path }/resources/upload/post/20180831_190832689_634.jpg"></span>
					<input type="text" id="inputCommentTxt" name="commentContents" class="form-control inputCommentTxt" placeholder=" 댓글을 입력하세요..."/>
					<div style="clear: both"></div>
					
					<!-- 댓글 출력 -->
					<c:forEach items="${commentList }" var="comment" varStatus="vs">
						<c:if test='${post.getPostNo() == comment.getPostRef() }'>
	 						<div class="displayComment">
								<a href="#"><span class="commentWriter">${comment.getCommentWriter() }</span></a>
								<span class="commentContents">&nbsp;&nbsp;${comment.getCommentContents() }</span>
								<a><i class="far fa-thumbs-up" style="font-size: 1.1em; margin-right: 1.5%"></i></a>
								<a id="inputReply"><i class="fas fa-long-arrow-alt-down" style="font-size: 1.1em"></i></a>
								<div style="clear: both"></div>
								
								<!-- 답글 달기 -->
								<div class="reply-container">
									<span><img class="replyProfil rounded-circle" src="${path }/resources/upload/post/20180831_190832689_634.jpg"></span>
									<input type="text" id="inputReplyTxt" name="commentContents" class="form-control inputCommentTxt" placeholder=" 답글을 입력하세요..."/>
									<div style="clear: both"></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</form>
			</div>
	    </div>
	</div>
	</c:forEach>
	
	<style>
		.displayComment {
			margin: 1% 0;
		}
		
		.reply-container {
			margin: 1% 0;
		}
		
		.replyProfil{
			width: 50px;
			height: 50px;
			margin: 0 0 0 15%;
			float: left;
		}
		
		#inputReplyTxt {
			margin: 1% 0 0 1%;
			padding: 0 0 0 5px;
			width: 70%;
			background-color: rgb(242, 244, 247);
			float: left;
		}
		
		.commentWriter {
			font-size: 1em; 
			margin-left: 3%;
		}
	
		.commentContents {
			margin: 1% 2% 1% 0;
			font-size: 0.9em;
			font-weight: normal;
			font-family: inherit; 
		}
	</style>


	
	
	
	
	
	
	<!--친구 현황  -->
<div class="container">
 

  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       <a>${memberLoggedIn.memberEmail}</a>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>