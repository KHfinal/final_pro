<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="social" name="title"/>	
</jsp:include>
<title>Agency - Start Bootstrap Theme</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="${path }/resources/css/agency.min.css" rel="stylesheet">
	<div class="headBar sticky-top">
        <div style="background-color:#272D38;height: 50px;">
            <div class="container">
                <div class="row">
                    <div class="col-10">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#searchGroup">그룹 찾기asd1231236777</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#myGroup">그룹</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-success btn-sm mt-3" data-toggle="modal" data-target="#createGroup" style="float: right;">그룹 만들기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_1.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                </div>
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_2.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                </div>
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_3.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                </div>
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_4.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                    
                </div>
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_5.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                    
                </div>
                <div class="ml-2 mr-2">
                    <img class="card-img-top" src="${path }/resources/img/KakaoTalk_6.png" style="width: 100px;height: 50px;border: 3px solid gold; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
                    
                </div>   
            </div>
        </div>
    </div>
    <section class="row" style="padding-top: 30px;">
        <div class="modal fade" id="createGroup">
            <div class="modal-dialog">
                <div class="modal-content"> 
                <div class="modal-header" style="background-color: #f8f9fa">
                    <h4 class="modal-title">새 그룹 만들기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="">
                    <div class="modal-body">
                        <span>그룹 이름 입력</span>
                        <input type="text" class="form-control form-control-lg">
                        <label for="comment">그룹 소개 글</label>
					<textarea class="form-control" rows="5" id="comment" placeholder="간단한 소개 글을 입력해 주세요."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">생성</button>
                        <button type="reset" class="btn btn-primary" data-dismiss="modal">취소</button>
                    </div>
                </form>      
                </div>
            </div>
        </div>
        <div class="container" style="height: 3000px;">
        	<div class="tab-content">
				<div class="tab-pane active container" id="searchGroup">
	        		<div class="bg-light" id="portfolio">
						<div class="row">
							<div class="col-lg-12 text-center">
								<h2 class="section-heading text-uppercase">그룹</h2>
								<h3 class="section-subheading text-muted">자신에게 어울리는 그룹을 찾아보세요.</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/01-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹1</h4>
									<p class="text-muted">그룹 분야1</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/02-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹2</h4>
									<p class="text-muted">그룹 분야2</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/03-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹3</h4>
									<p class="text-muted">그룹 분야3</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/04-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹4</h4>
									<p class="text-muted">그룹 분야4</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/05-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹5</h4>
									<p class="text-muted">그룹 분야5</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
									<div class="portfolio-hover">
										
									</div>
									<img class="img-fluid" src="${path }/resources/img/06-thumbnail.jpg" alt="">
								</a>
								<div class="portfolio-caption">
									<h4>그룹6</h4>
									<p class="text-muted">그룹 분야6</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane container" id="myGroup">내가 속한 그룹 페이지</div>
            </div>
       </div>
        	
    </section>
    </div>  
</body>
</html>

