<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/lumen/bootstrap.min.css">
<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">

<!-- 스타일 -->
<style>
#user .avatar {
    width:60px;
	}
#user .avatar > img{
	width:50px;
	height:50px;
	border-radius:10%;
	}
/*Card*/
#user .panel-thumb{

text-align:center;	
	}
#user .panel-thumb .avatar-card {
text-align:center;
height:200px;
margin:auto;
overflow:hidden;
}	
#user .panel-thumb .avatar-card > img{
	max-width:200px;
	max-height:200px;
	}
#user .panel-table .panel-body .table-bordered > thead > tr > th{
  text-align:left;
}
#user .panel-table .panel-footer {
  height:60px;
  padding:0px;
}

</style>
<script>
	var listSock=new SockJS("<c:url value='/friendInList'/>");
</script>

<!--바디 -->
<div class="container" style="margin-top:20px;">
  <div id="user">
  <div class="panel panel-primary panel-table animated slideInDown" style="width: 50%;">
      <div class="panel-body">
     <div class="tab-content">
      <div role="tabpanel" class="tab-pane active" id="list">
       <table class="table table-striped table-bordered table-list">
         <thead>
        
          
         <c:forEach items="${list}" var="a" varStatus="vs">
            <tr class='ok'>
	            <td class="avatar"><img src="${path }/resources/upload/member/${a.사진 }"></td>
	            <td >${a.f_friend_email}</td>
	            
	            <c:choose>
					<c:when test="${memberLoggedIn.userId == a.이름}">green </c:when>
					<c:when test="${memberLoggedIn.userId != a.이름}">gray</c:when>
				</c:choose>
            </tr>
        </c:forEach> 
          </thead>
        </table>
      </div><!-- END id="list" -->  
      </div><!-- END id="thumb" -->
     </div><!-- END tab-content --> 
  </div>
   
   
  <div class="panel-footer text-center">
   		<ul class="pagination">
	 	  <li ><a>Â«</a></li>
		   <li class="active"><a href="#">1</a></li>
           <li ><a href="#">2</a></li>
           <li ><a href="#">3</a></li>
		   <li ><a></a></li>
         </ul>
   </div>
  </div>
</div>


