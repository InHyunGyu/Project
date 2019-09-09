<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
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
        <!-- JavaScripts -->
		<script src="resources/assets/js/jquery-3.4.1.min.js"></script>
	
	<script>
	$(function(){
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
                <div class="inner-header"><a class="inner-brand" href="main">UtaJJang</a></div>
                <!-- Navigation-->
                <div class="inner-navigation collapse">
                    <div class="inner-nav">
                        <ul>
                            <li class="menu-item-has-children menu-item-has-mega-menu"><a href="main"><span class="menu-item-span">Home</span></a>
                            </li>
                            
                            <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Voice</span></a>
                                <ul class="sub-menu">
                                    <li><a href="voice_new">New</a></li>
                                    <li class="menu-item-has-children"><a href="#">Best</a>
                                        <ul class="sub-menu">
                                            <li><a href="voice_weekly">Weekly</a></li>
                                            <li><a href="voice_monthly">Monthly</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="voice_all">ALL</a></li>
                                </ul>
                            </li>
                  
                            <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Video</span></a>
                                <ul class="sub-menu">
                                    <li><a href="video_new">New</a></li>
                                    <li class="menu-item-has-children"><a href="#">Best</a>
                                        <ul class="sub-menu">
                                            <li><a href="video_weekly">Weekly</a></li>
                                            <li><a href="video_monthly">Monthly</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="video_all">ALL</a></li>
                                </ul>
                            </li>
                  
                            <li><a href="#"><span class="menu-item-span">Streaming</span></a>
                            </li>
                            
                             <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Community</span></a>
                                <ul class="sub-menu">
                                    <li><a href="portfolio-7.html">Board</a></li>
                                    <li><a href="myblog">My Blog</a></li>
                                </ul>
                            </li>
                            <li><a href="notice"><span class="menu-item-span">Notice</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="extra-nav">
                    <ul>
                        <li><a class="off-canvas-open" href="#"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                        <li class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- Header end-->

        <!-- Wrapper-->
        <div class="wrapper">
            <!-- Hero-->
            <section class="module-cover parallax text-center" data-background="resources/assets/images/module-17.jpg" data-overlay="0.3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Right Sidebar</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br> Quisque eget mi at eros venenatis</p>
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
                            <article class="post">
                                <div class="post-preview"><a href="#"><img src="resources/assets/images/blog/1.jpg" alt=""></a></div>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h2 class="post-title"><a href="blog-single.html">Bluetooth Speaker</a></h2>
                                        <ul class="post-meta">
                                            <li>November 18, 2016</li>
                                            <li><a href="#">Branding</a>, <a href="#">Design</a></li>
                                            <li><a href="#">3 Comments</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>Just then her head struck against the roof of the hall in fact she was now more than nine feet high and she at once took up the little golden key and hurried off to the garden door.	The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them.</p>
                                    </div>
                                    <div class="post-more"><a href="#">Read more</a></div>
                                </div>
                            </article>
                            <!-- Post end-->

                            <!-- Post-->
                            <article class="post">
                                <div class="post-preview"><a href="#"><img src="resources/assets/images/blog/3.jpg" alt=""></a></div>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h2 class="post-title"><a href="blog-single.html">Minimalist Chandelier</a></h2>
                                        <ul class="post-meta">
                                            <li>November 18, 2016</li>
                                            <li><a href="#">Branding</a>, <a href="#">Design</a></li>
                                            <li><a href="#">3 Comments</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>Just then her head struck against the roof of the hall in fact she was now more than nine feet high and she at once took up the little golden key and hurried off to the garden door.	The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them.</p>
                                    </div>
                                    <div class="post-more"><a href="#">Read more</a></div>
                                </div>
                            </article>
                            <!-- Post end-->

                            <!-- Post-->
                            <article class="post">
                                <div class="post-preview"><a href="#"><img src="resources/assets/images/blog/5.jpg" alt=""></a></div>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h2 class="post-title"><a href="blog-single.html">Standard Shape</a></h2>
                                        <ul class="post-meta">
                                            <li>November 18, 2016</li>
                                            <li><a href="#">Branding</a>, <a href="#">Design</a></li>
                                            <li><a href="#">3 Comments</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>Just then her head struck against the roof of the hall in fact she was now more than nine feet high and she at once took up the little golden key and hurried off to the garden door.	The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them.</p>
                                    </div>
                                    <div class="post-more"><a href="#">Read more</a></div>
                                </div>
                            </article>
                            <!-- Post end-->

                            <!-- Post-->
                            <article class="post">
                                <div class="post-preview"><a href="#"><img src="resources/assets/images/blog/7.jpg" alt=""></a></div>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h2 class="post-title"><a href="blog-single.html">Street Fashion</a></h2>
                                        <ul class="post-meta">
                                            <li>November 18, 2016</li>
                                            <li><a href="#">Branding</a>, <a href="#">Design</a></li>
                                            <li><a href="#">3 Comments</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>Just then her head struck against the roof of the hall in fact she was now more than nine feet high and she at once took up the little golden key and hurried off to the garden door.	The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them.</p>
                                    </div>
                                    <div class="post-more"><a href="#">Read more</a></div>
                                </div>
                            </article>
                            <!-- Post end-->

                            <!-- Page Navigation-->
                            <div class="row">
                                <div class="col-md-12">
                                    <nav>
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item"><a class="page-link" href="#"><span class="fas fa-angle-left"></span></a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                                            <li class="page-item"><a class="page-link" href="#"><span class="fas fa-angle-right"></span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Page Navigation end-->
                        </div>
                       
                        
                        
                        
                        <div class="col-lg-4">
                        
                            <div class="sidebar">
								 
								
                                <!-- Search widget-->
                                <aside class="widget widget-search">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Type Search Words">
                                        <button class="search-button" type="submit"><span class="fas fa-search"></span></button>
                                    </form>
                                </aside>

                                <!-- Categories widget-->
                                <aside class="widget widget-categories">
                                    <div class="widget-title">
                                        <h6>Categories</h6>
                                    </div>
                                    <ul>
                                        <li><a href="#">Journey <span class="float-right">112</span></a></li>
                                        <li><a href="#">Development <span class="float-right">86</span></a></li>
                                        <li><a href="#">Sport <span class="float-right">10</span></a></li>
                                        <li><a href="#">Photography <span class="float-right">144</span></a></li>
                                        <li><a href="#">Symphony <span class="float-right">18</span></a></li>
                                    </ul>
                                </aside>

                                <!-- Recent entries widget-->
                                <aside class="widget widget-recent-entries-custom">
                                    <div class="widget-title">
                                        <h6>Recent Posts</h6>
                                    </div>
                                    <ul>
                                        <li class="clearfix">
                                            <div class="wi"><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></div>
                                            <div class="wb"><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">May 8, 2016</span></div>
                                        </li>
                                        <li class="clearfix">
                                            <div class="wi"><a href="#"><img src="resources/assets/images/widgets/2.jpg" alt=""></a></div>
                                            <div class="wb"><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">May 8, 2016</span></div>
                                        </li>
                                        <li class="clearfix">
                                            <div class="wi"><a href="#"><img src="resources/assets/images/widgets/3.jpg" alt=""></a></div>
                                            <div class="wb"><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">May 8, 2016</span></div>
                                        </li>
                                    </ul>
                                </aside>

                                <!-- Twitter widget-->
                                <aside class="widget twitter-feed-widget">
                                    <div class="widget-title">
                                        <h6>Twitter Feed</h6>
                                    </div>
                                    <div class="twitter-feed" data-twitter="345170787868762112" data-number="2"></div>
                                </aside>

                                <!-- Tags widget-->
                                <aside class="widget widget-tag-cloud">
                                    <div class="widget-title">
                                        <h6>Tags</h6>
                                    </div>
                                    <div class="tag-cloud"><a href="#">e-commerce</a><a href="#">portfolio</a><a href="#">responsive</a><a href="#">bootstrap</a><a href="#">business</a><a href="#">corporate</a></div>
                                </aside>
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
                <div class="off-canvas-header"><a class="off-canvas-close" href="#"><span class="ti-close"></span></a></div>
                <div class="off-canvas-content">
                    <!-- Text widget-->
                    <c:if test="${sessionScope.memberId != null}">
                    <aside class="widget widget-text">
                        <div class="textwidget">
                            <p class="text-center"><img src="resources/assets/images/person.png" alt="" width="80px"></p>
                            <p class="text-center">로그인한아이디</p>
                            <p class="text-center">n 번 방문</p>
                            <p class="text-center">내 블로그 </p>
                            <p class="text-center">정보 수정</p>
                        </div>
                    </aside>
                    </c:if>
                    <c:if test="${sessionScope.memberId == null}">
                    <aside class="widget widget-text">
                        <div class="textwidget">
                        	<div class="form-group">
                        	<p class="text-center">Login</p>
                            <p class="text-center"><input class="form-control" type="text" id="memberId" name="memberId" placeholder="loginId"></p>
                            <p class="text-center"><input class="form-control" type="password" id="memberPwd" name="memberPwd" placeholder="password"></p>
                            <p class="text-center"><button class="btn btn-outline-secondary" type="button"  name="loginBTN" id="loginBTN" style="width: 320px; height: 54px;">login</button>
                           <p class="text-center"><a href="signup" style="color: #788487">signup</a> &ensp; <a href="id_pwd" style="color: #788487">id/pwd</a></p>

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