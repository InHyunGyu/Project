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
                  
                            <li><a href="streaming"><span class="menu-item-span">Streaming</span></a>
                            </li>
                            
                             <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Community</span></a>
                                <ul class="sub-menu">
                                    <li><a href="community">Board</a></li>
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
                            <h2>Bluetooth Speaker</h2>
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Blog</a></li>
                                <li class="breadcrumb-item active">Single Post</li>
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
                            <article class="post">
                                <div class="post-preview"><img src="resources/assets/images/blog/1.jpg" alt=""></div>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h1 class="post-title">Minimalist Chandelier</h1>
                                        <ul class="post-meta">
                                            <li>November 18, 2016</li>
                                            <li>In <a href="#">Branding</a>, <a href="#">Design</a></li>
                                            <li><a href="#">3 Comments</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica. Salvia esse nihil, flexitarian Truffaut synth art party deep v chillwave. Seitan High Life reprehenderit consectetur cupidatat kogi.</p>
                                        <p>Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa eiusmod Pinterest in do umami readymade swag. Selfies iPhone Kickstarter, drinking vinegar jean shorts fixie consequat flexitarian four loko.</p>
                                        <blockquote class="blockquote">
                                            <p>To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.</p>
                                            <footer class="blockquote-footer">Amanda Pollock, Google Inc.</footer>
                                        </blockquote>
                                        <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
                                        <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica. Salvia esse nihil, flexitarian Truffaut synth art party deep v chillwave. Seitan High Life reprehenderit consectetur cupidatat kogi.</p>
                                        <ol>
                                            <li>Digital Strategy</li>
                                            <li>Software Development</li>
                                            <li>Interaction Design</li>
                                        </ol>
                                        <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
                                        <p>Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa eiusmod Pinterest in do umami readymade swag. Selfies iPhone Kickstarter, drinking vinegar jean shorts fixie consequat flexitarian four loko.</p>
                                    </div>
                                    <div class="post-footer">
                                        <div class="post-tags"><a href="#">Lifestyle</a><a href="#">Music</a><a href="#">News</a><a href="#">Travel</a></div>
                                    </div>
                                </div>
                            </article>
                            <!-- Post end-->

                            <!-- Comments area-->
                            <div class="comments-area m-b-50">
                                <h5 class="comments-title">3 Comments</h5>
                                <div class="comment-list">
                                    <!-- Comment-->
                                    <div class="comment">
                                        <div class="comment-author"><img class="avatar" src="resources/assets/images/avatar/1.jpg" alt=""></div>
                                        <div class="comment-body">
                                            <div class="comment-meta">
                                                <div class="comment-meta-author"><a href="#">Jason Ford</a></div>
                                                <div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
                                            </div>
                                            <div class="comment-content">
                                                <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
                                            </div>
                                            <div class="comment-reply"><a href="#">Reply</a></div>
                                        </div>
                                        <!-- Subcomment-->
                                        <div class="children">
                                            <div class="comment">
                                                <div class="comment-author"><img class="avatar" src="resources/assets/images/avatar/2.jpg" alt=""></div>
                                                <div class="comment-body">
                                                    <div class="comment-meta">
                                                        <div class="comment-meta-author"><a href="#">Harry Benson</a></div>
                                                        <div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
                                                    </div>
                                                    <div class="comment-content">
                                                        <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella.</p>
                                                    </div>
                                                    <div class="comment-reply"><a href="#">Reply</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Comment-->
                                    <div class="comment">
                                        <div class="comment-author"><img class="avatar" src="resources/assets/images/avatar/3.jpg" alt=""></div>
                                        <div class="comment-body">
                                            <div class="comment-meta">
                                                <div class="comment-meta-author"><a href="#">Henry Cain</a></div>
                                                <div class="comment-meta-date"><a href="#">May 5, 2015 at 4:51 am</a></div>
                                            </div>
                                            <div class="comment-content">
                                                <p>Meh synth Schlitz, tempor duis single-origin coffee ea next level ethnic fingerstache fanny pack nostrud. Seitan High Life reprehenderit consectetur cupidatat kogi about me. Photo booth anim 8-bit hella, PBR 3 wolf moon beard Helvetica.</p>
                                            </div>
                                            <div class="comment-reply"><a href="#">Reply</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-respond">
                                    <h5 class="comment-reply-title">Leave a Reply</h5>
                                    <p class="comment-notes">Your email address will not be published. Required fields are marked</p>
                                    <form class="comment-form row">
                                        <div class="form-group col-md-12">
                                            <textarea class="form-control" rows="8" placeholder="Comment"></textarea>
                                        </div>
                                        <div class="form-submit col-md-12">
                                            <button class="btn btn-dark" type="submit">Post Comment</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- Comments area end-->
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
                                    </ul>
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
                            <p class="text-center"><a href="myblog" style="color: #788487">내 블로그</a></p>
                            <p class="text-center"><a href="modify" style="color: #788487">정보 수정</a></p>
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
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>
    </body>
</html>