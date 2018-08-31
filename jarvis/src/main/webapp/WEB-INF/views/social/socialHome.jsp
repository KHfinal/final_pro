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
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    
}
/*========소켓용 ==========*/
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
/* $(document).ready(function () {
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

	<button class="btn btn-primary" id="insertBtn" data-toggle="modal" data-target="#postModal">게시글 등록</button>
	
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
	        		<img class="imgSize" src="${path }/resources/upload/post/${attach.getRenamedFileName() }">
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
	
	<!--친구 현황  -->
	<div class="dropdown">
		<button onclick="myFunction()" class="dropbtn">친구</button>
		<div id="myDropdown" class="dropdown-content">
			<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
		</div>
	</div>  
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>