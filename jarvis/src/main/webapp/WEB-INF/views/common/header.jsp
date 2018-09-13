<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jarvis social header</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="${path }/resources/css/common.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Audiowide|Cabin+Sketch|Monoton|Orbitron" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
</head>


<style>
	html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<header>
	<!-- 상담 헤더  -->
	<div class="w3-top">
	 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
	  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>JARVIS</a>
	  <a href="${path }/post/socialHomeView.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
	  <div id='fr' class="w3-dropdown-hover w3-hide-small">
	    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-user"></i><span id='su' class="w3-badge w3-right w3-small w3-green">0</span></button>     
	    <div class="w3-dropdown-content w3-card-4 w3-bar-block dropdown" style="width:300px" id="myDropdown" >
	   
	    </div>
	  </div>
	  <a href="${path }/chat/chattingView.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
	  <c:if test="${memberLoggedIn.memberEmail  eq 'admin'}">
	  <div class="w3-dropdown-hover w3-hide-small">
	  <button class="w3-button w3-padding-large" title="Notifications">
	    	<i class="fas fa-edit"></i>
	   </button>
	  <div class="w3-dropdown-content w3-card-4 w3-bar-block">
	      <a href="${path }/admin/customizing.do" class="w3-bar-item w3-button">홈페이지 커스터마이징</a>
	      <a href="${path }/admin/warningContent.do" class="w3-bar-item w3-button">신고 내역보기</a>
	      <a href="${path }/admin/memberAdministration.do" class="w3-bar-item w3-button">회원관리</a>
	    </div>
	   </div>
	  </c:if>
	  <div class="w3-dropdown-hover w3-hide-small">
	    <button class="w3-button w3-padding-large" title="Notifications">
	    	<i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">4</span>
	    </button>     
	    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
	    <c:forEach items="${requestList1}" var="r1">
	      <a href="#" class="w3-bar-item w3-button">
	      	${r1 }
	      	<button type="button" id="friend_agree" onclick="friend_agree('${r1 }');">수락</button>
	      	<button type="button" id="friend_refuse1" onclick="friend_refuse('${r1 }');">거절</button>
	      </a>
	    </c:forEach>
	      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
	      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
	    </div>
	  </div>
	  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
	    <img src="${path}/resources/profileImg/${memberLoggedIn.memberPFP}" class="w3-circle" style="height:23px;width:23px" alt="Avatar">
	  </a>
	  <a href="${path }/member/logout.do" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="logout">
	   	<i class="fas fa-sign-out-alt"></i>
	  </a>
	 </div>
	</div>
	
	<!-- Navbar on small screens 화면이 작아졌을 때의 상단 헤더 메뉴목록 형태로 바뀜-->
	<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
	</div>
</header>


<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">
  <!-- The Grid -->
  <div class="w3-row">
    <!-- 사이드 메뉴들 div 시작부분 -->
    <div class="w3-col m3">
      <!-- 프로필 div-->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">${memberLoggedIn.memberName }님의 Profile</h4>
         <p class="w3-center"><img src="${path}/resources/profileImg/${memberLoggedIn.memberPFP}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${memberLoggedIn.memberName }</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> London, UK</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
        </div>
      </div>
      <br>
      
      <!-- 메뉴 DIV -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="selectGroup('selectGroup');" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>Groups</button>
          <div id="selectGroup" class="w3-hide w3-container">
            <button onclick="goGroup();" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> Group List</button>
            <button onclick="goGroup();" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Group</button>
          </div>
          <button onclick="goCalendar()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <button onclick="goFriend()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Friends</button>

        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">News</span>
            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
            <span class="w3-tag w3-small w3-theme-d2">Games</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Design</span>
            <span class="w3-tag w3-small w3-theme-l4">Art</span>
            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          </p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- 사이드 메뉴 부분 종료 DIV -->
    </div>
<script>
	function goCalendar(){
		location.href="${path}/schedule/privateHome.do";
	}
	function goFriend(){
		location.href="${path}/friend/friendView.do";
	}
	function goGroup(){
		location.href="${path}/group/groupList.do";
	}
	function selectGroup(id) {
	    var x = document.getElementById(id);
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-theme-d1";
	    } else { 
	        x.className = x.className.replace("w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-theme-d1", "");
	    }
	}
</script>

