<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
//SocketJS 채팅구현
var sock=new SockJS("<c:url value='/chatting'/>")
	sock.onmessage=onMessage;
	sock.onclose=onClose;
	
var today=null;

	$(function(){
		//전송버튼을 눌렀을때 이벤트 처리
		$('#sendBtn').click(function(){
			sendMessage();//우리가 구현할 함수
			$('#message').val('');
			$("#message").focus();
			$("#chatdata").animate({
				scrollTop: $('#chatdata').get(0).scrollHeight
			}, 10);
		});
		$('#exitBtn').click(function(){
			sock.onclose();
		});
	});
	function sendMessage()
	{
		sock.send($('#message').val());
		//handler객체 거기의 handlerTextMessage메소드가 실행
	};
	function onMessage(evt)
	{
		var data=evt.data;//TextMessage생성 매게변수(아이디|값|아이피)
		var host=null;
		var strArray=data.split("|");
		var userName=null;
		var message=null;
		for(i=0;i<strArray.length;i++)
		{
			console.log("strArray["+i+"] : "+strArray[i]);	
		}
		
		if(strArray.length>1)
		{
			//실제 채팅메세지
			userName=strArray[0];//접속자 아이디
			message=strArray[1];//전송내용
			host=strArray[2].substr(1,strArray[2].indexOf(":")-1);//실제아이피주소만 남기기
			today=new Date();
			printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"today.getMinutes()+":"+today.getSecondes();
			console.log(printDate);
			
			var ck_host='${host}';
			console.log(host);
			console.log(ch_host);
			
			if(host==ck_host||(host==0&&ch_host.includes('0:0:')))
			{
				//자기자신 메세지
				var printHTML="<div class='well' style='margin-left:30%'>";
				printHTML+="<div class='alert alert-info'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>["+userName+"] : "+message+"</strong>";
				printHtml+="</div>";
				printHtml+="</div>";
				$("#chatdata").append(printHTML);
			}
			else
			{
				//타인의 메세지
				var printHTML="<div class='well' style='margin-left:-5%;margin-right:30%'>";
				printHTML+="<div class='alert alert-warning'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>["+userName+"] : "+message+"</strong>";
				printHtml+="</div>";
				printHtml+="</div>";
				$("#chatdata").append(printHTML);
			}
		}
		else
		{
			//나가기 들어온 사람 알리기
			today=new Date();
			printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"today.getMinutes()+":"+today.getSecondes();
			message=strArray[0];
			var printHTML="<div class='well' style='margin-left:-5%;margin-right:30%'>";
			printHTML+="<div class='alert alert-danger'>";
			printHTML+="<sub>"+printDate+"</sub><br/>";
			printHTML+="<strong>[서버관리자] : "+message+"</strong>";
			printHtml+="</div>";
			printHtml+="</div>";
			$("#chatdata").append(printHTML);
		}
	};
	function onClose()
	{
		location.href='${pageContext.request.contextPath}';
		self.close();
	}
</script>
<style>
	div#chatdata{
		height:650px;
	}
	div.chatting-cintainer{
		height:770px;
		border:1px solid gray;
		padding:0px;
	}
	div.chatContents{
		height: 87%;
	}
	div.chatInput-container{
		height: 9%;
		magin:0px;
		padding:0px;
	}
	textarea.chatInput{
		width:100%;
		height: 100%;
	}
</style>
<script>
$(document).ready(function(){
    $("#searchBtn").click(function(){
        $("#m_search").slideToggle();
    });
});
</script>


<div class="row" style="border:1px solid gray; padding:10px; height:40px;">
	<div class="col-2"><strong>Messenger</strong></div>
	<div class="col-10">OOO님과의 채팅입니다</div>
	<div class="col-2"></div>
</div>
<div class="row">
	<!-- 대화목록 -->
	<div class="chatting-cintainer col-2 pl-4 pr-4 pt-3">
		<input type="text" id="friendSearch" class="form-control form-control-sm" placeholder="친구검색">
		<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action">대화방1</a>
			<a href="#" class="list-group-item list-group-item-action">대화방2</a>
			<a href="#" class="list-group-item list-group-item-action">대화방3</a>
		</div>
	</div>
	<!-- 채팅창 -->
	<div class="chatting-cintainer col-8">
		<input id="m_search" class="ml-5 mt-3" type="text" placeholder="메세지 검색" style="width:80%;">
		<button id="searchBtn" style="padding:0;">
			<img src="${path }/resources/img/searchIcon.PNG" style="width:30px;height:30px;">
		</button>
			<div class="chatInput-container">
				<div class="panel panel-default" id="chat_panel">
					<div id="chatdata" class="panel-body"></div>
				</div>
				<div class="input-group">
					<textarea name="message" id="message" class="chatInput form-control" placeholder="메세지를 입력하세요.."></textarea>
					<div class="input-group-append">
						<button class="btn" style="background-color:white;" type="button">
							<img class="btn-img" src="${path }/resources/img/camera.png" style="width:50px;height:50px;">
						</button>  
						<button class="btn btn-primary" type="button" id='sendBtn'>보내기</button>  
					</div>
				</div>
			</div>

	</div>
	<!-- 친구목록 -->
	<div class="chatting-cintainer col-2">
		<div class="form-group">
			<input type="text" id="friendSearch" placeholder="친구검색">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">친구1</a>
				<a href="#" class="list-group-item list-group-item-action">친구2</a>
				<a href="#" class="list-group-item list-group-item-action">친구3</a>
			</div>
		</div>
	</div>
	
	
</div>

</body>
</html>