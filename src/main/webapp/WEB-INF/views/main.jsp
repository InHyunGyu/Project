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

<!-- 홈아이콘바꾸기 -->
<link rel="icon" type="image/png" href="resources/board/images/icons/favicon.ico"/>

<!-- musicom css -->
  <link rel="shortcut icon" sizes="16x16 24x24 32x32 48x48 64x64" href="resources/images/favicon.ico">
        <link rel="stylesheet" type="text/css" href="resources/css/animate.css">
        <link rel="stylesheet" type="text/css" href="resources/css/icomoon.css">
        <link rel="stylesheet" type="text/css" href="resources/css/simple-line-icons.css">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="resources/css/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="resources/css/owl.theme.default.min.css">
        <link rel="stylesheet" type="text/css" href="resources/css/style_frame.css">
        <link rel="stylesheet" type="text/css" href="resources/css/slick.css">
        <link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css">
        <link rel="stylesheet" type="text/css" href="resources/css/spinner.css">
  
  <link href="https://fonts.googleapis.com/css?family=Love+Ya+Like+A+Sister&display=swap" rel="stylesheet"> 
 
   
   
   

   
   
   
   
   
   
   
<!-- musicom css end -->


<style>
	img#profileThumb{
		 border-radius: 50%;
	}

</style>

<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script src="resources/assets/js/login2.js"></script>
 
  
<script>
$(function(){
	var login = '${sessionScope.memberId}';
	
	$(".music_video_list_item_fav_img").on('click', function(){
		var postNo = $(this).attr("data-value");
		
		if(login.length == 0 || login == null) {
			swal('로그인을 해주세요');
			return;
		} else {
			var send = {
					'postNo':postNo
			}
			
			$.ajax({
				method:'GET',
				url:'postLike',
				data:send,
				success:function(res){
					if(res == 0) {
						swal('이미 좋아요를 누른 게시물 입니다.');
						return;
					} else {
						location.reload();	
					}
					
				}
			})
		
		}
	})	
	
	
	
	
	
	
	
	
	
	
	
});




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
		<section class="module-cover-slides" data-module-cover-slides-options="{&quot;animation&quot;: &quot;fade&quot;}" >
  
   <ul class="slides-container">
       <li class="parallax" data-overlay="0.5">
           <img src="resources/assets/images/main/back6.jpg" alt="">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <h1 class="demo-heading"><strong>Uta<span>J</span>Jang</strong></h1>
                   </div>
               </div>
           </div>
       </li>
       <li class="parallax text-center" data-overlay="0.5">
           <img src="resources/assets/images/main/back4.jpg" alt="">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <h1 class="demo-heading"><strong>Uta<span>J</span>Jang</strong></h1>
                   </div>
               </div>
           </div>
       </li>
       <li class="parallax text-right" data-overlay="0.7">
           <img src="resources/assets/images/main/back5.jpg" alt="">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <h1 class="demo-heading"><strong>Uta<span>J</span>Jang</strong></h1>
                   </div>
               </div>
           </div>
       </li>
   </ul>
   <div class="slides-navigation">
       <a class="prev" href="#"><span class="ti-angle-left"></span></a>
       <a class="next" href="#"><span class="ti-angle-right"></span></a>
   </div>
</section>
	
	 
		<!-- Hero end-->
		





  <!-- Sliders-->
		
  <!-- Sliders end-->
         
		           

		<!-- Portfolio-->
		<section class="module p-b-0">
			<div class="container">

				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h1 style="font-family: 'Love Ya Like A Sister', cursive;">Video Best</h1>
						<p class="lead" style="font-family: 'Love Ya Like A Sister', cursive;">Highly recommended video by bulletin board</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="space" data-MY="40px"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<ul class="filters serif" style="font-family: 'Love Ya Like A Sister', cursive;">
						
							<li><a href="#" class="weeklyOn" data-filter=".weekly">Weekly</a></li>
							<li><a href="#" class="monthlyOn" data-filter=".monthly">Monthly</a></li>
							<li><a href="#" class="newOn" data-filter=".new">New</a></li>
						</ul>
					</div>
				</div>
			</div>
	
					
                
                
                
                
                	<div id="main_index_body">

				<section id="fh5co-home" data-section="home">
                
                
                <div class="container-fluid">
                    <div class="row row-portfolio" data-columns="3" style="position: relative; height: 1399.2px;">
                        <div class="grid-sizer"></div>
                        
                        
                        
                                <c:forEach var="board" items="${weekList}" varStatus="stat">
                                 <div class="portfolio-item weekly" style="position: absolute; left: 0px; top: 0px;display:none;">
                            <div class="portfolio-item-wrapper">
							<div id="music_video_list_wrap" style="display: block;">
								<div   
									class="music_video_list_item to-animate-2 fadeInUp animated" 
									 style="width: 100%">
									<div class="music_video_list_item_wrap"> 
										<div style="position: relative;">
											

											<video width="550" height="300" controls="controls"
												preload="metadata" poster="resources/images/thumbnail.jpg">
												<source src="resources/savefile/${board.savedFile}"
													type="video/webm">
											</video>

											<div class="music_video_list_item_title_div">
												<div class="music_video_list_item_music_name_div">
													<a class="music_video_list_item_music_name"
														href="file_detail?postNo=${board.postNo}">${board.postTitle}</a>
												</div>
												<a class="music_video_list_item_artist"
													href="follow_page?memberId=${board.memberId}">${board.memberId}</a>
												<span class="music_video_list_item_release_date">${board.postDate}</span>
											</div>
											<div class="music_video_list_item_fav_div"
												style="line-height: 4;">
												<img class="music_video_list_item_fav_img" data-value="${board.postNo}"
													src="resources/images/icon_fav_off.png" alt="좋아요">
											</div>
										</div>
									</div>
									<div 
										class="music_video_list_item to-animate-2 fadeInUp animated"
										video="3ymwOvzhwHs" style="width: 25%">
										<div class="music_video_list_item_wrap">
											<div style="position: relative;"></div>
										</div> 
									</div>
								</div>
							</div>
							
							 </div>
                        </div>
						</c:forEach> 
                           
                           
                        
                         <c:forEach var="board" items="${monthList}" varStatus="stat">
                        <div class="portfolio-item monthly" style="position: absolute; left: 466.4px; top: 0px;display:none;">
                            <div class="portfolio-item-wrapper">
                                <div id="music_video_list_wrap" style="display: block;">
								<div
									class="music_video_list_item to-animate-2 fadeInUp animated"
									video="3GLrB9GvBq8" style="width: 100%">
									<div class="music_video_list_item_wrap">
										<div style="position: relative;">
										


											<video width="550" height="300" controls="controls"
												preload="metadata" poster="resources/images/thumbnail.jpg">
												<source src="resources/savefile/${board.savedFile}"
													type="video/webm">
											</video>

											<div class="music_video_list_item_title_div">
												<div class="music_video_list_item_music_name_div">
													<a class="music_video_list_item_music_name"
														href="file_detail?postNo=${board.postNo}">${board.postTitle}</a>
												</div>
												<a class="music_video_list_item_artist"
													href="follow_page?memberId=${board.memberId}">${board.memberId}</a>
												<span class="music_video_list_item_release_date">${board.postDate}</span>
											</div>
											<div class="music_video_list_item_fav_div"
												style="line-height: 4;">
												<img class="music_video_list_item_fav_img" data-value="${board.postNo}"
													src="resources/images/icon_fav_off.png" alt="좋아요">
											</div>
										</div>
									</div>
									<div
										class="music_video_list_item to-animate-2 fadeInUp animated"
										video="3ymwOvzhwHs" style="width: 25%">
										<div class="music_video_list_item_wrap">
											<div style="position: relative;"></div>
										</div>
									</div>
								</div>
							</div>
	
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                        
                        
                        
                         <c:forEach var="board" items="${newList}" varStatus="stat">
                        <div class="portfolio-item new" style="position: absolute; left: 0px; top: 466.4px;">
                            <div class="portfolio-item-wrapper">
                              
                              
                                <div id="music_video_list_wrap" style="display: block;">
								<div
									class="music_video_list_item to-animate-2 fadeInUp animated"
									video="3GLrB9GvBq8" style="width: 100%">
									<div class="music_video_list_item_wrap">
										<div style="position: relative;">
											



											<video width="550" height="300" controls="controls"
												preload="metadata" poster="resources/images/thumbnail.jpg">
												<source src="resources/savefile/${board.savedFile}"
													type="video/webm">
											</video>

											<div class="music_video_list_item_title_div">
												<div class="music_video_list_item_music_name_div">
													<a class="music_video_list_item_music_name"
														href="file_detail?postNo=${board.postNo}">${board.postTitle}</a>
												</div>
												<a class="music_video_list_item_artist"
													href="follow_page?memberId=${board.memberId}">${board.memberId}</a>
												<span class="music_video_list_item_release_date">${board.postDate}</span>
											</div>
											<div class="music_video_list_item_fav_div"
												style="line-height: 4;">
												<img class="music_video_list_item_fav_img" data-value="${board.postNo}"
													src="resources/images/icon_fav_off.png" alt="좋아요">
											</div>
										</div>
									</div>
									<div
										class="music_video_list_item to-animate-2 fadeInUp animated"
										video="3ymwOvzhwHs" style="width: 25%">
										<div class="music_video_list_item_wrap">
											<div style="position: relative;"></div>
										</div>
									</div>
								</div>
							</div>
	
                              
                              
                              
                            </div>
                        </div>
                        </c:forEach>
               
                       
                    </div>
                </div>
                
            </section>
            </div>
             </section>
  <!-- musicom end-->
        
         
		           


		
		
		           

		
					
				
				
				
				
					
			
		<!-- Portfolio end-->


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
							</p>
							<p class="text-center">
								<a href="modify" style="color: #788487">정보 수정</a>
							</p>
							<p class="text-center">
								<a href="logout" style="color: #788487">로그 아웃</a>
							</p>
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








