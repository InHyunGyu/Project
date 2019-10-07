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
		<script src="resources/assets/js/login2.js"></script>
		
		<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		
			<!--board-->	 
	<link rel="icon" type="image/png" href="resources/board/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/board/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/board/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/board/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/board/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/board/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="resources/board/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/board/css/main.css">
<!--===============================================================================================-->
		
		
		
		
		
		
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
		$("#btnWriteForm").on('click',function(){
			if(${empty sessionScope.memberId}){
				swal("로그인한 후 글쓰기가능합니다.");
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
           <section class="module-cover parallax text-center" data-background="resources/assets/images/board2.jpg"  >
                <div class="container">
                    <div class="row">
                         <div class="col-md-12">
                            <h2>Voice_Monthly</h2>
                        </div>
                    </div>
                </div>
			</section>          
          
          
          
                <section class="module p-t-30 p-b-100">
		<div class="container">

			<div class="col-md-12 m-auto">
				<div class="table-responsive">
					<!-- 검색창 -->
					<div style="float: right; margin-bottom: 10px;">
						<form action="voice_monthly" method="get">
							<div class="form-group"
								style="height: 50px; display: inline-flex;">
								<select class="form-control col-md-3" name="searchItem"
									style="height: 100%; width: 130px;">
									<option value="postTitle"
										${searchItem == 'postTitle' ? 'selected' : ''}>제목</option>
									<option value="memberId"
										${searchItem == 'memberId' ? 'selected' : ''}>글쓴이</option>
									<option value="postContent"
										${searchItem == 'postContent' ? 'selected' : ''}>내용</option>
								</select> <input class="form-control col-md-6" type="text"
									name="searchWord" value="${searchWord}" style="height: 100%;" />
								<input class="col-md-2" type="submit" value="검색" id="inputStyle" />
							</div>
						</form>
					</div>
				</div>
			</div>





			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">No</th>
								<th class="column2">글제목</th>
								<th class="column3">작성자</th>
								<th class="column4">작성일</th>
								<th class="column5">조회수</th>
								<th class="column6">추천수</th>
							</tr>
						</thead>

						<tbody>
							<!-- 게시글이 없는 경우 -->
							<c:if test="${empty list}"> 
								
								<c:if test="${not empty noticeList}">
								<c:forEach var="board" items="${noticeList}">
									<tr style="background-color: #c9ccc8;">
										<td class="column1">공지</td>
										<td class="column2"><a href="file_detail?postNo=${board.postNo}">${board.postTitle}</a></td>
										<td class="column3"><a href="follow_page?memberId=${board.memberId}">${board.memberId}</a></td>
										<td class="column4">${board.postDate}</td>
										<td class="column5">${board.postView}</td>
										<td class="column6">${board.postLike}</td>
									</tr>
								</c:forEach> 
							</c:if>
								
								<tr>
									<td colspan="6" align="center" style="text-align:center;">데이터가 없습니다.</td>
								</tr>
								
								
							</c:if>
							<!-- 게시글이 있는 경우 -->
							

							<c:if test="${not empty list}">
							
							<c:if test="${not empty noticeList}">
								<c:forEach var="board" items="${noticeList}">
									<tr style="background-color: #c9ccc8;">
										<td class="column1">공지</td>
										<td class="column2"><a href="file_detail?postNo=${board.postNo}">${board.postTitle}</a></td>
										<td class="column3"><a href="follow_page?memberId=${board.memberId}">${board.memberId}</a></td>
										<td class="column4">${board.postDate}</td>
										<td class="column5">${board.postView}</td>
										<td class="column6">${board.postLike}</td>
									</tr>
								</c:forEach> 
							</c:if>
							
							
							
								<c:forEach var="board" items="${list}" varStatus="stat">
									<tr>
										<td class="column1">${stat.count + navi.startRecord}</td>
										<td class="column2"><a href="file_detail?postNo=${board.postNo}">${board.postTitle}</a></td>
										<td class="column3"><a href="follow_page?memberId=${board.memberId}">${board.memberId}</a></td>
										<td class="column4">${board.postDate}</td>
										<td class="column5">${board.postView}</td>
										<td class="column6">${board.postLike}</td>
									</tr>

								</c:forEach>
							</c:if>
						</tbody>

					</table>
				</div>
			</div>

			<!-- 페이징 하기 -->

			<div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link"
								href="voice_monthly?&currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}"><span
									class="fas fa-angle-left"></span></a></li>
							<c:forEach var="page" begin="${navi.startPageGroup}"
								end="${navi.endPageGroup}">
								<li class="page-item"><a class="page-link"
									href="voice_monthly?&currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="voice_monthly?&currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}"><span
									class="fas fa-angle-right"></span></a></li>
						</ul>
					</nav>
				</div>
			</div>

			<button type="button" class="btn btn-outline-secondary"
				id="btnWriteForm" style="float: right;">WRITE</button>

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