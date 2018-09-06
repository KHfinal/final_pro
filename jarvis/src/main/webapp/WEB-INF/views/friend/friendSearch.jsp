<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath }" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function friend_request(data,data2){
		location.href="${path}/friend/friendRequest.do?myEmail="+data+"&fEmail="+data2;
	}
	function friend_waiting(){
		alert("친구요청 대기중입니다");
	}
	function friend_agree(data){
		location.href="${path}/friend/friendAgree.do?fEmail="+data;
	}
	function friend_refuse(data){
		location.href="${path}/friend/friendRefuse.do?fEmail="+data;
	}
</script>
<style>
	div{border:1px solid black;}	
</style>

<div class="row">
	<div class="col-9">
		아이디 : <input type="text" id="friendSearch" class="form-control form-control-sm" placeholder="친구검색">
		<div class="list-group">
			<table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>이메일</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>연락처</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="m"> 
            <c:if test="${m.memberEmail!=memberLoggedIn.memberEmail }">
            <tr>
                <td>${m.memberEmail}<input type="hidden" class="fri" value="${m.memberEmail}"/></td>
                <td>${m.memberName}</td>
                <td>${m.memberNickname}</td>
                <td>${m.phone}</td>
                <td><button type="button" id="friend_add" onclick="friend_request('${memberLoggedIn.memberEmail }','${m.memberEmail}')">친구추가</button></td>
                <%-- <c:forEach items="${requestList }" var="re" >
	              	<c:if test="${m.memberEmail!=re.f_friend_email }">
	                	<td><button type="button" id="friend_add" onclick="friend_request('${memberLoggedIn.memberEmail }','${m.memberEmail}')">친구추가</button></td>
	             	</c:if> 
	                <c:if test="${m.memberEmail==re.f_friend_email }">
	                	<td><button onclick="friend_waiting">친구요청중</button></td>
	            	</c:if>  
            	</c:forEach> --%>
            </tr>
            </c:if>
            </c:forEach>
        	</table>
		</div>
	</div>
	<div class="col-3">
		아이디 : <input type="text" id="friendSearch" class="form-control form-control-sm" placeholder="친구검색">
		<div class="list-group">
			<table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>친구요청</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${requestList}" var="r"> 
            <tr>
                <td>${r.f_friend_email}</td>
                <td><button type="button" id="friend_add" onclick="friend_agree('${r.f_friend_email}');">수락</button></td>
                <td><button type="button" id="friend_add" onclick="friend_refuse('${r.f_friend_email}');">거절</button></td>
            </tr>
            </c:forEach>
        	</table>
		</div>
	</div>
</div>
</body>
</html>