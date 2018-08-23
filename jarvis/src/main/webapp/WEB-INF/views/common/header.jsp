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
<title>Jarvis social header</title>
	<link rel="stylesheet" href="${path }/resources/fonts/font-awesome.min.css">
	<link rel="stylesheet" href="${path }/resources/css/styles.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Audiowide|Cabin+Sketch|Monoton|Orbitron" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
	.headBar table{
		background-color: #272D38;
		text-align: center;
		color : white;
		font-family: 'Monoton', cursive;
		/*font-family: 'Orbitron', sans-serif;
	 	font-family: 'Audiowide', cursive;*/
		/* font-family: 'Cabin Sketch', cursive; */
		font-size: 2.5vw;

	}
	.table{
		height:0.9em;
	}
</style>
<header>
	<div class="container-fluid headBar">
		<table class="table">
			<tr>
				<td style="width:20%">jarvis</td>
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
<body>


