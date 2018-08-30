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
<style>

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
        	<input type="hidden" name="userEmail" value="kkh">
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
<script>
	$(function(){
		calendarLoad();
	})
	function calendarLoad(){
		$('#calendar').fullCalendar({
			dayClick: function(date){
				var year = date._d.getFullYear();
				var month = date._d.getMonth()<10 ? '0'+(date._d.getMonth()+1) : date._d.getMonth();
				var date = date._d.getDate()<10 ? '0'+date._d.getDate() : date._d.getDate();
				var day = year+"-"+month+"-"+date;
				$("#registration").modal("show");
				$("#date_start").val(day);
				$("#date_end").val(day);
				$("#content").val("");
				$("#title").val("");
			}
		});
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
		$("#inputFrm").submit();
	}
</script>