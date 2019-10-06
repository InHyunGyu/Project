<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>회원 정보 수정</title>
        <!-- Favicons-->
        <link rel="shortcut icon" href="resources/assets/images/favicon.png">
        <link rel="apple-touch-icon" href="resources/assets/images/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="resources/assets/images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="resources/assets/images/apple-touch-icon-114x114.png">
        <!-- Web Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600%7cPlayfair+Display:400i" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- Plugins-->
        <link href="resources/assets/css/plugins.min.css" rel="stylesheet">
        <!-- Template core CSS-->
        <link href="resources/assets/css/template.css" rel="stylesheet">
        <link href="resources/assets/signup.css" rel="signup">
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 홈아이콘바꾸기 -->
<link rel="icon" type="image/png" href="resources/board/images/icons/favicon.ico"/>

        <script src="resources/assets/js/jquery-3.4.1.min.js"></script>
        <script src="resources/assets/js/login2.js"></script>
        <style>
        img#profileThumb{
		 border-radius: 50%;
	}
        </style>
        
<script >
	$(function(){
		
		var flagid = false;
		var flagpwd = false;
		var flagreco = true;
		
		var memberPwd   = $("#memberPwd").val();
		var memberName  = $("#memberName").val();
		var memberPhone = $("#memberPhone").val();
		var memberEmail = $("#memberEmail").val();
		var myintro     = $("myintro").val();
		
		var recocheckbtn = $("#recocheckbtn").val();
		var memberphone = $("#memberphone").val();
		
		var tel1 = 	$("#tel1").val();
		var tel2 = 	$("#tel2").val();
		var tel3 = 	$("#tel3").val();
		
		//패스워드 유효성 검사 함수 호출
		pwdValidation();
		//수정버튼 함수 호출
		modisubmit();
		


		$("#signup").on('click', function() {
			location.reload();
		})
		
		$("#memberDelete").on('click', function() {
			var memberId = $("#loginId").val();
			var memberPwd = $("#loginPwd").val();
			var send = {
				"memberId" : memberId,
				"memberPwd" : memberPwd
			}
			$.ajax({
				method : 'post',
				url : 'memberDelete',
				data : send,
				success : function() {
					location.href="main";
				}
			})
		})

	
		//비밀번호 유효성 검사
		$("#memberpwd").on("keyup",function(){
			memberpwd = $("#memberpwd").val();
			if(memberpwd.length <3 || memberpwd.length > 15){
				$("#checkpwdline").html("Password 는 3~15사이입니다.");
				return false;
			}
			else{
				$("#checkpwdline").html("");
			}
			
			//비밀번호 동일한지 검사
			$("#checkpwd").on("keyup",function(){
				var checkpwd = $("#checkpwd").val();
				if(memberpwd !== checkpwd){
					$("#checkpwdline2").html("비밀번호가 일치하지 않습니다.");
					return false;
				}else{
					$("#checkpwdline2").html("");
					flagpwd=true;
				}
			});
		});

	});
	

	
	
	function modisubmit(){
		$("#modiBTN").on('click', function() {
			memberPwd   = $("#memberPwd").val();
			memberName  = $("#memberName").val();
			memberPhone = $("#memberPhone").val();
			memberEmail = $("#memberEmail").val();
			myintro     = $("#myintro").val();
			
			var memberId  = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();
			
			//파일 추츨하기
	        //확장명이 붙은 파일명을 저장하기
	        var fd = new FormData(); 
			//이때 fileValue에 담기는 값은 /로 분할된 각 요소들의 집합, 즉 배열
	        var fileValue = $("#photoname").val().split("\\");
			
	        var fileNameWexe = fileValue[fileValue.length-1]; // 파일명
	        var SplitFileName = fileNameWexe.split(".");   
	        var fileName = SplitFileName[0];
	        //파일을 담아서 보내주기 위해 변수 설정
	        var inputFile = $("input[name='photoname']");
			var files = inputFile[0].files;
			
			
			
	        //파일 관련 객체를 보내야 하므로 FormData객체 생성하여
	        //파일이름(확장명 포함), 제목, 내용, 태그를 넣어준다. 
	        fd = new FormData();
	        
	        fd.append("photoname",fileNameWexe); //업로드한 파일명
	        fd.append("uploadFile", files[0]);  //파일 그 자체
			fd.append("memberId", memberId);
			fd.append("memberPwd", memberPwd);
			fd.append("memberName", memberName);
			fd.append("memberPhone", memberPhone);
			fd.append("memberEmail", memberEmail);
			fd.append("myintro", myintro);
			
			
			$.ajax({
				method : 'post',
				url : 'memberUpdate',
				data : fd,
				//*주의*파일을 보낼 시, string화 하면 안 돼서 타입 정하지 말고, 데이타 프로세싱도 하면 안 된다. 
				processData: false,
				contentType: false,
				success : function(result) {
					if (result == "ok") {
						swal("수정 성공");
						location.href="main"; //main uri호출하여 main.jsp로 이동
					} else {
						swal("수정 실패");
					}
				}
			})
		})
		
	}
	
	function pwdValidation(){
		//비밀번호 유효성 검사
		$("#memberPwd").on("keyup",function(){
			var memberpwd = $("#memberPwd").val();
			if(memberpwd.length <3 || memberpwd.length > 15){
				$("#checkpwdline").html("Password 는 3~15사이입니다.");
				return;
			}
			else{
				$("#checkpwdline").html("");
			}
			
			//비밀번호 동일한지 검사
			$("#pwdcheck").on("keyup",function(){
				var checkpwd = $("#pwdcheck").val();
				if(memberpwd !== checkpwd){
					$("#checkpwdcheck").html("비밀번호가 일치하지 않습니다.");
					return;
				}else{
					$("#checkpwdcheck").html("");
					flagpwd=true;
				}
			});
		});
	}
	</script>
	
    </head>
    <body>

        <!-- Preloader-->
        <div class="page-loader">
            <div class="page-loader-inner">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Preloader end-->

       <!-- Header-->
	<header class="header header-transparent">
		<div class="container-fluid">
			<!-- Brand-->
			<div class="inner-header">
				<a class="inner-brand" href="main">UtaJJang</a>
			</div>
			<!-- Navigation-->
			<div class="inner-navigation collapse">
				<div class="inner-nav">
					<ul>
						<li class="menu-item-has-children menu-item-has-mega-menu"><a
							href="main"><span class="menu-item-span">Home</span></a></li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Voice</span></a>
							<ul class="sub-menu">
								<li><a href="voice_new">New</a></li>
								<li class="menu-item-has-children"><a href="#">Best</a>
									<ul class="sub-menu">
										<li><a href="voice_weekly">Weekly</a></li>
										<li><a href="voice_monthly">Monthly</a></li>
									</ul></li>
								<li><a href="voice_all">ALL</a></li>
							</ul></li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Video</span></a>
							<ul class="sub-menu">
								<li><a href="video_new">New</a></li>
								<li class="menu-item-has-children"><a href="#">Best</a>
									<ul class="sub-menu">
										<li><a href="video_weekly">Weekly</a></li>
										<li><a href="video_monthly">Monthly</a></li>
									</ul></li>
								<li><a href="video_all">ALL</a></li>
							</ul></li>

						<li><a href="https://utajjang.shop"><span class="menu-item-span">Streaming</span></a>
						</li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Community</span></a>
							<ul class="sub-menu">
								<li><a href="community">Board</a></li>
								<li><a href="follow_page?memberId=${sessionScope.memberId}">My Blog</a></li>
							</ul></li>
						<li><a href="notice"><span class="menu-item-span">Notice</span></a></li>
						<c:if test="${sessionScope.memberId == 'admin'}">
						<li class="menu-item-has-children"><a href="managerPage"><span
								class="menu-item-span">Admin</span></a></li></c:if>
					</ul>
				</div>
			</div>
			<div class="extra-nav">
                    <ul>
                        <li><a class="off-canvas-open" href="#"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                        <li class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation" class="" aria-expanded="true"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                    </ul>
                </div>
		</div>
	</header>
	<!-- Header end-->

        <!-- Wrapper-->
        <div class="wrapper">
            <!-- Hero-->
            <section class="module-cover parallax text-center fullscreen" data-background="resources/assets/images/main/modify.jpg" data-overlay="0.5" style="height: 100%">
                <div class="container" style="padding-top:100px;">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 m-auto">
                            <div class="m-b-20">
                                <h6>Modify</h6>
                            </div>
                            <div class="m-b-20">
                          
                            <form method="post" action="modify">
							
								<div class="form-group" >
									<input class="form-control" type="text" value="${memberId}" name="memberId" id="memberId" disabled="disabled" >
								</div>
								
								<div class="form-group">
									<input class="form-control" type="password" placeholder="Pasword" name="memberPwd" id="memberPwd"><span id="checkpwdline"></span>
								</div>
								<div class="form-group">
									<input class="form-control" type="password" placeholder="Pasword check" id="pwdcheck"><span id="checkpwdcheck"></span>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" value="${memberName}" name="memberName" id="memberName">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" value="${memberPhone }" name="memberPhone" id="memberPhone">
								</div>
								<div class="form-group">
									<input class="form-control" type="email" value="${memberEmail}" name="memberEmail" id="memberEmail">
								</div>
								<div class="form-group">
									<textarea class="form-control" rows="4" cols="50" name="myintro" id="myintro">${myintro}</textarea>
								</div>
								<div class="form-group">
									<input class="form-control" type="file"  name="photoname" id="photoname">
								</div>
								<div class="form-group">
									<button class="btn btn-block btn-round btn-brand" type="button" id="modiBTN">Modify</button>
								</div>
							</form>                              
                            </div>
                           
                        </div>
                    </div>
                </div>
                </section>
           

            <!-- Footer-->
            <footer class="footer" >
                <div class="footer-widgets" style="padding-top:100px;">
                    <div class="container" >
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Text widget-->
                                <aside class="widget widget-text">
                                    <div class="widget-title">
                                        <h6>About Us</h6>
                                    </div>
                                    <div class="textwidget">
                                        <p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
                                        <p>
                                            Location: 12 London Avenue, Suite 18<br>
                                            E-mail: support@theme.com<br>
                                            Phone: 8 800 123 4567<br>
                                        </p>
                                        <ul class="social-icons">
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                        </ul>
                                    </div>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Recent entries widget-->
                                <aside class="widget widget-recent-entries">
                                    <div class="widget-title">
                                        <h6>Recent Posts</h6>
                                    </div>
                                    <ul>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">May 8, 2018</span></li>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">April 7, 2018</span></li>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">September 7, 2018</span></li>
                                    </ul>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Twitter widget-->
                                <aside class="widget twitter-feed-widget">
                                    <div class="widget-title">
                                        <h6>Twitter Feed</h6>
                                    </div>
                                    <div class="twitter-feed" data-twitter="double_theme" data-number="1"></div>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Recent works-->
                                <aside class="widget widget-recent-works">
                                    <div class="widget-title">
                                        <h6>Portfolio</h6>
                                    </div>
                                    <ul>
                                        <li><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/2.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/3.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/7.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/8.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/6.jpg" alt=""></a></li>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bar">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>© 2018 Boomerang, All Rights Reserved. Design with love by <a href="#">2theme</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer end-->
        </div>
        <!-- Wrapper end-->
		<!-- Off canvas-->
	<div class="off-canvas-sidebar">
		<div class="off-canvas-sidebar-wrapper">
			<div class="off-canvas-header">
				<a class="off-canvas-close" href="#"><img
					src="resources/assets/images/close.png" style="width: 15px;"></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<c:if test="${sessionScope.memberId != null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<p class="text-center">
								<c:if test="${sessionScope.memberId != null}">
									<c:if test="${sessionScope.memberImg != null}">
										<img id="profileThumb" src="download?memberId=${sessionScope.memberId}"  width="80px">
									</c:if>
									<c:if test="${sessionScope.memberImg == null}">
										<img src="resources/assets/images/person.png"  width="80px">
									</c:if>
								</c:if>
							</p>
							<p class="text-center">${sessionScope.memberId}</p>
							<p class="text-center">
								<a href="follow_page?memberId=${sessionScope.memberId}" style="color: #788487">내 블로그</a>
							</p><br>
							<p class="text-center">
								<a href="modify" style="color: #788487">정보 수정</a>
							</p><br>
							<p class="text-center">
								<a href="logout" style="color: #788487">로그 아웃</a>
							</p><br>
							<p class="text-center">
								<a href="#" id="memberDelete" style="color: #788487">탈퇴</a>
							</p>
						</div>
					</aside>
				</c:if>
				<c:if test="${sessionScope.memberId == null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<div class="form-group">
								<p class="text-center">Login</p>
								<p class="text-center">
									<input class="form-control" type="text" id="memberId"
										name="memberId" placeholder="loginId">
								</p>
								<p class="text-center">
									<input class="form-control" type="password" id="memberPwd"
										name="memberPwd" placeholder="password">
								</p>
								<p class="text-center">
									<button class="btn btn-outline-secondary" type="button"
										name="loginBTN" id="loginBTN"
										style="width: 320px; height: 54px;">Login</button>
								<p class="text-center">
									<a href="signup" style="color: #788487">회원가입</a> &ensp; <a
										href="id_pwd" style="color: #788487">ID/Password 찾기</a>
								</p>
									
							</div>
						</div>
					</aside>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Off canvas end-->

        <!-- To top button--><a class="scroll-top" href="#top"><i class="fas fa-angle-up"></i></a>

        <!-- Scripts-->
       <script src="resources/assets/js/custom/jquery.min.js"></script> 
       <script src="resources/assets/js/custom/popper.min.js"></script> 
       <script src="resources/assets/js/bootstrap/bootstrap.min.js"></script>
       <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script> 
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>

        
    </body>
</html>