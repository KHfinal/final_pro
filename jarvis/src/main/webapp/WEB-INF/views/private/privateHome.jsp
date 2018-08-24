<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="private" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/fullcalendar/fullcalendar.css">
<script src="${path }/resources/fullcalendar/moment.js"></script>
<script src="${path }/resources/fullcalendar/fullcalendar.js"></script>

<div id="calendar"></div>

<script>
	$(function(){
		$('#calendar').fullCalendar({
			dayClick: function(date){
			}
		});
	})
</script>