<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>	
</jsp:include>
<title>Agency - Start Bootstrap Theme</title>
<link href="${path }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/bootstrap/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="${path }/resources/css/agency.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="${path }/resources/groupJs/css/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${path }/resources/groupJs/css/als_demo.css" />
<link rel="icon" href="${path }/resources/groupJs/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${path }/resources/groupJs/images/favicon.ico" type="image/x-icon" />
<meta name="robots" content="index,follow" />
<meta name="keywords" content="jQuery plugin, jQuery scroller, list jQuery, jQuery lists, css3, html5, jQuery" />
<meta name="description" content="any list scroller demo - jQuery scrolling plugin by musings.it to scroll any kind of list with any content - musings.it web design and development - Bergamo Italy" /> 	
<meta name="author" content="Federica Sibella - musings.it" />
<meta name="geo.placename" content="via Generale Alberico Albricci 1, 24128 Bergamo, Italy">
<script type="text/javascript" src="${path }/resources/groupJs/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path }/resources/groupJs/js/jquery.als-1.7.min.js"></script>
<style>

</style>
<script>
	/* $(document).ready(function() {      
	   $('#categoryCarousel').carousel('pause');
	}); */
	
   	$(function(){
   		$('#btn1').on("click",function(){
   			var name=$("[name=g_name]").val();
   			var intro=$("[name=g_intro]").val();
   			var category=$("[name=g_category]").val();
   			console.log(category);
   			
   			if(name.trim().length==0){
   				alert("그룹 명을 입력하세요");
   				return false;
   			}
   			else if(intro.trim().length==0){
   				alert("소개글을 입력하세요");
   				return false;
   			}
   			else if(category.trim().length<0){
   				alert("1가지 이상 체크하세요");
   				return false;
   			}
   			else{
   				fmt.submit();
   				
   			}
   		});
   	});
   	$(document).ready(function() 
			{
				$("#lista1").als({
					visible_items: 4,
					scrolling_items: 1,
					orientation: "horizontal",
					circular: "yes",
					autoscroll: "no",
					interval: 5000,
					speed: 500,
					easing: "linear",
					direction: "right",
					start_from: 0
				});
								
				//logo hover
				$("#logo_img").hover(function()
				{
					$(this).attr("src","${path }/resources/groupJs/images/als_logo_hover212x110.png");
				},function()
				{
					$(this).attr("src","${path }/resources/groupJs/images/als_logo212x110.png");
				});
				
				//logo click
				$("#logo_img").click(function()
				{
					location.href = "http://als.musings.it/index.php";
				});
				
				$("a[href^='http://']").attr("target","_blank");
				$("a[href^='http://als']").attr("target","_self");
			});
 
</script>
	<div class="headBar sticky-top">
        <div style="background-color:#FFE4BA;min-height: 50px;">
            <div class="container">
                <div class="row">
	                <div class="col-3">
	                	<ul class="nav nav-pills">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="pill" href="#searchGroup">그룹</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="pill" href="#myGroup">내 그룹</a>
							</li>
	                    </ul>
	                </div>
	                <div class="col-6">
	                	<form action="${path }/group/groupSearch.do" method="post">
							<div>
								<div class="input-group">
									<input type="text" class="form-control" name="titleSearch" placeholder="그룹 찾아보기">
									<div class="input-group-append">
										<button class="btn btn-success" type="submit">Go</button> 
									</div>	
								</div>
							</div>
						</form>
	                </div>
	                <div class="col-3">
	                	<button type="button" class="btn btn-success btn-sm mt-1" data-toggle="modal" data-target="#createGroup">그룹 만들기</button>
	                </div>
                </div>
                
                <div id="content">
                	<div id="lista1" class="als-container">
						<div class="als-viewport">
							<ul class="als-wrapper">
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=여행"><img src="${path }/resources/groupJs/images/als-images/travle.png" title="calculator" style="width:128px;height: 50px;margin-right: 0px;"/></a>여행</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=예술&문화"><img src="${path }/resources/groupJs/images/als-images/art.png" title="light bulb" style="width:128px;height: 50px;"/></a>예술&문화</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=건강"><img src="${path }/resources/groupJs/images/als-images/health.png" title="card" style="width:128px;height: 50px;"/></a>건강</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=패션&뷰티"><img src="${path }/resources/groupJs/images/als-images/beauty.png" title="chess" style="width:128px;height: 50px;"/></a>패션&뷰티</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=스포츠"><img src="${path }/resources/groupJs/images/als-images/sports.png" title="alarm clock" style="width:128px;height: 50px;"/></a>스포츠</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=푸드"><img src="${path }/resources/groupJs/images/als-images/food.png" title="scissors" style="width:128px;height: 50px;"/></a>푸드</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=리빙"><img src="${path }/resources/groupJs/images/als-images/living.png" title="heart" style="width:128px;height: 50px;"/></a>리빙</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=재테크"><img src="${path }/resources/groupJs/images/als-images/investment.png" title="pin" style="width:128px;height: 50px;"/></a>재테크</li>
								<li class="als-item"><a href="${path }/group/groupFilter.do?category=1"><img src="${path }/resources/groupJs/images/als-images/heart.png" title="mobile phone" style="width:128px;height: 50px;"/></a>1</li>
							</ul>
						</div>
						<a class="carousel-control-prev als-prev" href="#demo" data-slide="prev" style="top: 15px;">
						    <span class="carousel-control-prev-icon"><img src="${path }/resources/groupJs/images/thin_left_arrow_333.png" alt="prev" title="previous"/></span>
						  </a>
						  <a class="carousel-control-next als-next" href="#demo" data-slide="next" style="top: 15px;">
						    <span class="carousel-control-next-icon"><img src="${path }/resources/groupJs/images/thin_right_arrow_333.png" alt="next" title="next" /></span>
						  </a>
					</div>
				</div>
				
            </div>	
		</div>  
    </div>

    <section class="row pt-0">
     
        <div class="modal fade" id="createGroup">
        
            <div class="modal-dialog">
                <div class="modal-content"> 
                <div class="modal-header" style="background-color: #f8f9fa">
                    <h4 class="modal-title">새 그룹 만들기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form name="fmt" action="${path }/group/groupInsert.do" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <label for="groupName">그룹 이름 입력</label>
                        <input type="text" class="form-control form-control-lg" id="groupName" name="g_name"/>
                        <label for="comment">그룹 소개 글</label>
						<textarea class="form-control" name="g_intro" rows="5" id="comment" placeholder="간단한 소개 글을 입력해 주세요."></textarea>
						<label for="upFile1">그룹 이미지</label>
	                    <div class="custom-file">
		                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
		                    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
	                	</div>
                    	<span>그룹 분류</span>
                    	<div class="form-control-lg mb-2">
	                    	<div class="row">
		                        <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category1" name="g_category" value="여행"/>
								    <label class="custom-control-label" for="category1">여행</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category2" name="g_category" value="예술&문화"/>
								    <label class="custom-control-label" for="category2">예술&문화</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category3" name="g_category" value="건강"/>
								    <label class="custom-control-label" for="category3">건강</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category4" name="g_category" value="패션&뷰티"/>
								    <label class="custom-control-label" for="category4">패션&뷰티</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category5" name="g_category" value="스포츠"/>
								    <label class="custom-control-label" for="category5">스포츠</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category6" name="g_category" value="푸드"/>
								    <label class="custom-control-label" for="category6">푸드</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category7" name="g_category" value="리빙"/>
								    <label class="custom-control-label" for="category7">리빙</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category8" name="g_category" value="재테크"/>
								    <label class="custom-control-label" for="category8">재테크</label>
							    </div>
							    <div class="custom-control custom-checkbox mr-3">
								    <input type="checkbox" class="custom-control-input" id="category9" name="g_category" value="1"/>
								    <label class="custom-control-label" for="category9">1</label>
							    </div>
						    </div>
					    </div>
					    
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btn1" class="btn btn-primary" data-dismiss="modal">생성</button>
                        <button type="reset" class="btn btn-primary" data-dismiss="modal">취소</button>
                    </div>
                </form>
               	</div>
            </div>  
        </div>
        
        <div class="container mt-2" style="height: 3000px;">
        	<div class="tab-content">
				<div class="tab-pane active container" id="searchGroup">
					
	        		<div id="portfolio">
						<div class="col-lg-12 text-center">
							<h2 class="section-heading text-uppercase mt-3">그룹</h2>
							<h3 class="section-subheading text-muted" style="margin-bottom: 30px;">자신에게 어울리는 그룹을 찾아보세요.</h3>
						</div>
						<div class="row">
							<c:forEach var="g" items="${list}">				
								<div class="col-md-4 col-sm-6 portfolio-item">
									<a class="portfolio-link" data-toggle="modal" href="${path }/group/groupView.do">
										<div class="portfolio-hover">
							                <div class="portfolio-hover-content">
							                  	<p>${g.g_intro}</p>
							                </div>
						                </div>
										<img class="img-fluid" src="${path }/resources/upload/group/${g.g_renamedFilename}" style="width: 340px; height: 250px;"/>
									</a>
									<div class="portfolio-caption">
										<h4>${g.g_name }</h4>
										<p class="text-muted"><c:forEach var="cate" items="${g.g_category }">${cate }&nbsp;</c:forEach></p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="tab-pane container" id="myGroup">
					
					내가 속한 그룹 페이지
				
				</div>
            </div>
           
       </div>
        	
    </section>  
</body>
</html>

