<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Singup</title>
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
        <link href="resources/assets/signup.css" rel="signup">


        <script src="resources/assets/js/jquery-3.4.1.min.js"></script>
<script >
	$(function(){
		var flagid = false;
		var flagpwd = false;
		var flagreco = true;
		
		var memberId = $("#memberId").val();
		var memberpwd = $("#memberpwd").val();
		/*var checkpwd = 	$("#checkpwd").val();
		var recocheckbtn = $("#recocheckbtn").val();
		var memberEmail =$("#memberEmail").val();
		var memberphone = $("#memberphone").val();
		
		var tel1 = 	$("#tel1").val();
		var tel2 = 	$("#tel2").val();
		var tel3 = 	$("#tel3").val(); */
		/* var userBirth= $("#userBirth").val();
		var userAddress = 	$("#userAddress").val(); */
		
		//아이디 유효성 검사 + 중복검사
		$("#memberId").on("keyup",function(){
			memberId = $("#memberId").val();
			if(memberId.length<3 || memberId.length>15){
				$("#checkidline").html("<br>id는 3~15사이입니다.");
				return false;
			}
			else{
				$("#checkidline").html("");
			}
		});
		
		$("#checkid").on("click",function(){
			memberId = 	$("#memberId").val();
			if(memberId=="" || memberId==null){
				alert("ID입력하세요");
				checkId.select();
				return false;
			}
			else if(flagid=false){
				alert("중복하세요");
				return false;
			}
			else{
				$.ajax({
					method : "GET",
					url : "idCheck",
					data : "memberId="+ memberId,
					success: function(result){
						if(result=="true"){
							alert("동일한 ID가 존재합니다.");
						}
						else {
							flagid=true;
							alert("사용 가능합니다.");
						}
					}
				});
			}
		}); 
		
		//비밀번호 유효성 검사
		$("#memberpwd").on("keyup",function(){
			memberpwd = $("#memberpwd").val();
			if(memberpwd.length <3 || memberpwd.length > 15){
				$("#checkpwdline").html("Password 는 3~15사이입니다.");
				return false;
			}
			else{
				$("#checkpwdline").html("");
			}
			
			//비밀번호 동일한지 검사
			$("#checkpwd").on("keyup",function(){
				var checkpwd = $("#checkpwd").val();
				if(memberpwd !== checkpwd){
					$("#checkpwdline2").html("비밀번호가 일치하지 않습니다.");
					return false;
				}else{
					$("#checkpwdline2").html("");
					flagpwd=true;
				}
			});
		});
		
		//이메일 유효성 검사 아오 눈아퍼
		$("#memberEmail").on("click",function(){
			return true; //일단 패스합니다.
		});
		$("#recommender").on("keyup",function(){
			flagreco=false;
		})
		//추천인 유효성 검사 이거까지 해야됩니까?
		$("#recocheckbtn").on("click",function(){
			var recommender=$("#recommender").val();
			if(recommender != "" || recommender!=null){
				$.ajax({
					method:"GET",
					url:"idCheck",
					data: "memberId="+ recommender,
					success: function(result){
						if(result=="true"){
							flagreco=true;
							alert("확인");
							
						}
						else {
							flagreco=false;
							alert("동일한 ID가 존재하지 않습니다.");
						}
					}
				})

			}
		});
		
		//이름, 전화번호 , 생일,추천자
		//회원 등록하기
		$("#signupbtn").on('click',function(){
			var memberEmail = $("#memberEmail").val();
			//var memberphone = $("#memberphone").val();
			var memberphone= $("#memberphone").val();
			var membername =$("#membername").val();
			var tel1 = 	$("#tel1").val();
			var tel2 = 	$("#tel2").val();
			var tel3 = 	$("#tel3").val();
			var memberbirth = $("#memberbirth").val();
			var recommender =$("#recommender").val();
			
			//alert("tel2"+tel2+"tel3"+tel3);
			if(!recommender){
				flagreco=true;
			}
			if(tel2 == "" || tel3 == ""||tel2 == null||tel3 == null ||isNaN(tel2) || isNaN(tel3)){
				alert("전화번호 제대로 입력하세요");
				tel2.select();
				return false;
			}else{
				memberphone = tel1+tel2+tel3;
				if(membername==null){
					alert("이름을 입력하세요");
					membername.select();
					return false;
				}else if(memberbirth==null){
					alert("생일을 입력하세요");
					memberbirth.select();
					return false;
				}
				if(flagreco==false){
					alert("추천인 확인버튼을 누르세요");
					return false;
				}else{
					alert("flagid"+flagid+"//flagpwd"+flagpwd+"//memberphone"+memberphone+"//memberEmail"+memberEmail)
		 			
					if(flagid==true && flagpwd==true && memberphone.length>0 && memberEmail.length>0 ){
						$.ajax({
							method:"post",
							url:"signup",
							data:{
								"memberId" : memberId,
								"memberPwd" : memberpwd,
								"memberEmail" : memberEmail,
								"memberName" :membername,
								"memberPhone" : memberphone,
								"memberBirth" :memberbirth,
								"recommender" : recommender
							},
							success : function(mesa){
								alert("");
								if(mesa == "ok"){
									location.href="emailSendAction";
								}
							/* 
								if(mesa === "success"){
									alert("등록 성공하였습니다. 화면 이동합니다.");
									location.href ="main"
								}
								else{
									alert("등록 실패하였습니다. 화면 이동합니다.");
									location.href ="main"
								} 
							*/
							}
						}); 
					}
					else{
						alert("다시 확인하세요.");
					} 
				}
			}
		});
		
		$("#loginBTN").on('click', function() {
			var memberId = $("#loginId").val();
			var memberPwd = $("#loginPwd").val();

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
						location.href="main";
					}

				}
			})
		})

		$("#signup").on('click', function() {
			location.reload();
		})
		
		$("#memberDelete").on('click', function() {
			var memberId = $("#loginId").val();
			var memberPwd = $("#loginPwd").val();
			var send = {
				"memberId" : memberId,
				"memberPwd" : memberPwd
			}
			$.ajax({
				method : 'post',
				url : 'memberDelete',
				data : send,
				success : function() {
					location.href="main";
				}
			})
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
            <section class="module-cover parallax text-center fullscreen" data-background="resources/assets/images/main/login3.jpg" data-overlay="0.5" style="height: 100%">
                <div class="container" style="padding-top:100px;">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 m-auto">
                            <div class="m-b-20">
                                <h6>Create a new account</h6>
                            </div>
                            <div class="m-b-20">
                          
                            <!-- <<회원가입 입력받기 -->
                                <form action="signup" action="POST" >
                                    <div class="form-group" style="display:inline-flex;width: 100%; ">
                                        <input class="form-control" type="text" name="memberId" id="memberId" placeholder="ID" style="width: 70%">
                                        <button type="button" class="form-control" id="checkid" style="width: 30%">중복확인</button>
                                    </div>
                                    <span id="checkidline"></span>
                                    <div class="form-group" >
                                        <input class="form-control" type="password" name="memberPwd" id="memberpwd" placeholder="Pasword">
                                        <span id="checkpwdline"></span>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" id="checkpwd" placeholder="Confirm password">
                                        <span id="checkpwdline2"></span>
                                    </div>
                                    <div class="form-group" style="display:inline-flex; width: 100%;">
                                        <input class="form-control" type="email" name="memberEmail" id="memberEmail" placeholder="E-mail" style="width: 70%;">
                                        <button class="form-control" type="button" id="checkEmail" style="width: 30%">Email Check</button>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="memberName" id="membername" placeholder="Name">
                                    </div>
 	                                <div class="form-group" style="display:inline-flex;"> 
										<select class="form-control" id="tel1" name="tel1">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">017</option>
										</select>
										<input type="text" class="form-control" id="tel2" maxlength="4">
										<input type="text" class="form-control" name="tel3" id="tel3" maxlength="4">
									</div>
									<div class="form-group" >
                                        <input type="date" class="form-control" name="memberBirth" id="memberbirth" placeholder="Birth"/>
                                    </div>
									 <div class="form-group" style="display:inline-flex; width: 100%;" >
                                        <input class="form-control" type="text" name="recommender" id="recommender" placeholder="recommender" style="width: 70%;">
                                        <input class="form-control" type="button" id="recocheckbtn" value="추천인 검사" style="width: 30%;">
                                    </div>
                                     <div class="form-group">
                                        <button class="btn btn-block btn-round btn-brand" type="button"id="signupbtn">Sign Up</button>
                                    </div>
                                    
                                    <!--정보 여닫이  -->
                        			 <!-- <details close>
                       				 <summary>Additional</summary>
	 									 <div class="add_info">
		                              		 <div class="form-group">
					                         	<label for="email">userBirth</label>
					                            <input type="date" class="form-input" name="memberbirth" id="memberbirth"/>
					                         </div>
                        			     </div>
                       				 </details> -->
                                </form>
                              
                            </div>
                           
                        </div>
                    </div>
                </div>
                </section>
           

            <!-- Footer-->
            <footer class="footer" >
                <div class="footer-widgets" style="padding-top:100px;">
                    <div class="container" >
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
                            <p class="text-center"><input class="form-control" type="text" id="loginId" name="memberId" placeholder="loginId"></p>
                            <p class="text-center"><input class="form-control" type="password" id="loginPwd" name="memberPwd" placeholder="password"></p>
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
       <!--  <script src="resources/assets/js/custom/jquery.min.js"></script> -->
       <!--  <script src="resources/assets/js/custom/popper.min.js"></script> -->
       <!--  <script src="resources/assets/js/bootstrap/bootstrap.min.js"></script> -->
       <!--  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script> -->
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>
        
<!--          JQuery
        <script src="resources/jquery-3.3.1.min.js"></script> -->
        
    </body>
</html>