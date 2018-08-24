<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>
</jsp:include>

<style>
/* POST */
.panel {
    border: 1px solid rgb(7, 48, 110); 
    border-radius:0;
    transition: box-shadow 0.5s;
    margin: 2% 2%;
}

.panel-heading {
    color: #fff !important;
    background-color: rgb(7, 48, 110) !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}


.panel-body {
    border-bottom: 1px solid rgb(7, 48, 110);
    padding: 5% 0;
}

.panel-footer {
    background-color: #fff;
    padding: 2% 0;
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .4);
}

.panel-default > .panel-heading {
	background-image: none;
    background-color: rgb(7, 48, 110);
    color: white;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}

/* .panel-footer .btn:hover {
    border: 1px solid rgb(7, 48, 110);
    background-color: #fff;
    color: rgb(7, 48, 110);
} */

.panel-footer ul {
	list-style-type: none;
    padding: 0;
    margin: 0;
}

.panel-footer li {
	padding: 0.3em;
}

/* .panel-footer .btn {
    margin: 15px 0;
    background-color: rgb(7, 48, 110);
    color: #fff;
} */
</style>
	
<form method="post">
	<div class="panel panel-default" >
	    <div class="panel-heading">
	        <h1>회원명, 좋아요 수가 들어갈 부분</h1>
	    </div>
	    <div class="panel-body">
	        <h1>이미지</h1>
	        <h2>텍스트</h2>
	        <h3>난 패널 바디!</h3>
	    </div>
	    <div class="panel-footer">
	       	 댓글이 들어가는 panel-footer 부분
	    </div>
	</div>
</form>

</div>
</body>
</html>