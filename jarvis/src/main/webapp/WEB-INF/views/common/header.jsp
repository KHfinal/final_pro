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
	<!-- 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
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
				<td style="width:20%"><a href="${path }/page/social.do" style="text-decoration: none;">jarvis</a></td>
				<td>${param.title }</td>
				<c:if test="${param.title eq 'social'}">
				<td style="width:10%"><a href="${path }/page/private.do">P ></a></td>
				</c:if>
				<c:if test="${param.title eq 'private'}">
				<td style="width:10%"><a href="${path }/page/social.do">S ></a></td>
				</c:if>
			</tr>
		</table>
	</div>
</header>

<!-- SIDE BAR -->
<nav class="side-nav">
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
            <a href="#">
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
    </ul>
</nav>

<div class="main-content">


