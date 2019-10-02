<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Debugking_Project</title>
<!-- Favicons-->
<link rel="shortcut icon" href="assets/images/favicon.png">
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
<style>

/* 프로필 이미지 썸네일화를 위한 css 설정 */
img#mypic {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 150px;
}

div.left {
	width: 50%;
	float: left;
	text-align: center;
}

div.right {
	width: 50%;
	float: right;
	text-align: center;
}

button.followReq {
	width: 130px;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ededed;
	border-radius: .1875rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

button.blockReq {
	width: 130px;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ededed;
	border-radius: .1875rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

table {
	text-align: center;
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
	 
	 #styleA {
	 color: #505cfd;
    text-decoration: none;
    background-color: transparent;
    }
	
	</style>
	
	

<script>
	$(function(){
		

		
		$('.click').hover(function() {
			  $(this).css("color", "#505cfd");
			  $(this).css("text-decoration", "underline");
			}, function(){
			  $(this).css("color", "#788487");
			  $(this).css("text-decoration", "none");
			});
		
		var memberId = '${memberInfo.memberId}'
		var login = '${sessionScope.memberId}'
		

		
		$("#followList").on('click',function(){
			follower(memberId, login);
		})
		
		$("#postContent").on('click','.follower' ,function(){
			follower(memberId, login);
		})
		
		$("#postContent").on('click', '.following',function(){
			following(memberId, login);
		})
		
		$("#postList").on('click', function(){
			postList();
		})
		
		$("#loginBTN").on('click', function(){
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();
			
			if(memberId.length == 0 || memberPwd.length == 0) {
				alert("다시입력해주세요.");
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
		
		$(".followReq").on('click', function(){
			if(login.length == 0 || login == null) {
				alert("로그인 해주세요.");
				return;
			} else {
				followBTN(memberId, login)	
			}
		})
		
		$(".block").on('click', function(){
			if(login.length == 0 || login == null) {
				alert("로그인 해주세요.");
				return;
			} else {
				blockBTN(memberId, login);	
			}
			
		})
		
	})
	
	function follower(memberId, login){
		
		var send = {
				'memberId':memberId,
				'login':login
		}
		
		$.ajax({
			method:'get',
			url:'follower',
			data:send,
			success:function(res){
				
				var tag = '';
				
				tag += '<div class="left"><h6 class="single-portfolio-title"><a class="follower">Follower</a></h6></div>';
				tag += '<div class="right"><h6 class="single-portfolio-title"><a class="following">Following</a></h6></div>';
				tag += '<table class="table table-striped table-sm table-hover"> ';
				tag += '<colgroup>';
				tag += '<col style="width: 20%;" />';
				tag += '<col style="width: auto;" />';
				tag += '<col style="width: 20%;" />';
				tag += '</colgroup>';
				tag += '<tr>';
				tag += '<th>Member Id</th>';
				tag += '<th>Member Level</th>';
				tag += '<th>Follow</th>';
				tag += '</tr>';
				
				if(res.list.length == 0) {
					tag += '<tr>';
					tag += '<td colspan="3" align="center">팔로워가 없습니다. </td>';
					tag += '</tr>';
				} else {
					$.each(res.list, function(index, item){
						var memberId = item.memberId;
						var followName = '';
						var flag = false;
						$.each(res.memList, function(index, item2){
							followName = item2.followName;
							
							if(followName == memberId) {
								flag = true;
							}
						})
	
						if(flag) {
							tag += '<tr>';
							tag += '<td><a href="follow_page?memberId='+item.memberId+'">'+item.memberId+'</a></td>';
							tag += '<td>'+item.memberLevel+'</td>';
							tag += '<td><button type="button" class="blockReq" data-value="'+item.memberId+'" >block</button></td>';
						} else {
							tag += '<tr>';
							tag += '<td><a href="follow_page?memberId='+item.memberId+'">'+item.memberId+'</a></td>';
							tag += '<td>'+item.memberLevel+'</td>';
							tag += '<c:if test="${sessionScope.memberId != '+item.memberId+'}">'
							tag += '<td><button type="button" class="followReq" data-value="'+item.memberId+'" >follow</button></td>';
							tag += '</c:if>'
							tag += '<c:if test="${sessionScope.memberId == '+item.memberId+'}">'
							tag += '<td></td>';
							tag += '</c:if>'
							
						}
						
						tag += '</tr>';
						
					})
				}
			
				tag += '</table>'
				
				$("#postContent").html(tag);
				
				$(".followReq").on('click', function(){
					var followName = $(this).attr("data-value");
					followBTN(followName);
				})
				
				$(".blockReq").on('click', function() {
					var memberId = $(this).attr("data-value");
					
					blockBTN(memberId, login);
				})
			}
		})
		
	}
	
	function following(memberId, login){
		var send = {
				'memberId':memberId,
				'login':login
		}
		
		$.ajax({
			method:'get',
			url:'following',
			data:send,
			success:function(res){
				var tag = '';
				
				tag += '<div class="left"><h6 class="single-portfolio-title"><a class="follower" class="click">Follower</a></h6></div>';
				tag += '<div class="right"><h6 class="single-portfolio-title"><a class="following" class="click">Following</a></h6></div>';
				tag += '<table class="table table-striped table-sm table-hover"> ';
				tag += '<colgroup>';
				tag += '<col style="width: 20%;" />';
				tag += '<col style="width: auto;" />';
				tag += '<col style="width: 20%;" />';
				tag += '</colgroup>';
				tag += '<tr>';
				tag += '<th>Member Id</th>';
				tag += '<th>Member Level</th>';
				tag += '<th>Follow</th>';
				tag += '</tr>';
				
				if(res.length == 0) {
					tag += '<tr>';
					tag += '<td colspan="3" align="center">팔로잉이 없습니다. </td>';
					tag += '</tr>';
				} else {
					$.each(res.list, function(index, item){
						var memberId = item.followName;
						var followName = '';
						var flag = false;
						$.each(res.memList, function(index, item2){
							followName = item2.followName;
							
							if(followName == memberId) {
								flag = true;
							}
						})
	
						if(flag) {
							tag += '<tr>';
							tag += '<td><a href="follow_page?memberId='+item.followName+'">'+item.followName+'</a></td>';
							tag += '<td>'+item.memberLevel+'</td>';
							tag += '<td><button type="button" class="blockReq" data-value="'+item.followName+'" >block</button></td>';
						} else {
							tag += '<tr>';
							tag += '<td><a href="follow_page?memberId='+item.followName+'">'+item.followName+'</a></td>';
							tag += '<td>'+item.memberLevel+'</td>';
							tag += '<c:if test="${sessionScope.memberId != '+item.followName+'}">'
							tag += '<td><button type="button" class="followReq" data-value="'+item.followName+'" >follow</button></td>';
							tag += '</c:if>'
							tag += '<c:if test="${sessionScope.memberId == '+item.followName+'}">'
							tag += '<td></td>';
							tag += '</c:if>'
							
						}
						
						tag += '</tr>';
						
					})
				
				}
			
				tag += '</table>'
				$("#postContent").html(tag);
				
				$(".followReq").on('click', function(){
					var followName = $(this).attr("data-value");
					followBTN(followName);
				})
				
				$(".blockReq").on('click', function() {
					var memberId = $(this).attr("data-value");
					
					blockBTN(memberId, login);
				})
			}
				
		})
		
	}
	
	
	function postList(){
		var memberId = '${memberInfo.memberId}';
		
		$.ajax({
			method:'get',
			url:'memberPost?memberId='+memberId,
			success:function(res){
				
				var tag = ''
				
					$.each(res, function(index, item){
						tag += '<div class="post-preview"><a href="#"><img src="resources/assets/images/blog/1.jpg" alt=""></a></div>';
						tag += '<div class="post-wrapper">';
						tag += '<div class="post-header">';
						tag += '<h2 class="post-title"><a href="blog-single.html">'+item.postTitle+'</a></h2>';
						tag += '<ul class="post-meta">';
						tag += '<li>'+item.postType+'</li>';
						tag += '<li>'+item.postDate+'</li>';
						tag += '<li>'+item.memberId+'</li>';
						tag += '</ul>';
						tag += '</div>';
						tag += '<div class="post-content">';
						tag += '<p>'+item.postContent+'</p>';
						tag += '</div>';
						tag += '<div class="post-more"><a href="file_detail?postNo='+item.postNo+'" id="styleA">Read more</a></div>';
						tag += '</div>';
						tag += ' <hr class="m-t-30 m-b-30">	 ';
								
					})
					$("#postContent").html(tag);	
		}
	

		
			})
		

		}
	
	function followBTN(followName) {
		alert(followName);
		var login = '${sessionScope.memberId}'
		
	
		var send = {
				'followName':followName,
				'memberId':login
		}
		
		$.ajax({
			method:'get',
			url:'followBTN',
			data:send,
			success:function(res){
				if(res == 'ok') {
					alert('ok');
					return;
				} else {
					alert('follow 등록에 실패하였습니다.');
					return;
				}
			}
		})	
	}
	
	function blockBTN (memberId, login) {
		var send = {
				'followName' : memberId,
				'memberId' : login,
		}
		
		$.ajax({
			method:'get',
			url:'block',
			data: send,
			success:function (res) {
				if(res='ok') {
					alert('삭제 완료');
					return;
				} else {
					alert('삭제 실패');
					return;
				}
				
			}
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
		<section class="module-cover parallax text-center"
			data-background="resources/assets/images/board8.jpg" data-overlay="0.2">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Spacé Đecor</h1>
						<ol class="breadcrumb justify-content-center">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">Portfolio</a></li>
							<li class="breadcrumb-item active">Sidebar Stack</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<!-- Hero end-->

		<!-- Blog-->
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">

						<!-- Post-->
						<article class="post" id="postContent"></article>
						<!-- Post end-->

						<!-- Page Navigation-->
						<div id="navigation">
							
						</div>
						<!-- Page Navigation end-->
					</div>




					<div class="col-md-4">
						<div class="sticky-sidebar">

							<h6 class="single-portfolio-title">${memberInfo.memberId}</h6>
							<p>${memberInfo.myintro}</p>

							<p>설명 2</p>
							<hr class="m-t-30 m-b-30">
							<div class="info-list">
							
								<li><span class="info-list-title">Date :</span><span>${memberInfo.signupDate}
								</span></li>
								<li><span class="info-list-title">Follow :</span><span><a
										class="click" id="followList" data-value="${memberInfo.memberId}">${followCount}</a></span></li>
								<li><span class="info-list-title">Post :</span><span><a
										 class="click" id="postList" data-value="${memberInfo.memberId}">${postCount}</a></span></li>
							
							</div>
							<hr class="m-t-30 m-b-30">
							<div class="info-list">
								<button type="button"
									class="followReq form-control btn btn-outline-dark col-md-5" style="border-color: black;" data-value="${memberInfo.memberId}" data-login="${sessionScope.memberId}">Follow</button>
								<button type="button"
									class="block form-control btn btn-outline-dark col-md-5" data-value="${memberInfo.memberId}" data-login="${sessionScope.memberId}">Block</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Blog end-->








		<!-- Footer-->
		<footer class="footer">
			<div class="footer-widgets">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<!-- Text widget-->
							<aside class="widget widget-text">
								<div class="widget-title">
									<h6>About Us</h6>
								</div>
								<div class="textwidget">
									<p>Map where your photos were taken and discover local
										points of interest. Map where your photos.</p>
									<p>
										Location: 12 London Avenue, Suite 18<br> E-mail:
										support@theme.com<br> Phone: 8 800 123 4567<br>
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
									<li><a href="#">Map where your photos were taken and
											discover local points.</a><span class="post-date">May 8,
											2018</span></li>
									<li><a href="#">Map where your photos were taken and
											discover local points.</a><span class="post-date">April 7,
											2018</span></li>
									<li><a href="#">Map where your photos were taken and
											discover local points.</a><span class="post-date">September
											7, 2018</span></li>
								</ul>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Twitter widget-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h6>Twitter Feed</h6>
								</div>
								<div class="twitter-feed" data-twitter="double_theme"
									data-number="1"></div>
							</aside>
						</div>
						<div class="col-md-3">
							<!-- Recent works-->
							<aside class="widget widget-recent-works">
								<div class="widget-title">
									<h6>Portfolio</h6>
								</div>
								<ul>
									<li><a href="#"><img
											src="resources/assets/images/widgets/1.jpg" alt=""></a></li>
									<li><a href="#"><img
											src="resources/assets/images/widgets/2.jpg" alt=""></a></li>
									<li><a href="#"><img
											src="resources/assets/images/widgets/3.jpg" alt=""></a></li>
									<li><a href="#"><img
											src="resources/assets/images/widgets/7.jpg" alt=""></a></li>
									<li><a href="#"><img
											src="resources/assets/images/widgets/8.jpg" alt=""></a></li>
									<li><a href="#"><img
											src="resources/assets/images/widgets/6.jpg" alt=""></a></li>
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
								<p>
									© 2018 Boomerang, All Rights Reserved. Design with love by <a
										href="#">2theme</a>
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
				<a class="off-canvas-close" href="#"><img src="resources/assets/images/close.png" style="height: 15px;"></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<c:if test="${sessionScope.memberId != null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<p class="text-center">
								<img src="resources/assets/images/person.png" alt=""
									width="80px">
							</p>
							<p class="text-center">${sessionScope.memberId}</p>
							<p class="text-center">
                            	<a href="follow_page?memberId=${sessionScope.memberId}" style="color: #788487">내 블로그</a>
                            </p>
							<p class="text-center">
								<a href="modify" style="color: #788487">정보 수정</a>
							</p>
							<p class="text-center">
								<a href="logout" style="color: #788487">로그 아웃</a>
							</p>
							<p class="text-center">
								<a href="memberDelete" style="color: #788487">탈퇴</a>
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
										style="width: 320px; height: 54px;">login</button>
								<p class="text-center">
									<a href="signup" style="color: #788487">signup</a> &ensp; <a
										href="id_pwd" style="color: #788487">id/pwd</a>
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
