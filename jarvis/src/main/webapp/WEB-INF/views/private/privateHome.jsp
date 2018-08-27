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


<!-- 일정등록 Modal -->
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 등록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="${path }/schedule/insertScedule.do">
        	날짜 : <input type="date">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
	$(function(){
		calendarLoad();
	})
	function calendarLoad(){
		$('#calendar').fullCalendar({
			dayClick: function(date){
				console.log(date._d);
				$("#myModal").modal();
			}
		});
	}
</script>