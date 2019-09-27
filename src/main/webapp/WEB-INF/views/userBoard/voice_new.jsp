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
        <title>UtaJJang</title>
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
	<style type="text/css">
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
		
		$("#signup").on('click', function(){
			location.href="signup"
		})
		
		$("#btnWriteForm").on('click',function(){
			if(${empty sessionScope.memberId}){
				alert("로그인한 후 글쓰기가능합니다.");
				return;
			} else{
				location.href="write?postType=voice";
			}
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


          
          
          <section class="module-cover parallax text-center" data-background="resources/assets/images/board2.jpg"  >
                <div class="container">
                    <div class="row">
                         <div class="col-md-12">
                            <h2>Voice_New</h2>
                        </div>
                    </div>
                </div>
			</section>          
          
          
          
          
          
          
                <section class="module p-t-30 p-b-30">
			 <div class="container">
                    <div class="row">
                        <div class="col-md-12 m-auto">
				<div class="table-responsive">
					<!-- 검색창 -->
					
					<div style="float: right; margin-bottom: 10px; ">
						<form action="voice_new" method="get">
						<div class="form-group" style= "height: 36px;">
							<select class="form-control col-md-3" name="searchItem" style="height: 100%;">
								<option value="postTitle" ${searchItem == 'postTitle' ? 'selected' : ''}>제목</option>
								<option value="memberId"
									${searchItem == 'memberId' ? 'selected' : ''}>글쓴이</option>
								<option value="postContent"
									${searchItem == 'postContent' ? 'selected' : ''}>내용</option>
							</select> 
							<input class="form-control col-md-6" type="text" name="searchWord" value="${searchWord}" style="height: 100%;"/> 
							<input class="col-md-2" type="submit" value="검색" id="inputStyle"/>
						</div>
						</form>
					
					</div>
					<table class="table table-striped table-sm table-hover" style="margin: 30px; text-align: center;">
                        	
                        	<colgroup>
								<col style="width: 5%;" />
								<col style="width: auto%;" />
								<col style="width: 20%;" />
								<col style="width: 15%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
                        	
                        	<tr>
                        		<th>No</th>
                        		<th>글제목</th>
                        		<th>작성자</th>
                        		<th>작성일</th>
                        		<th>조회수</th>
                        		<th>추천수</th>
                        	</tr>
                        
							<!-- 게시글이 없는 경우 -->
							<c:if test="${empty list}">
								<tr>
									<td colspan="6" align="center">데이터가 없습니다.</td>
								</tr>
							</c:if>
							<!-- 게시글이 있는 경우 -->
							<c:if test="${not empty list}">
								<c:forEach var="board" items="${list}" varStatus="stat">
									<tr>
										<td>${stat.count + navi.startRecord}</td>
										<td><a href="file_detail?postNo=${board.postNo}">${board.postTitle}</a></td>
										<td><a href="follow_page?memberId=${board.memberId}">${board.memberId}</a></td>
										<td>${board.postDate}</td>
										<td>${board.postView}</td>
										<td>${board.postLike}</td>
									</tr>
								
								</c:forEach>
							</c:if>
							
							<!-- 페이징 하기 -->
				
						</tbody>
					</table>
				</div>
				<div>
					<div class="row">
                                <div class="col-md-12">
                                    <nav>
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item"><a class="page-link" href="voice_new?&currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}"><span class="fas fa-angle-left"></span></a></li>
                                            <c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
												<li class="page-item"><a class="page-link" href="voice_new?&currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a></li>
											</c:forEach>
                                            <li class="page-item"><a class="page-link" href="voice_new?&currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}"><span class="fas fa-angle-right"></span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
					</div>
					<button type="button" class="btn btn-outline-secondary" id="btnWriteForm" style="float: right;">글쓰기</button>
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>
    </body>
</html>    