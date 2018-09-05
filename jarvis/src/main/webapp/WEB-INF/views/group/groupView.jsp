<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<title>Agency - Start Bootstrap Theme</title>
<link href="${path }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/bootstrap/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="${path }/resources/css/agency.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="${path }/resources/groupJs/css/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${path }/resources/groupJs/css/als_demo.css" />
<link rel="icon" href="${path }/resources/groupJs/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${path }/resources/groupJs/images/favicon.ico" type="image/x-icon" />
<meta name="robots" content="index,follow" />
<meta name="keywords" content="jQuery plugin, jQuery scroller, list jQuery, jQuery lists, css3, html5, jQuery" />
<meta name="description" content="any list scroller demo - jQuery scrolling plugin by musings.it to scroll any kind of list with any content - musings.it web design and development - Bergamo Italy" /> 	
<meta name="author" content="Federica Sibella - musings.it" />
<meta name="geo.placename" content="via Generale Alberico Albricci 1, 24128 Bergamo, Italy">
<script type="text/javascript" src="${path }/resources/groupJs/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path }/resources/groupJs/js/jquery.als-1.7.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=15">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}


/*================================  */
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

</script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>	
</jsp:include>


<!-- 게시글 등록 미리보기. 클릭시 #postModal이 연결 돼 실제 입력창 나타난다. -->
	<div id="createPostContainer" data-toggle="modal" data-target="#postModal" style="width: 46%;">
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
<!-- Page Container -->
<div class="container content mt-2" style="margin-left:12%; max-width:1400px; float: left;">    
  <!-- The Grid -->
  <div class="w3-row">
   
    
    <!-- Middle Column -->
    <div class="w3-col m7">
         
      <div class="w3-container w3-card w3-white w3-round w3-margin commentD"><br>
        <img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>테스트1</h4><br>
        <hr class="w3-clear">
        <p>테스트1</p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="${path }/resources/img/05-full.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            </div>
            <div class="w3-half">
              <img src="${path }/resources/img/06-full.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
          </div>
        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom commentB"><i class="fa fa-comment"></i>  Comment</button> 
      </div>

    <!-- End Middle Column -->
    </div>
    
   
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<%-- <%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="kh.mark.jarvis.member.model.vo.Member" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

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
	
	if(<%=session.getAttribute("memberLoggedIn") %> == null) {
		var inputComment = $('.inputCommentTxt');
		
		inputComment.attr('disabled', true);
		inputComment.attr('value', '로그인 후 이용 가능합니다.')
		
		$('#createPostContainer').attr('data-target', "");
		$('#fakePostContents').attr('placeholder', '로그인 후 이용 가능합니다.')
	}
	

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







 --%>