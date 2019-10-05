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
	<style>
		#button_group {
			float: right;
		}
		
		button[name="contentModi"]{
		float: right;
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
		var login = '${sessionScope.memberId}';
		
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
		
		$("#replyBTN").on('click', function(){
			var replyContent = $("#replyContent").val();
			var postNo = "${post.postNo}";
			
			alert(login);
			if(login.length == 0) {
				alert("로그인을 해주세요.");
				return;
			}
			
			if(replyContent.length == 0) {
				alert("댓글 내용을 입력해주세요.");
				return;
			}
			
			var send = {
					"replyContent":replyContent,
					"postNo":postNo
			}
			
			$.ajax({
				method:'post',
				url:'replyinsert',
				data:send,
				success:function(){
					location.reload();
				}
			})
		})
		
		$(".replyDelBTN").on('click', function(){
			var replyNo = $(this).attr("data-value");
			
				$.ajax({
					method:'get',
					url:'replyDel',
					data:'replyNo='+replyNo,
					success:function(){
						location.reload();
					}
				})
			
		})
		
		$(".replyModiBTN").on('click', function(){
			var replyNo = $(this).attr("data-value");
			var replyContent =  $(this).attr("data-content");
			
				var tag = '';
				
				tag += '<div class="comment-body">';
				tag += '<form class="comment-form row">';
				tag += '<div class="form-group col-md-12">';
				tag += '<textarea class="form-control" rows="4" cols="100" style="margin: 5px;" id="ModiContent" name="replyContent" >'+replyContent+'</textarea>';
				tag += '</div>';
				tag += '<div class="form-submit col-md-12">';
				tag += '<button class="btn btn-dark" type="button" id="contentModi" name="contentModi" data-replyNo="'+replyNo+'">Modify</button>';
				tag += '</form>'
				tag += '</div>'
	
		     
				
	            $(this).parent().parent().parent().html(tag);
				
				$("#contentModi").on('click', function(){
					var replyContent = $("#ModiContent").val();
					var replyNo = $(this).attr("data-replyNo");
					
					var send = {
							
							'replyNo':replyNo,
							'replyContent':replyContent
					}
					
					$.ajax({
						method:'post',
						url:'replyUp',
						data:send,
						success:function(){
							location.reload();
						}
					})
				})
			
		})
		
		$("#postLike").on('click', function(){
			var postNo = $(this).attr("data-value");
			
			if(login.length == 0 || login == null) {
				alert('로그인을 해주세요');
				return;
			} else {
				
				var send = {
						'postNo':postNo,
						'memberId':login
				}
				
				$.ajax({
					method:'post',
					url:'postLike',
					data:send,
					success:function(res){
						if(res == 0) {
							alert('중복 ');
							return;
						} else {
							location.reload();	
						}
						
					}
				})
			
			}
		})	
		
		$("#reported").on('click', function(){
			var postNo = $(this).attr("data-value");
			
			$.ajax({
				method:'get',
				url:'reported?postNo='+postNo,
				success:function(){
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

						<li><a href="streaming"><span class="menu-item-span">Streaming</span></a>
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
            <section class="module-cover parallax text-center" data-background="resources/assets/images/board12.jpg" data-overlay="0.3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Detail</h2>
                           
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
                            	<c:if test="${post.originalFile == null}">
                            	<div class="post-preview"><img src="resources/assets/images/blog/1.jpg" alt=""></div>
                            	</c:if>
                            	<c:if test="${post.originalFile != null}">
                                <div class="post-preview"><img src="<c:url value=""/>" alt=""></div>
                                </c:if>
                                <div class="post-wrapper">
                                    <div class="post-header">
                                        <h1 class="post-title">${post.postTitle}</h1>
                                        <ul class="post-meta">
                                            <li>${post.postDate}</li>
                                            <li><a href="follow_page?memberId=${post.memberId}">${post.memberId}</a></li>
                                        </ul>
                                        <ul class="post-meta">
                                            <li>View : ${post.postView}</li>
                                            <li>Like : ${post.postLike}</li>
                                            <li>Report : ${post.reported}</li>
                                        </ul>
                                    </div>
                                    <div class="post-content">
                                        <p>${post.postContent}</p>
                                    </div>
                                   
                                </div>
                                 
                            </article>
                            <!-- Post end-->

                            <!-- Comments area-->
                            <div class="comments-area m-b-50">
                                <h5 class="comments-title">${replyCount} Comments</h5>
                                <div class="comment-list">
                                    <!-- Comment-->
                                    <div class="comment">
                                   	
                                   	<c:if test="${not empty replyList}">
										<c:forEach var="reply" items="${replyList}">
											
											<div class="comment-author"><img class="avatar" src="resources/assets/images/avatar/1.jpg" alt=""></div>
											
											<div class="comment-body">
												<div class="comment-meta">
													<div class="comment-meta-author"><a href="follow_page?memberId={reply.memberId}">${reply.memberId}</a></div>
													<div class="comment-meta-date">${reply.replyDate}</div>
												</div>
												<div class="comment-content">
													<p class="idd">${reply.replyContent}</p>
												</div>
												<div class="form-group">
													<c:if test="${sessionScope.memberId == reply.memberId}">
													<div class="comment-reply">
														<a class="replyModiBTN" data-value="${reply.replyNo}" data-content="${reply.replyContent}" data-name="${reply.memberId}">Modify</a>&ensp;<a class="replyDelBTN" data-name="${reply.memberId}" data-value="${reply.replyNo}">Delete</a>
													</div>
													</c:if>
							
												</div>
											
											</div>
											
											
											
										</c:forEach> 
										
									</c:if>  
                                <div class="comment-respond">
                                    <h5 class="comment-reply-title">Leave a Reply</h5>
                                    <form class="comment-form row">
                                        <div class="form-group col-md-12">
                                             <textarea class="form-control" rows="4" cols="100" placeholder="Comment" style="margin: 5px;" id="replyContent" name="replyContent"></textarea>
                                        </div>
                                        <div class="form-submit col-md-12">
											<button class="btn btn-dark" type="button" id="replyBTN" name="replyBTN">Comment</button>
											 
											 <c:if test="${sessionScope.memberId == post.memberId}">
											 <div class="form-group" id = "button_group">
											 <a href="post_modify?postNo=${post.postNo}"><button class="btn btn-outline-dark" type="button" id="post_modifyBTN" >Modify</button></a>
		                               		<a href="delete?postNo=${post.postNo}"><button class="btn btn-outline-dark" type="button" id="deleteBTN">Delete</button></a>
		                               		</div>
		                               	</c:if>
		                               	
		                               	<c:if test="${sessionScope.memberId != post.memberId}">
											 <div class="form-group" id = "button_group">
											 <button class="btn btn-outline-dark" type="button" id="postLike" data-value="${post.postNo}">postLike</button>
		                               		<button class="btn btn-outline-dark" type="button" id="reported" data-value="${post.postNo}">REPORTED</button>
		                               		</div>
		                               	</c:if>
                                        </div>
                                    </form>
                                    <div style="margin-top: 30px;">
                               	  </div>
                                </div>
                                
                                 
                            </div>
                        	</div>
                        	</div> 	
                            </div>
                            <!-- Comments area end-->
                       
                        
                        
                        
                        <div class="col-lg-4">
                            <div class="sidebar">


                                <!-- Categories widget-->
                                <aside class="widget widget-categories">
                                    <div class="widget-title">
                                        <h6>Categories</h6>
                                    </div>
                                    <ul>
                                        <li><a href="javascript:history.back()">목록으로 </a></li>
                                    </ul>
                                </aside>

                                <!-- Recent entries widget-->
                                <aside class="widget widget-recent-entries-custom">
                                    <div class="widget-title">
                                        <h6>After Posts</h6>
                                    </div>
                                    <ul>
                                        <li class="clearfix">
                                        	<c:if test="${after != null}">
                                            	<div class="wi"><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></div>
                                            	<div class="wb"><a href="file_detail?postNo=${after.postNo}"><span style="font-weight: bold; color: black;">${after.postTitle}</span><br>${after.memberId}<br>${after.postType}</a><span class="post-date">${after.postDate}</span></div>
											</c:if>        
											<c:if test="${after == null}">
												<a>이후 게시글이 없습니다.</a>
											</c:if>                                
                                        </li>
                                    </ul>
                                </aside>


                                <!-- Tags widget-->
                                <aside class="widget widget-recent-entries-custom">
                                    <div class="widget-title">
                                        <h6>Before Posts</h6>
                                    </div>
                                    <ul>
                                        <li class="clearfix">
                                        	<c:if test="${before != null}">
                                            	<div class="wi"><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></div>
                                            	<div class="wb"><a href="file_detail?postNo=${before.postNo}"><span style="font-weight: bold; color: black;">${before.postTitle}</span><br>${before.memberId}<br>${before.postType}</a><span class="post-date">${before.postDate}</span></div>
											</c:if>        
											<c:if test="${before == null}">
												<a>이전 게시글이 없습니다.</a>
											</c:if>                                
                                        </li>
                                    </ul>
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
                <div class="off-canvas-header"><a class="off-canvas-close" href="#"><img src="resources/assets/images/close.png" style="height: 15px;"></a></div>
                <div class="off-canvas-content">
                    <!-- Text widget-->
                    <c:if test="${sessionScope.memberId != null}">
                    <aside class="widget widget-text">
                        <div class="textwidget">
                            <p class="text-center"><img src="resources/assets/images/person.png" alt="" width="80px"></p>
                            <p class="text-center">${sessionScope.memberId}</p>
                            <p class="text-center">
                            	<a href="follow_page?memberId=${sessionScope.memberId}" style="color: #788487">내 블로그</a>
                            </p>
                            <p class="text-center"><a href="modify" style="color: #788487">정보 수정</a></p>
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