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
<script src="${path }/resources/fullcalendar/gcal.js"></script>
<script src="${path }/resources/fullcalendar/ko.js"></script>
<style>
    .fc-sat { color:#0000FF; }     /* 토요일 */
    .fc-sun { color:#FF0000; }    /* 일요일 */

</style>
<div id="calendar"></div>


<!-- 일정등록 Modal -->
<div class="modal" id="registration">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 등록</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="${path }/schedule/insertSchedule.do" id="inputFrm">
        	<input type="hidden" name="userEmail" value="${memberLoggedIn.memberEmail }">
	        <table class="table">
	        	<tr >
	        		<th> 제목  </th>
	        		<td><input class="form-control" type="text" placeholder="일정을 입력하세요" name="title" id="title"></td>
	        	</tr>
	        	<tr>
	        		<th> 시작 날짜 </th>
	        		<td><input class="form-control" type="date" id="date_start" name = "startDate"></td>	        	
	        	</tr>
	        	<tr>
	        		<th> 종료 날짜 </th>
	        		<td><input class="form-control" type="date" id="date_end" name = "endDate"></td>
	        	</tr>
	        	<tr>
	        		<th> 내용  </th>
	        		<td> <textarea rows="5" name="content" id="content" class="form-control"></textarea></td>
	        	</tr>
	        </table>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button id="add" type="submit" class="btn btn-success" data-dismiss="modal" onclick="fn_validate()">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
 <!-- 일정수정Modal -->
<div class="modal" id="modify">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="${path }/schedule/modifySchedule.do" id="inputFrm">
        	<input type="hidden" name="userEmail" value="${memberLoggedIn.memberEmail }">
	        <table class="table">
	        	<tr >
	        		<th> 제목  </th>
	        		<td><input class="form-control" type="text" placeholder="일정을 입력하세요" name="title" id="modtitle"></td>
	        	</tr>
	        	<tr>
	        		<th> 시작 날짜 </th>
	        		<td><input class="form-control" type="date" id="moddate_start" name = "startDate"></td>	        	
	        	</tr>
	        	<tr>
	        		<th> 종료 날짜 </th>
	        		<td><input class="form-control" type="date" id="moddate_end" name = "endDate"></td>
	        	</tr>
	        	<tr>
	        		<th> 내용  </th>
	        		<td> <textarea rows="5" name="content" id="modcontent" class="form-control"></textarea></td>
	        	</tr>
	        </table>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-success" data-dismiss="modal" onclick="fn_validate()">수정</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
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
				var year = date._d.getFullYear();
				var month = date._d.getMonth()<10 ? '0'+(date._d.getMonth()+1) : date._d.getMonth();
				var date1 = date._d.getDate()<10 ? '0'+date._d.getDate() : date._d.getDate();
				var day = year+"-"+month+"-"+date1;
				console.log(date);
				console.log(date._d.getHours());
				console.log(date._d.getMinutes());
				console.log(date._d.toISOString());
				$("#registration").modal("show");
				$("#date_start").val(day);
				$("#date_end").val(day);
				$("#content").val("");
				$("#title").val("");
			},
			eventClick:function(calEvent, jsEvent, view) {
				
				
				
				$("#modify").modal("show");
			},
			eventLimit: true, // for all non-agenda views
			  views: {
			    agenda: {
			      eventLimit: 6 // adjust to 6 only for agendaWeek/agendaDay
			    }
			 },
			googleCalendarApiKey:"AIzaSyB8U2-71YAEPsxssN8OG5hwI-64TLORxgQ"
		});
		$('#calendar').fullCalendar('addEventSource',${events});
	}
	function fn_validate(){
		if($("#title").val().trim()==0){
			alert("일정 제목을 입력해주세요.");
			return false;
		}
		if($("#date_end").val() < $("#date_start").val()){
			alert("일정종료날짜가 시작날짜보다 작습니다.");
			return false;
		}
		console.log($("#date_start").val());
		console.log($("#date_end").val());
		
		$("#inputFrm").submit(); 
	}
</script>