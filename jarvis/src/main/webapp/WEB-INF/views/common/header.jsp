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

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Audiowide|Cabin+Sketch|Monoton|Orbitron" rel="stylesheet">

</head>

<script>

$(function() {
    $('.dropdown-toggle').click(function() {
        this.attr("border", none);
    })
})
</script>
<body>

<header>
	<div class="container-fluid headBar header">
		<table class="table">
			<tr>
				<td style="width:20%"><a href="${path }/post/socialHomeView.do" style="text-decoration: none;">jarvis</a></td>
				<td>${param.title } (${memberLoggedIn.memberNickname })</td>
				<c:if test="${param.title eq 'social'}">
				<td style="width:10%"><a href="${path }/schedule/privateHome.do">P ></a></td>
				</c:if>
				<c:if test="${param.title eq 'private'}">
				<td style="width:10%"><a href="${path }/post/socialHomeView.do">S ></a></td>
				</c:if>
			</tr>
		</table>
	</div>
</header>

<!-- SIDE BAR -->
<nav class="side-nav sticky-top" style="float: left;">
    <ul>
        <li>
            <a href="#">
                <span><i class="fa fa-user"></i></span>
                <span>Mypage</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span><i class="fas fa-user-friends"></i></span>
                <span>friend List</span>
            </a>
        </li>
        <li>
            <a href="${path }/group/groupList.do">
                <span><i class="fas fa-users"></i></span>
                <span>Group List</span>
            </a>
        </li>
        <li>
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span><i class="fa fa-bookmark"></i></span>
                <span>Bookmark</span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <li><a class="dropdown-item" href="#">Link1</a></li>
                <li><a class="dropdown-item" href="#">Link1</a></li>
                <li><a class="dropdown-item" href="#">Link1</a></li>
            </ul>
        </li>
        <li>
            <a href="${path }/chat/chattingView.do">
                <span><i class="fas fa-users"></i></span>
                <span>Messenger</span>
            </a>
        </li>
    </ul>
</nav>

<div class="main-content mt-0" style="padding-top: 0px; padding-left: 0px;">


