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
<title>친구 리스트</title>

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


/*=================  */

i {  vertical-align: middle; }
.table-users tbody tr:hover {
	cursor: pointer;
	background-color: #eee;
}
.nav-user-photo {
     vertical-align: middle;
}
.user_panel {
    width: 50%;
}

/*=================  */

</style>
<script>
$(function(){

	var bb = $('.list1').html();
	if(bb==='a')
	{
	    alert('맞음');
	    $('.var1').append(a);
	}
	else
	{
	    alert('틀림');
	}
	
});
var memberIn ;
var userIdList=[] ;
var sock=new SockJS("<c:url value='/friendInList'/>")
	/* sock.메소드 는 컨트롤러(핸들러)로 감 */
sock.onmessage = onMessage;
sock.onclose = onClose;

function onMessage(evt){
	
	var userId = evt.data;
	var flag=evt.data.split("|");
	if(flag[0]=="1"){
		userIdList.push(flag[1]);
		alert("현재 접속자 : "+userIdList);
		
		if(userIdList ==="'"+flag[1]+"'")
		{
		    alert('맞음');
		    $('.'+flag[1]).append("들어옴");
		}
		else
		{
		    alert('틀림');
		}
			
	}
	if(flag[0]=="2"){
		userIdList.splice(userIdList.indexOf(flag[1]),1);
		alert("현재 접속자  : "+userIdList);
		
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

$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myList li").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
/* $(document).ready(function(){
	   
	   var email = '${memberLoggedIn.memberEmail}';
	   alert(email);
	   $.ajax({
	      url:"${path}/friend/selectFriendListJson.do",
	      type:"POST",
	      data:{email:email},
	      dataType:"json",
	      success : function(data){
	         var friendList;
	         
	         $.each(data.list,function(i,item){
	            friendList = "<a href='#' >"+item.F_FRIENDEMAIL+"<label > 있음</label></a>";
	            $('#tt').append(friendList);
	            }); 
	         
	         
	      },
	      
	   });
});  */



</script>

</head>
<body style="width: 400px;">

	

<div class="container" >
	<div class="row" >
        <div class="panel panel-default user_panel">
            <div class="panel-heading">
                <h3 class="panel-title">User List</h3>
            </div>
            <div class="panel-body">
				<div class="table-container">
                    <table class="table-users table" border="0">
                        <tbody >
                        <c:forEach items="${list }" var ='a'>
                            <tr>
	                                <td class="${a.F_FRIENDEMAIL }" > ${a.F_FRIENDEMAIL }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

	</div>
</div>
</body>


</html>






















