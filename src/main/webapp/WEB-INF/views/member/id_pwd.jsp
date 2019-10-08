<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Boomerang - Template</title>
<!-- Favicons-->
<link rel="shortcut icon" href="resources/assets/images/favicon.png">
<link rel="apple-touch-icon"
	href="resources/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="resources/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="resources/assets/images/apple-touch-icon-114x114.png">
<!-- Web Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,500,600%7cPlayfair+Display:400i"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Plugins-->
<link href="resources/assets/css/plugins.min.css" rel="stylesheet">
<!-- Template core CSS-->
<link href="resources/assets/css/template.css" rel="stylesheet">
<!-- JavaScripts -->
<script src="resources/assets/js/jquery-3.4.1.min.js"></script>
<script src="resources/assets/js/login2.js"></script>
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 홈아이콘바꾸기 -->
<link rel="icon" type="image/png" href="resources/board/images/icons/favicon.ico"/>

<style type="text/css">

img#profileThumb{
		 border-radius: 50%;
		  width:150px;
		 height:150px;
	}

  a {
  	color: #788487;
  }
	
	#inputStyle {
	height: 100%; 
	width: 20%;
	color: #495057;
    background-color: #fff;
    padding-left: 12px;
    border: 1px solid #ededed;
    border-radius: .1875rem;
    font-size:0.85em;
    
	 }
	
	</style>
<script>
	$(function(){
		idPwController();
		
 
		$("#loginBTN").on('click', function(){
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();
			
			alert("memberId"+memberId+"++memberPwd"+memberPwd)
			
			if(memberId.length == 0 || memberPwd.length == 0) {
				swal("다시입력해주세요.");
				return;
			}
			
			var send = {
					"memberId" : memberId,
					"memberPwd" : memberPwd
			}
			
			$.ajax({
				method:'post',
				url:'login',
				data:send,
				success: function(){
					location.reload();
				}
			})
		})
		
		$("#signup").on('click', function(){
			location.href="signup"
		})
		
	
		
		$("#idFind").on('click', function(){
			init();
		})
		
		
	})
	
	
	function idPwController(){
		//첫 화면 진입 시 아이디 찾기 UI 띄워줌
		$("#pwdShow").css('display', 'none');
		
		//패스워드 찾기 버튼 클릭 시 PW UI 띄워줌.
		$("#pwdFind").on('click',function(){
			$("#pwdShow").css('display', '');
			$("#idShow").css('display', 'none');
			
		})
		
		$("#idFind").on('click',function(){
			$("#pwdShow").css('display', 'none');
			$("#idShow").css('display', '');
		})
		
		
		/* 아이디 찾기 버튼 클릭 시 함수 발동*/

		$("#idBTN").on('click', function(){
			
			var memberName = $("#memberName").val();
			var memberEmail = $("#memberEmail").val();
			
			alert("memberName"+memberName+"++memberEmail"+memberEmail)
			if(memberName.length == 0 || memberEmail.length ==0) {
				swal("다시입력해주세요.");
				return;
			}
			
			var send = {
					"memberName":memberName,
					"memberEmail":memberEmail
			}
			
			$.ajax({
				method:'post',
				url:'findid',
				data: send,
				success:function(resp){
					if(!resp){
						alert("아이디 없습니다.");
					}
					else{
						alert("아이디:" + resp.memberId);
						location.href="main";
					}
				}
			})	
		})
		
		/* 패스워드 찾기 버튼 클릭 시 */
			
		$("#pwdBTN").on('click', function(){
			var memberIdsearch = $("#memberIdsearch").val();
			var memberEmail = $("#memberEmail4pwd").val();
			alert("memberIdsearch"+memberIdsearch+"++memberEmail"+memberEmail)
			if(memberIdsearch.length == 0 || memberEmail.length == 0) {
				swal("다시입력해주세요.");
				return;
			}
			
			var send = {
					"memberId":memberIdsearch,
					"memberEmail":memberEmail
			}
			
			$.ajax({
				method:'post',
				url:'pwfindMailSend',
				data:send,
				success:function(resp){
					
					if(resp == "ok"){
						location.href="emailSendAction";
					}
					else{
						alert("회원이 아닙니다.");
					}
				}
			})
		})
		
		
		
		
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
		<section class="module-cover parallax text-center fullscreen"
			data-background="resources/assets/images/main/find.jpg" data-overlay="0.6">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 m-auto">
						<div class="m-b-20">
							<h6>
								<a href="#" id="idFind">ID</a> | <a href="#"
									id="pwdFind">PWD</a>
							</h6>
						</div>

						<div class="m-b-20" id="find">
							<!-- 아이디 찾기 화면 -->
							<div class="m-b-20" id="idShow" display=''>
								<div class="form-group">
									<input class="form-control" type="text"
										placeholder="memberName" id="memberName" name="memberName">
								</div>
								<div class="form-group">
									<input class="form-control" type="email"
										placeholder="memberEmail" id="memberEmail" name="memberEmail">
								</div>
								<div class="form-group">
									<button class="btn btn-block btn-round btn-brand" type="button"
										id="idBTN">ID</button>
								</div>
							</div>
							
							<!-- 패스워드 찾기 화면 -->
							<div class="m-b-20" id="pwdShow" display='none'>
								<div class="form-group">
									<input class="form-control" type="text" placeholder="memberId"
										id="memberIdsearch" name="memberId">'
								</div>

								<div class="form-group">
									<input class="form-control" type="email"
										placeholder="memberEmail" id="memberEmail4pwd" name="memberEmail">'
								</div>

								<div class="form-group">
									<button class="btn btn-block btn-round btn-brand" type="button"
										id="pwdBTN">PWD</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

			<!-- Footer-->
		<footer class="footer">
			<div class="footer-widgets">
				<div class="container">
					<div class="row">
					<div class="col-md-3">       
							<!-- Recent works-->
							<aside class="widget widget-recent-works">
								<div class="widget-title">
									<h6>Team Members</h6>  
								</div>      
								<ul>   
									<li><a href="https://github.com/HeejuKim96" target="_blank" title="김 희주"><img
											src="resources/assets/images/team/heeju_cartoon.jpg" alt=""></a></li>
									<li><a href="https://www.linkedin.com/in/hans-lee-6737b0120" target="_blank"  title="이 학민"><img
											src="resources/assets/images/team/hakmin_cartoon.jpg" alt=""></a></li>
								</ul>
								<ul>
									<li><a href="https://github.com/InHyunGyu" target="_blank"><img   
											src="resources/assets/images/team/hyungyu_cartoon.jpg"  title="인 현규" alt=""></a></li>
									<li><a href="https://github.com/ymh1994" target="_blank"><img
											src="resources/assets/images/team/minhyuk_cartoon.jpg"  title="유 민혁" alt=""></a></li>        
								</ul>
							</aside>   
						</div>
						
						

						<div class="col-md-3">
							<!-- Recent entries widget-->
							<aside class="widget widget-recent-entries">
								<div class="widget-title">
									<h6>Announcement</h6>  
								</div>
								<ul>
									<c:forEach var="item" items="${noticeList}">
										<li><a href="file_detail?postNo=${item.postNo}">${item.postTitle}</a><span class="post-date">${item.postDate}
												</span></li>
									</c:forEach>
								</ul>
							</aside>
						</div>

						<div class="col-md-3">
							<!-- Twitter widget-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h6>About Us</h6>   
								</div>
								<ul>
									<li><a href="companyIntro" target="_blank"><img
											src="resources/assets/images/aboutUs2.jpg" width="500" alt=""></a></li>   
								</ul>   
           
								<div class="twitter-feed" data-twitter="double_theme"
									data-number="1"></div>
							</aside>
						</div>
						
						<div class="col-md-3">  
							<!-- Text widget-->
							<aside class="widget widget-text">
								<div class="widget-title">  
									
								</div> 
								<div class="textwidget">   
									<p style="color:#788487">
									<br>우타짱이 마련한 음악을 통한 특별한 만남. 당신을 찾아갑니다.</p>
									<p style="color:#788487">
										SC IT MASTER 37 DebugKing<br> All Rights Reserved
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
						
					</div>
				</div>
			</div>
			<div class="footer-bar">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p style=color:#788487>
									© 2019 Utajjang, All Rights Reserved. Design with love by <a
										href="#">Debugking</a>
								</p>
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

	<!-- To top button-->
	<a class="scroll-top" href="#top"><i class="fas fa-angle-up"></i></a>

	<!-- Scripts-->
	<script src="resources/assets/js/custom/jquery.min.js"></script>
	<script src="resources/assets/js/custom/popper.min.js"></script>
	<script src="resources/assets/js/bootstrap/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
	<script src="resources/assets/js/custom/plugins.min.js"></script>
	<script src="resources/assets/js/custom/custom.min.js"></script>
</body>
</html>