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



<script>
	$(function() {
		$("#loginBTN").on('click', function() {
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();

			if (memberId.length == 0 || memberPwd.length == 0) {
				alert("다시입력해주세요.");
				return;
			}

			var send = {
				"memberId" : memberId,
				"memberPwd" : memberPwd
			}

			$.ajax({
				method : 'post',
				url : 'login',
				data : send,
				success : function(result) {
					if (!result) {
						alert("로그인 실패");
					} else {
						alert("로그인 성공");
						location.reload();
					}

				}
			})
		})

		$("#signup").on('click', function() {
			location.href = "signup"
		})
		$("#memberDelete").on('click', function() {
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();
			var send = {
				"memberId" : memberId,
				"memberPwd" : memberPwd
			}
			$.ajax({
				method : 'post',
				url : 'memberDelete',
				data : send,
				success : function() {
					location.reload();
				}
			})
		})
	})
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
						<c:if test="${sessionScope.memberId != admin}">
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
		<section class="module-cover parallax text-center "
			data-background="resources/assets/images/main/back5.jpg"
			data-overlay="0.6">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="demo-heading"><strong>Uta<span>J</span>Jang</strong></h1>
						<p class="m-b-40">
							Hi <br> Hi
						</p>
					</div>
				</div>
			</div>
		</section>
		<!-- Hero end-->

		<!-- About-->

		<!-- Sliders-->
		
		<!-- Testimonials end-->
		<!-- Sliders end-->
		<!-- About end-->

		<!-- Portfolio-->
		<section class="module p-b-0">
			<div class="container">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1>Recommended number</h1>
						<p class="lead">Highly recommended video by bulletin board</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-MY="40px"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<ul class="filters serif">
							<li><a href="#" data-filter=".packaging">Voice</a></li>
							<li><a class="current" href="#" data-filter="*">Video</a></li>
							<li><a href="#" data-filter=".branding">Streaming</a></li>
							<li><a href="#" data-filter=".digital">ALL</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row row-portfolio" data-columns="3">
					<div class="grid-sizer"></div>
					<div class="portfolio-item branding">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/1.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">Solave Cleanser</h6>
								<span class="portfolio-item-subtitle serif">Digital</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
					<div class="portfolio-item digital">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/4.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">Monochrome</h6>
								<span class="portfolio-item-subtitle serif">Branding</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
					<div class="portfolio-item packaging">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/3.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">Ellie Cashman</h6>
								<span class="portfolio-item-subtitle serif">Packaging</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
					<div class="portfolio-item branding">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/6.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">White Sleeve</h6>
								<span class="portfolio-item-subtitle serif">Digital</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
					<div class="portfolio-item digital">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/5.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">Classic Socks</h6>
								<span class="portfolio-item-subtitle serif">Branding</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
					<div class="portfolio-item packaging">
						<div class="portfolio-item-wrapper">
							<div class="portfolio-item-img">
								<img src="resources/assets/images/portfolio/2.jpg" alt="">
							</div>
							<div class="portfolio-item-caption">
								<h6 class="portfolio-item-title">Expirience</h6>
								<span class="portfolio-item-subtitle serif">Packaging</span>
							</div>
							<a class="portfolio-item-link" href="file_detail"></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Portfolio end-->






		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="space m-b-50"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="space m-b-50"></div>
				</div>
			</div>
		</div>





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
				<a class="off-canvas-close" href="#"><img
					src="resources/assets/images/close.png" style="width: 15px;"></a>
			</div>
			<div class="off-canvas-content">
				<!-- Text widget-->
				<c:if test="${sessionScope.memberId != null}">
					<aside class="widget widget-text">
						<div class="textwidget">
							<p class="text-center">
								<c:if test="${sessionScope.memberImg == null}">
								<img src="resources/assets/images/person.png" width="80px">
								</c:if>
								<c:if test="${sessionScope.memberImg != null}">
								<img src="resources/assets/images/" width="80px">
								</c:if>
							</p>
							<p class="text-center">${sessionScope.memberId}</p>
							<p class="text-center">n 번 방문</p>
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
								<p class="text-center">
									<button class="btn btn-outline-secondary" type="button"
										id="memberDelete" style="width: 320px; height: 54px;">임시탈퇴버튼</button>
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
