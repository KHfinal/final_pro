<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=4">



<style>
/*
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
*/
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
/*
function resetFormElement(e) { 
	e.wrap('<form>').closest('form').get(0).reset(); // 폼으로 감싼후 지워준다.
	e.unwrap();
}
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    
}
*/
/*========소켓용 ==========*/

/* function filterFunction() {
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


$(document).ready(function(){
	
	var email = '${memberLoggedIn.memberEmail}';
	alert(email);
	$.ajax({
		url:"${path}/friend/selectFriendListJson.do",
		type:"POST",
		data:{email:email},
		dataType:"json",
		success : function(data){
			var friendList;
			
			$.each(data.list,function(i,item){
				friendList = "<a href='#' >"+item.F_FRIENDEMAIL+"<label > 있음</label></a>";
				$('#myDropdown').append(friendList);
				}); 
			
			
		},
		
	});
});
$(document).ready(function () {
	alert("소켓 시작");
	$.ajax({
		url:'${path}/chatting.do',
		type:"POST",
		succes:function (data) {
			
		});
	});
	
	var sock=new SockJS("<c:url value='/friendInList'/>")
	
	sock.onmessage=onMessage;
	alert("sock ");
	
	
	
	function onMessage(evt)
	{
		var host=null;
		var strArray=evt.data.split("|");
		var userName=null;
		var message=null;
		alert(strArray); */
		/* 데이터가 있으면 */
	/* 	if(strArray.length>1)
		{
			//채팅 메세지를 구현
			userName=strArray[0];//접속자 아이디
			host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
			//실제아이피주소만 남기기
			var ck_host='${host}';
			console.log(host);
			console.log(ck_host);
			if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
			{
				//자기자신 메세지
				var printHTML="<div class='well' style='margin-left:30%'>";
				printHTML+="<div class='alert alert-info'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>["+userName+"] : "+message+"</strong>";
				printHTML+="</div>";
				printHTML+="</div>";
				$("#chatdata").append(printHTML);
								
				
			}
		}
		
	};
}); */


</script>
	
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
	    <div class="panel-footer">
			<form id="createCommentFrm" method="post" action="">
				<span><img id="commentProfil" class="rounded-circle" src="${path }/resources/upload/post/20180831_190832689_634.jpg"></span>
				<input type="text" id="inputCommentTxt" name="inputCommentTxt" class="form-control" placeholder=" 댓글을 입력하세요..."/>
				<button id="commentSubmitBtn" class="btn btn-primary btn-sm" type="submit">전송</button>
				<div style="clear: both"></div>
			</form>
	    </div>
	</div>
	</c:forEach>
	
	<style>
	
	
	</style>
	
	
	
	
	
	
	
	<!--친구 현황  -->
	<div class="container">
  <h2>Fading Modal</h2>
  <p>Add the "fade" class to the modal container if you want the modal to fade in on open and fade out on close.</p>

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

	<form id='listFrom' class="dropdown" action='${path}/chatting.do'>
		<div id="myDropdown" class="dropdown-content">
			<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
			<input type="hidden" name="email" value="${memberLoggedIn.memberEmail}">
		</div>
		<button type="submit" class="btn btn-primary text-center">친구이동</button> 
	</form>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>