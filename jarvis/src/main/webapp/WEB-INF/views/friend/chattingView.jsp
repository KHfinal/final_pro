<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- 부트브트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta charset="UTF-8"> 
<title>실시간채팅</title>

<style>
.dropbtn {
   background-color: #4CAF50;
   color: white;
   padding: 16px;
   font-size: 16px;
   border: none;
   cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

#myInput {
    border-box: box-sizing;
    background-image: url('searchicon.png');
    background-position: 14px 12px;
    background-repeat: no-repeat;
    font-size: 16px;
    padding: 14px 20px 12px 45px;
    border: none;
    border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f6f6f6;
    min-width: 230px;
    overflow: auto;
    border: 1px solid #ddd;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
</style>
<script>

var userIdList=[] ;
var sock=new SockJS("<c:url value='/friendInList'/>")
	/* sock.메소드 는 컨트롤러(핸들러)로 감 */
sock.onmessage = onMessage;
sock.onclose = onClose;

function onMessage(evt){
	
	var userId = evt.data;
	var flag=evt.data.split("|");
	alert("들어온값 : " +userId[0]);
	if(flag[0]=="1"){
		userIdList.push(flag[1]);

		alert("접속자 : "+userIdList);
		alert("email : "+"${email}");
	

		for(var i =0 ; i> userIdList.length;i++){
			if(userIdList[i]==$("#abc").val()){
				alert("똑같음");
				$('#${a.F_FRIENDEMAIL }').append("있음");	
			}
			
		} 
			
	}
	if(flag[0]=="2"){
		userIdList.splice(userIdList.indexOf(flag[1]),1);
		alert("접속자 : "+userIdList);
		
	}
};

function onClose() {
	/* 이동하고 close */
	location.href="${pageContext.request.contextPath}";
	self.close();
}
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    
    
};
function filterFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("myDropdown");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
};



</script>

</head>
<body>
<div class="dropdown">
		<button onclick="myFunction()" class="dropbtn">친구</button>
		<div id="myDropdown" class="dropdown-content">
			<input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
			<c:forEach items="${list }" var ='a'>
				<c:set var="friendEmail" value="${a.F_FRIENDEMAIL }"></c:set>
				
				<input id='val' type="hidden" value="${friendEmail}" >
				
				<a id="abc" value='1'>${friendEmail}<span id='c'></span></a>

				
				


			</c:forEach>
			
		</div>
	</div>  

</body>


</html>






















