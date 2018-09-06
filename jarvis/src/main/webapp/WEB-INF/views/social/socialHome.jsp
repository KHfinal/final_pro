<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="kh.mark.jarvis.member.model.vo.Member" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>

<c:set var="path" value="<%=request.getContextPath()%>"/>



<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="social" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/socialHome.css?ver=11111">


<script>

function readURL(input) {
   for(var i=0; i<input.files.length; i++) {
       if (input.files[i]) {
          var reader = new FileReader();
   
          reader.onload = function (e) {
             var img = $('<img id="imgDisplay" class="img-thumbnail">');
             img.attr('src', e.target.result);
             img.appendTo('#imgDisplayContainer');
          }
          reader.readAsDataURL(input.files[i]);
       }
   }
}

$(function() {
   // 게시글 등록
    $("#imgInput").on('change', function(){
       ext = $(this).val().split(".").pop().toLowerCase(); 
       
       if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
          resetFormElement($(this)) // resetFormElement실행
          alert('이미지 파일이 아닙니다.');
       } else {
          readURL(this);   
       }
    });
   
   /* 댓글 input 엔터 이벤트 */
   $('.inputCommentTxt').keydown(function(e) {
      if(e.keyCode == 13) {
         $('.createCommentFrm').submit();
      }
   });
   
   /* reply 아이콘 클릭. 답글 달기! */ 
   $('.inputReplyIcon').click(function() {
      
      /* var replyPostRef = $('#reply_postRef').val(); */
      var replyPostRef = $(this).attr("title");
      var replyCommentRef = $(this).val();
      
      var div = $("<div class='replyInput'></div>");
      
      console.log(replyPostRef);
      console.log(replyCommentRef);
      
      /* 답글 출력 */
      /*
      var html1 = "<a href='#'><span class='replyWriterDisplay'>comment.getCommentWriter()</span></a>";
      html1 += "<span class='replyContentsDisplay'>&nbsp;&nbsp;comment.getCommentContents()</span>";
      html1 += "<a><i class='far fa-thumbs-up' style='font-size: 1.1em; margin-right: 1.5%'></i></a>";
      html1 += "<div style='clear: both'></div>";
      */
      
      /* 답글 입력 */
      var html = "<form class='createCommentFrm' method='post' action='${path }/post/postCommentInsert.do'>";
      html += "<input type='hidden' name='commentWriter' value='${memberLoggedIn.getMemberNickname() }'/>";
      html += "<input type='hidden' name='postRef' value='" + replyPostRef + "'/>";
      html += "<input type='hidden' name='commentLevel' value='2'/>";
      html += "<input type='hidden' name='commentRef' value='" + replyCommentRef + "'/>";
      html += "<span><img class='replyProfile rounded-circle' src='${path }/resources/upload/post/20180030_210021127_730.jpg'></span>";
      html += "<input type='text' name='commentContents' class='inputReplyTxt form-control' placeholder=' 답글을 입력하세요...'/>";
      html += "<div style='clear: both'></div></form>";
      
      /*
      div1.html(html1);
      div1.appendTo($(this).parent().children('.reply-container').children('.replyDisplay-container'));
      */
      
      div.html(html);
      
      div.appendTo($(this).parent().children('.reply-container'));
      
      $(this).off('click');
      
   });
   
   
   $('.replyDisplay').each(function() {
       var reply=$(this);
       
       console.log(reply);
       console.log(reply.attr('title'));
       
       $('.replyDisplay-container').each(function(){
         console.log("id = " + $(this).attr("id")); 
         console.log("title = " + reply.attr('title'));
         
          if($(this).attr('id') == reply.attr('title')) {
             $(this).append(reply);
          }
       });
    });
});




</script>


   <!-- 게시글 등록 미리보기. 클릭시 #postModal이 연결 돼 실제 입력창 나타난다. -->
   <div id="createPostContainer" data-toggle="modal" data-target="#postModal">
      <div class="modal-header">
         <h4 class="modal-title">Welcome to Jarvis</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <div class="modal-body">
         <textarea rows="5" id="fakePostContents" class="form-control" name="postContents" placeholder="문구 입력..." disabled></textarea>
      </div>
   </div>

   
   <!-- 게시글 등록 -->
   <div class="modal fade" id="postModal">
      <div class="modal-dialog modal-lg">
         <div class="modal-content">
            
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">게시물 올리기</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
                        
            <!-- Modal body -->
            <form id="createPostFrm" method="post" action="${path }/post/insertPost.do" enctype="multipart/form-data">
               <div class="modal-body">
                  <input type="hidden" id="postWriter" name="postWriter" value="${memberLoggedIn.getMemberNickname() }"/>
                  <textarea class="form-control" rows="5" id="postContents" name="postContents" placeholder="문구 입력..."></textarea>
                  <hr>
                  
                  <!-- 이미지 업로드 -->
                  <div id="imgDisplayContainer"></div>
                  <hr>
                  
                  <div class="privacyBoundContainer">
                      <label for="privacyBound" style="display: inline;">공개 범위</label>
                      <select class="form-control" id="privacyBound" name="privacyBound">
                         <option value="public">전체 보기</option>
                         <option value="friend">친구만</option>
                         <option value="private">나만 보기</option>
                      </select>
                  </div>
                  
                  <div class="filebox"> <label for="imgInput">업로드</label> <input type="file" id="imgInput" name="upFile" multiple> </div>
               </div>
               
               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="submit" class="btn btn-primary text-center">등록하기</button>
                  <input type="reset" class="btn btn-danger text-center" value="취소" data-dismiss="modal"/>
               </div>
            </form>
         </div>
      </div>
   </div>
   
   <hr>
   
   <!-- 게시물 출력 -->
   <c:forEach items="${postList}" var="post" varStatus="vs">
   <div class="panel panel-default" >
       <div class="panel-heading">
           <span class="userName" style="font-size: 1.5em">${post.getPostWriter() }</span>&nbsp;&nbsp;
           <span><fmt:formatDate value="${post.getPostDate()}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
       </div>
       <div class="panel-body">
          <div id="postContentsContainer">
             <pre>${post.getPostContents() }</pre>
         </div>
          <c:forEach items="${attachmentList }" var="attach" varStatus="vs">
             <c:if test='${post.getPostNo() == attach.getPostNo() }'>
                <div class="postAttachContainer">
                    <img class="imgSize img-thumbnail" src="${path }/resources/upload/post/${attach.getRenamedFileName() }">
                 </div>
              </c:if>
           </c:forEach>
           <div style="clear: both"></div>
       </div>
       
       
      <div class="panel-footer">
         <!-- 댓글 출력 -->
         <c:forEach items="${commentList }" var="comment">
            <c:if test='${post.getPostNo() eq comment.getPostRef() and comment.getCommentLevel() eq 1}'>
            <div class="commentDisplay-container">
               <a href="#"><span class="commentWriter">${comment.getCommentWriter() }</span></a>
               <span class="commentContents">&nbsp;&nbsp;${comment.getCommentContents() }</span>
               <a><i class="far fa-thumbs-up" style="font-size: 1.1em; margin-right: 1.5%"></i></a>
               <%-- <input type="hidden" name="postRef" value="${post.getPostNo() }"/> --%>
               <button class="inputReplyIcon btn btn-primary btn-sm" id="reply_commentRef" title="${comment.getPostRef() }" value="${comment.getCommentNo() }"><i class="fas fa-long-arrow-alt-down" style="font-size: 1.1em"></i></button>
               <div style="clear: both"></div>
               
               
               <div class="reply-container"> <!-- 답글은 여기로 -->
                  <div id='${comment.getCommentNo() }' class="replyDisplay-container"> <!-- 답글 출력 -->

                  </div>   
                  <!-- 이곳에 답글 입력 -->
                  
               </div>
               
            </div>
            </c:if>
            
            <!-- replyDisplay 블록이 위의 replyDisplay-container로 붙는다 -->
            <c:if test='${post.getPostNo() eq comment.getPostRef() and comment.getCommentLevel() eq 2}'>
               <div title='${comment.getCommentRef() }' class='replyDisplay'>
                  <a href='#'><span class='replyWriterDisplay'>${comment.getCommentWriter()}</span></a>
                  <span>&nbsp;&nbsp;${comment.getCommentContents() }</span>
                  <a><i class='far fa-thumbs-up' style='font-size: 1.1em; margin-left: 1.5%; margin-right: 1.5%'></i></a>
                  <div style='clear: both'></div>
               </div>
               </c:if>
         </c:forEach>
         

         <!-- 댓글 쓰기 -->
         <div id="inputComment-container">
            <form id="createCommentFrm" method="post" action="${path }/post/postCommentInsert.do">
               <span><img id="commentProfile" class="rounded-circle" src="${path }/resources/upload/post/20180030_210021127_730.jpg"></span>
               <input type="text" id="inputCommentTxt" name="commentContents" class="form-control" placeholder=" 댓글을 입력하세요..."/>
               <input type="hidden" id="reply_postRef" name="postRef" value="${post.getPostNo() }"/>
               <input type="hidden" name="commentWriter" value="${memberLoggedIn.getMemberNickname() }"/>
               <input type="hidden" name="commentLevel" value="1"/>
               <div style="clear: both"></div>
            </form>
         </div> <!-- inputComment-container -->
         
         
      </div> <!-- panel-footer -->
   </div> <!-- panel -->
   
   </c:forEach>
   
   <style>
      #inputComment-container {
         margin-top: 2%;
      }
   
      #commentProfile {
         max-width: 50px;
         height: 50px;
      }
      
      #inputCommentTxt {
         max-width: 85%;
         display: inline-block; 
      }
      
      .replyInput {
         margin-left: 10%;
      }
      
      .replyProfile {
         max-width: 50px;
         height: 50px;
      }
      
      .inputReplyTxt {
         max-width: 84%;
         display: inline-block;
      }
      
      .replyDisplay {
         margin-top: 0.5%;
         margin-left: 10%;
      }
   </style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>