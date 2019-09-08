<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script>
	$(function(){
		$("#loginBTN").on('click', function(){
			var userid = $("#userid").val();
			var userpwd = $("#userpwd").val();
			
			if(userid.length == 0 || userpwd.length == 0) {
				alert("다시입력해주세요.");
				return;
			}
			
			var send = {
					"userid" : userid,
					"userpwd" : userpwd
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
	})
	
	
	
	function voice_new(){
		location.href="voice_new";
	}
	
	function voice_weekly(){
		location.href="voice_weekly";
	}
	
	function voice_monthly(){
		location.href="voice_monthly";
	}
	
	function voice_all(){
		location.href="voice_all";
	}
	
	function video_new(){
		location.href="video_new";
	}
	
	function video_weekly(){
		location.href="video_weekly";
	}
	
	function video_monthly(){
		location.href="video_monthly";
	}
	
	function video_all(){
		location.href="video_all";
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
				<a class="inner-brand" href="/uta">UtaJJang</a>
			</div>
			<!-- Navigation-->
			<div class="inner-navigation collapse">
				<div class="inner-nav">
					<ul>
						<li class="menu-item-has-children menu-item-has-mega-menu"><a
							href="#"><span class="menu-item-span">Home</span></a></li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Voice</span></a>
							<ul class="sub-menu">
								<li><a href="#" onclick="voice_new();">New</a></li>
								<li class="menu-item-has-children"><a href="#">Best</a>
									<ul class="sub-menu">
										<li><a href="#" onclick="voice_weekly();">Weekly</a></li>
										<li><a href="#" onclick="voice_monthly();">Monthly</a></li>
									</ul></li>
								<li><a href="#" onclick="voice_all();">ALL</a></li>
							</ul></li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Video</span></a>
							<ul class="sub-menu">
								<li><a href="#" onclick="video_new();">New</a></li>
								<li class="menu-item-has-children"><a href="#">Best</a>
									<ul class="sub-menu">
										<li><a href="#" onclick="video_weekly();">Weekly</a></li>
										<li><a href="#" onclick="video_monthly();">Monthly</a></li>
									</ul></li>
								<li><a href="#" onclick="video_all();">ALL</a></li>
							</ul></li>

						<li><a href="#"><span class="menu-item-span">Streaming</span></a>
						</li>

						<li class="menu-item-has-children"><a href="#"><span
								class="menu-item-span">Community</span></a>
							<ul class="sub-menu">
								<li><a href="portfolio-7.html">Board</a></li>
								<li><a href="portfolio-7.html">My Blog</a></li>
							</ul></li>
						<li><a href="#"><span class="menu-item-span">Notice</span></a></li>
					</ul>
				</div>
			</div>
			<div class="extra-nav">
				<ul>
					<li><a class="top-bar-cart" href="shop-cart-1.html"><span
							class="menu-item-span"><i class="ti-shopping-cart"></i><span>3</span></span></a></li>
					<li><a class="off-canvas-open" href="#"><span
							class="menu-item-span"><i class="ti-menu"></i></span></a></li>
					<li class="nav-toggle"><a href="#" data-toggle="collapse"
						data-target=".inner-navigation"><span class="menu-item-span"><i
								class="ti-menu"></i></span></a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- Header end-->


	<!-- Wrapper-->
	<div class="wrapper">
		<!-- Hero-->
		<section class="module-cover parallax text-center fullscreen"
			data-background="resources/assets/images/module-5.jpg"
			data-overlay="0.6">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 m-auto">
						<div class="m-b-20">
							<h6>Create a new account</h6>
						</div>
						<div class="m-b-20">
							<form method="post">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="Name">
								</div>
								<div class="form-group">
									<input class="form-control" type="email" placeholder="E-mail">
								</div>
								<div class="form-group">
									<input class="form-control" type="password"
										placeholder="Pasword">
								</div>
								<div class="form-group">
									<input class="form-control" type="password"
										placeholder="Confirm password">
								</div>
								<div class="form-group">
									<button class="btn btn-block btn-round btn-brand" type="submit">Sign
										Up</button>
								</div>
							</form>
						</div>
						<div class="m-b-20">
							<p>
								<small>By signing up, you agree to the<a href="#">terms
										of service</a></small>
							</p>
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
				<a class="off-canvas-close" href="#"><span class="ti-close"></span></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<c:if test="${sessionScope.userid != null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<p class="text-center">
								<img src="resources/assets/images/person.png" alt=""
									width="80px">
							</p>
							<p class="text-center">로그인한아이디</p>
							<p class="text-center">n 번 방문</p>
							<p class="text-center">내 블로그</p>
							<p class="text-center">정보 수정</p>
						</div>
					</aside>
				</c:if>
				<c:if test="${sessionScope.userid == null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<div class="form-group">
								<p class="text-center">Login</p>
								<p class="text-center">
									<input class="form-control" type="text" id="userid"
										name="userid" placeholder="loginId">
								</p>
								<p class="text-center">
									<input class="form-control" type="password" id="userpwd"
										name="userpwd" placeholder="password">
								</p>
								<p class="text-center">
									<button class="btn btn-outline-secondary" type="button"
										name="loginBTN" id="loginBTN">login</button>
									<button type="button" class="btn btn-outline-secondary"
										name="signup" id="signup">signup</button>
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
		src="resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
	<script src="resources/assets/js/custom/plugins.min.js"></script>
	<script src="resources/assets/js/custom/custom.min.js"></script>
</body>
</html>