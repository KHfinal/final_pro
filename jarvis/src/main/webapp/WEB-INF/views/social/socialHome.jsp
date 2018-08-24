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
</style>

	<button class="btn btn-primary" data-toggle="modal" data-target="#postModal">게시글 등록</button>
	
	<!-- postModal -->
	<div class="modal" id="postModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
								
				<!-- Modal body -->
				<form method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<textarea class="form-control" rows="5" id="comment" name="postText" placeholder="글을 적으시오"></textarea>



					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary text-center">Submit</button>
						<button type="button" class="btn btn-danger text-center" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
