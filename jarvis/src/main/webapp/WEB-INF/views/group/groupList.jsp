<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
        <link rel="stylesheet" href="resources/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/-Login-form-Page-BS4-.css">
        <link rel="stylesheet" href="resources/css/styles.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
    
    </style>
</head>    
<body>
    <header class="sticky-top">
        <div style="background-color:blue;height: 50px;">
            
        </div>
        <div style="background-color:tomato;height: 50px;">
            <div class="container">
                <div class="row">
                    <div class="col-10">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#searchGroup">그룹 찾기</a>
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
        <div class="container" style="background-color:green;height: 100px;">
            
        </div>
    </header>
    <section class="row">
        
            <div class="modal fade" id="createGroup">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content"> 
                    <div class="modal-header">
                        <h4 class="modal-title">그룹 생성</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form action="">
                        <div class="modal-body">
                            <span>그룹명</span>
                            <input type="text" class="form-control form-control-lg">
                            <span>그룹명</span>
                            <input type="text" class="form-control form-control-lg">
                            <span>그룹명</span>
                            <input type="text" class="form-control form-control-lg">
                            <span>그룹명</span>
                            <input type="text" class="form-control form-control-lg">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" data-dismiss="modal">생성</button>
                            <button type="reset" class="btn btn-primary" data-dismiss="modal">취소</button>
                        </div>
                    </form>      
                    </div>
                </div>
            </div>
        <div class="container" style="background-color:orange;height: 3000px;">
            <div class="tab-content">
                <div class="tab-pane active container" id="searchGroup">
                    <div class="row">
                        <div class="col-5 mr-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                        <div class="col-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                    </div>
                    <div class="row">
                        <div class="col-5 mr-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                        <div class="col-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                    </div>
                    <div class="row">
                        <div class="col-5 mr-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                        <div class="col-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                    </div>
                    <div class="row">
                        <div class="col-5 mr-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                        <div class="col-5 ml-5 mt-3" style="border: 1px solid black;height: 200px;"></div>
                    </div>
                </div>
                <div class="tab-pane container" id="myGroup">내가 속한 그룹 페이지</div>
            </div>
        </div>	
    </section>  
</body>
</html>
