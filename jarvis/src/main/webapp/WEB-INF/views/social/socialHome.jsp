<%@page import="java.util.Enumeration"%>
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

<script>

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
	
	/* 댓글 input 엔터 이벤트 */
	$('.inputCommentTxt').keydown(function(e) {
	   if(e.keyCode == 13) {
	      $('.createCommentFrm').submit();
	   }
	});
	
	/* reply 아이콘 클릭. 답글 달기! */ 
	$('.inputReplyIcon').click(function() {
	   
	   /* var replyPostRef = $('#reply_postRef').val(); */
	   var replyPostRef = $(this).attr("title");
	   var replyCommentRef = $(this).val();
	   
	   var div = $("<div class='replyInput'></div>");
	   
	   /* 답글 입력 */
	   var html = "<form class='createCommentFrm' method='post' action='${path }/post/postCommentInsert.do'>";
	   html += "<input type='hidden' name='commentWriter' value='${memberLoggedIn.getMemberNickname() }'/>";
	   html += "<input type='hidden' name='postRef' value='" + replyPostRef + "'/>";
	   html += "<input type='hidden' name='commentLevel' value='2'/>";
	   html += "<input type='hidden' name='commentRef' value='" + replyCommentRef + "'/>";
	   html += "<span><img class='replyProfile rounded-circle' src='${path }/resources/upload/post/20180030_210021127_730.jpg'></span>";
	   html += "<input type='text' name='commentContents' class='inputReplyTxt form-control' placeholder=' 답글을 입력하세요...'/>";
	   html += "<div style='clear: both'></div></form>";
	   
	   div.html(html);
	   
	   div.appendTo($(this).parent().children('.reply-container'));
	   
	   $(this).off('click');
	   
	});
   
    /* 답글 삽입 스크립트 */
    $('.replyDisplay').each(function() {
       var reply=$(this);
       
       $('.replyDisplay-container').each(function(){
         
          if($(this).attr('id') == reply.attr('title')) {
             $(this).append(reply);
          }
       });
    });
});

function fn_postLike(e) { /* 좋아요 전송 */
	
	var btn = $(e)
	var likeFrm = btn.next($('.likeFrm'));
	var likeUrl;
	
	if(btn.children().attr('class').includes('far')){
		btn.children().removeClass();
		btn.children().addClass('fas fa-heart like');
		likeUrl = "${pageContext.request.contextPath}/post/likeInsertAndSelect.do";
	}
	else{
		btn.children().removeClass();
		btn.children().addClass('far fa-heart like');
		likeUrl="${pageContext.request.contextPath}/post/likeDeleteAndSelect.do";
	}
	
	$.ajaxSettings.traditional = true;
	$.ajax({
		type: "POST",
		url: likeUrl,
		data: {
			likeMember : likeFrm.children('.likeMember').val(),
			postRef : likeFrm.children('.postRef').val(),
			commentRef : likeFrm.children('.commentRef').val(),
			likeCheck : likeFrm.children('.likeCheck').val(),
		},
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
	    dataType : "json",
        
		success: function(data) {
			var likeMember;
			var postRef;
			var commentRef;
			var likeCheck;

			$.each(data.likeList, function(i, item) {
				likeMember = item.likeMember;
				postRef = item.postRef;
				commentRef = item.commentRef;
				likeCheck = item.likeCheck;
			});
			
			if(data.count == 0 || likeFrm.children('.postRef').val() == postRef && likeFrm.children('.likeCheck').val() == 1) {
				var html = "<p class='likePostCount'>" + data.count + "</p>";
				likeFrm.next($('.likePostCount-container')).html(html);
			}
			
			if(data.count == 0 || likeFrm.children('.commentRef').val() == commentRef && likeFrm.children('.likeCheck').val() == 2) {
				var html = "<p class='likeCount'>" + data.count + "</p>";
				likeFrm.next($('.likeCommentCount-container')).html(html);
				
				var html = "<p class='likeCount'>" + data.count + "</p>";
				likeFrm.next($('.likeReplyCount-container')).html(html);
			} 
		},
		
		error: function(xhr, status, errormsg) {
			console.log(xhr);
			console.log(status);
			console.log(errormsg);
		}
	});
}
</script>
<div class="w3-col m7">
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
	               <input type="hidden" id="postWriter" name="postWriter" value="${memberLoggedIn.getMemberNickname() }"/>
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
	        <span class="userName" style="font-size: 2em">${post.getPostWriter() }</span>&nbsp;&nbsp;
	        <span><fmt:formatDate value="${post.getPostDate()}" pattern="yy-MM-dd HH:mm"/></span>
	        
	        <!-- 게시글 좋아요를 위한 form -->
	        <c:set var="loop_flag" value="false" />
	        <c:forEach items="${myLikeList }" var="myLike">
	        	<c:if test="${not loop_flag }">
		        <c:choose>
			        <c:when test="${post.getPostNo() eq myLike }">
			        	<a href="javascript:void(0);" onclick="fn_postLike(this);" title="${post.getPostNo() }"><i class="fas fa-heart like" style="font-size: 2.3em;"></i></a>
			        	<c:set var="loop_flag" value="true" />	        
			        </c:when>
			        <c:when test="${post.getPostNo() ne myLike }">
			        	<a href="javascript:void(0);" onclick="fn_postLike(this);" title="${post.getPostNo() }"><i class="far fa-heart like" style="font-size: 2.3em;"></i></a>
				        <c:set var="loop_flag" value="true" />
			        </c:when>
		        </c:choose>
		        </c:if>
	        </c:forEach>
	        
	        <c:if test="${flagCnt eq 1 }">
	        	<a href="javascript:void(0);" onclick="fn_postLike(this);" title="${post.getPostNo() }"><i class="far fa-heart like" style="font-size: 2.3em;"></i></a>
	        </c:if>
	        <form class="likeFrm" style="display: inline-block;" method="post" action="${path }/post/likeInsertAndSelect.do">
	        	<input type="hidden" class="likeMember" name="likeMember" value="${memberLoggedIn.getMemberEmail() }"/>
	        	<input type="hidden" class="postRef" name="postRef" value="${post.getPostNo() }"/>
	        	<input type="hidden" class="commentRef" name="commentRef" value= "0"/>
	        	<input type="hidden" class="likeCheck" name="likeCheck" value="1"/>
	        </form>
	       
	        
	        <!-- 게시물 좋아요 갯수 출력 -->
	        <div class="likePostCount-container" style="display: inline-block">
				<p class='likePostCount'></p>
	        </div>
	        
	        <a href="#nothing" style="float: right"><i class="fas fa-ellipsis-v" style="font-size: 2.3em;"></i></a>
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
	    
	    
	   <div class="panel-footer">
	      <!-- 댓글 출력 -->
	      <c:forEach items="${commentList }" var="comment">
	         <c:if test='${post.getPostNo() eq comment.getPostRef() and comment.getCommentLevel() eq 1}'>
	         <div class="commentDisplay-container">
	            <a href="#"><span class="commentWriter">${comment.getCommentWriter() }</span></a>
	            <span class="commentContents">&nbsp;&nbsp;${comment.getCommentContents() }</span>
	            
	            <!-- 댓글 좋아요를 위한 form -->
            	<a href="javascript:void(0);" onclick="fn_postLike(this);" title="${comment.getCommentNo() }"><i class="far fa-heart like" style="font-size: 1.1em;"></i></a>
	        	<form class="likeFrm" style="display:inline-block" method="post" action="${path }/post/likeInsertAndSelect.do">
	            	<input type="hidden" class="likeMember" name="likeMember" value="${memberLoggedIn.getMemberEmail() }"/>
		        	<input type="hidden" class="postRef" name="postRef" value="${post.getPostNo() }"/>
		        	<input type="hidden" class="commentRef" name="commentRef" value="${comment.getCommentNo() }"/>
		        	<input type="hidden" class="likeCheck" name="likeCheck" value="2"/>
	            </form>
	            
	            <!-- 댓글 좋아요 갯수 출력 -->
		        <div class="likeCommentCount-container" style="display: inline-block">
					<p class='likeCount'>data.count</p>
		        </div>
	            
	            <button style="margin-left: 1%" class="inputReplyIcon btn btn-primary btn-sm" id="reply_commentRef" title="${comment.getPostRef() }" value="${comment.getCommentNo() }"><i class="fas fa-long-arrow-alt-down" style="font-size: 1.1em;"></i></button>
	            <div style="clear: both"></div>
	            
	            
	            <div class="reply-container"> <!-- 답글은 여기로 -->
	               <div id='${comment.getCommentNo() }' class="replyDisplay-container"> <!-- 답글 출력 -->
	
	               </div>   
	               <!-- 답글 버튼 클릭 시  답글 입력 DIV 삽입 -->
	               
	            </div>
	            
	         </div>
	         </c:if>
	         
	         <!-- replyDisplay 블록이 위의 replyDisplay-container로 붙는다 -->
	         <c:if test='${post.getPostNo() eq comment.getPostRef() and comment.getCommentLevel() eq 2}'>
	            <div title='${comment.getCommentRef() }' class='replyDisplay'>
	               <a href='#'><span class='replyWriterDisplay'>${comment.getCommentWriter()}</span></a>
	               <span>&nbsp;&nbsp;${comment.getCommentContents() }</span>
	               
	               <!-- 답글 좋아요를 위한 form -->
				   <a href="javascript:void(0);" onclick="fn_postLike(this);" title="${comment.getCommentNo() }"><i class="far fa-heart like" style="font-size: 1.1em;"></i></a>
	        	   <form class="likeFrm" style="display:inline-block" method="post" action="${path }/post/likeInsertAndSelect.do">
						<input type="hidden" class="likeMember" name="likeMember" value="${memberLoggedIn.getMemberEmail() }"/>
						<input type="hidden" class="postRef" name="postRef" value="${post.getPostNo() }"/>
						<input type="hidden" class="commentRef" name="commentRef" value="${comment.getCommentNo() }"/>
						<input type="hidden" class="likeCheck" name="likeCheck" value="2"/>
	               </form>
	               
	               <!-- 답글 좋아요 갯수 출력 -->
				   <div class="likeReplyCount-container" style="display: inline-block">
						<p class='likeCount'>data.count</p>
				   </div>
	               
	               <div style='clear: both'></div>
	            </div>
	            </c:if>
	      </c:forEach>
	      
	
	      <!-- 댓글 쓰기 -->
	      <div id="inputComment-container">
	         <form id="createCommentFrm" method="post" action="${path }/post/postCommentInsert.do">
	            <span><img id="commentProfile" class="rounded-circle" src="${path }/resources/upload/post/20180030_210021127_730.jpg"></span>
	            <input type="text" id="inputCommentTxt" name="commentContents" class="form-control" placeholder=" 댓글을 입력하세요..."/>
	            <input type="hidden" id="reply_postRef" name="postRef" value="${post.getPostNo() }"/>
	            <input type="hidden" name="commentWriter" value="${memberLoggedIn.getMemberNickname() }"/>
	            <input type="hidden" name="commentLevel" value="1"/>
	            <div style="clear: both"></div>
	         </form>
	      </div> <!-- inputComment-container -->
	      
	      
	   </div> <!-- panel-footer -->
	</div> <!-- panel -->
	
	</c:forEach>

</div>
<script>
$(document).ready(function(){
		ajax();
		var email2 = '${memberLoggedIn.memberEmail}';
		$.ajax({
			url:"${path}/friend/friednRecommendList.do",
			type:"POST",
			data:{email:email2},
			dataType:"json",
			success : function(data){
				console.log("friendList :"+friendList);
				var friendConcernTag;
				$.each(data.concernCompareList,function(i,item){
					var f_email2 = item;
					console.log("f_email2 : "+f_email2);
					for(var i =0; i<friendList.length;i++){
						if((friendList[i]==f_email2)){
							break;	
						}
						if(i==friendList.length-1){
							if(f_email2==email2){
								console.log("email2 : " + email2);
								break;
							}
							 friendConcernTag = "<tr><td>"+f_email2+"</td></tr>"; 
							 break;
						}	
					}
					$('.tablefriend').append(friendConcernTag);
					friendConcernTag;
				}); 
			}
		});
}); 
var userIdList=[] ;
var su =0;
var friendList=[];
var sock=new SockJS("<c:url value='/friendInList'/>")  /* (0) */
	/* sock.메소드 는 컨트롤러(핸들러)로 감 */
sock.onmessage = onMessage;
sock.onclose = onClose;
$(function() {
    $('.dropdown-toggle').click(function() {
        this.attr("border", none);
    })
});
function ajax() {
	var email = '${memberLoggedIn.memberEmail}';    /* (0) */
	$.ajax({
		url:"${path}/friend/selectFriendListJson.do",
		type:"POST",
		data:{email:email},
		dataType:"json",
		success : function(data){
	    	$('#myDropdown').append('<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">');
	    	$('#myDropdown').append('<button id="refresh" onclick="reFresh()">새로고침</button><br>');
	    	su=0;
			var friendListTag;
			friendList=[];
			$.each(data.list,function(i,item){
				var f_email = item; 
				var size =userIdList.length;
				friendList.push(f_email);
				for(var k =0; k<size;k++){
					console.log("userIdList[k] : "+userIdList[k]);
				    if(f_email==userIdList[k]){
						friendListTag = "<a href='#' class='w3-bar-item w3-button'>"+f_email+"<i class='fa fa-cloud'/></a><br>";
						su++;
						break;
				    }else{
				    	friendListTag = "<a href='#' class='w3-bar-item w3-button'>"+f_email+"</a><br>";
				    }
				} 
				$('#myDropdown').append(friendListTag);
			});
			$("#su").empty();
			$('#su').append(su);
		}
	});
};
function onMessage(evt){
	var userId = evt.data;
	var flag=evt.data.split("|");
	console.log("구분 : " +userId[0]);
	if(flag[0]=="1"){
		console.log("스크립트 추가한 유저 : " + flag[1]);
		if(!(userIdList.indexOf(flag[1])>=0)){
			userIdList.push(flag[1]);
			su++;
		}
		console.log("스크립트 접속후 접속자 : "+userIdList);
		/* alert("포함?"+userIdList.contains(flag[1])); */
	}
	if(flag[0]=="2"){
		console.log("스크립트 나간 유저 : " + flag[1]);
		console.log("나간후 리스트 받아오기 전 사이즈"+userIdList.length);
		if(userIdList.length !=null){
			userIdList=[];	
		}
		userIdList.push(flag[1]);
		console.log("스크립트 나간후 접속자 : "+userIdList);
	}
};
function onClose() {
	/* 이동하고 close */
	location.href="${pageContext.request.contextPath}";
	self.close();
};	
/* function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    ajax();
}; */

$(document).ready(function () {
	$('#fr').hover(
			function(){
				dell();
				ajax();
			},
			function() {
				dell();
			});
});
function reFresh() {
	dell();
};
function dell() {
    $("#myDropdown").empty();
};
function del() {
    $("#myDropdown").empty();
};
function filterFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("myDropdown");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}	
	
</script> 
<div class='w3-col m2' id='friendRecommendClass'>
	<table cellspacing='0' class='tablefriend'>
	<div class="pull-center well">
        <form class="form-inline" action="#" method="POST">
            <center>  
            <select class="form-control">
                <option>옵션1</option>
                <option>옵션2</option>
            </select>
           <div class="input-group custom-search-form">
                <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                          <i>search</i>
                        </button>
                    </span>
            </div>
        </form>
    </div>
	<tr>
		<th >회원 이메일</th>
	</tr>
	</table>
</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>