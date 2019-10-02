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
        <title>Debugking_Project</title>
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
		.module a {
			color: #788487;
		}
		
		.set_list {
    width: 769px;
    height: 48px;
    padding: 12px 20px 0;
    border-top: 1px solid #E4E4E4;
    background: #FAFAFA;
    white-space: nowrap;
    letter-spacing: -0.5px;


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
	}
	</style>

	<script>

	$(function(){
		writingList();
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
		
		
		//체크박스 체크 된 것 배열에 추가하기 
		var DATA=[];
		$("#content_table").on("change","#postNoBTN",function(){
	          if($(this).is(':checked')){
		           DATA.push($(this).val());
	         } else{
	        	 DATA.pop($(this).val());
	         }
			/* $("input[id=postNoBTN]:checked").each(function(){
				DATA += $('"data-boardno":checked').val();
				console.log(DATA);
			}) */
			//var a= $(this).attr("data-boardno");
		})
		$("#move").on("click",function(){
				console.log(DATA)
				move(DATA);
		})
		$("#deleted").on("click",function(){
			console.log(DATA);
			deleted(DATA);
		})
		$("#change").on('click',function(){
			console.log(DATA);
			change(DATA);
		})
		
		// 등급변경
		function change(DATA){
			jQuery.ajaxSettings.traditional = true;
			
			var changeLevel =  $("#changeLevel").val();
			$.ajax({
				method:"POST",
				url:"change",
				data:{
					"listchecked" : DATA,
					"memberLevel" : changeLevel
				},
				success : function(mesa){
					if(mesa==0){
						alert("실패");
					}
					else{
						alert("등업 성공하였습니다.");
					}
				}
			})
		}
		// 게시글 삭제 
		function deleted(test){
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method:"POST",
				url:"deleted",
				data:{
					"listchecked" : test
				},
				success : function(mesa){
					if(mesa==0){
						alert("실패");
					}
					else{
						alert("게시글이 삭제 되었습니다.");
						for(var i=0; i<test.length; i++){
							//alert($("input[data-boardno*='test[i]'").parent().parent())
							$('input[data-boardno |='+test[i]+']').parent().parent().remove();
						}
					}
				}
			})
		}
		// 게시글 이동 
		function move(test){
			var postType = $("#moveSelect").val();
			var senddata = {
				"listchecked" : test,
				"postType" : postType
			}
			jQuery.ajaxSettings.traditional = true;
			//alert(JSON.stringify(senddata))
			$.ajax({
				method:"POST",
				url:"move",
				data:senddata,
				success : function(mesa){
					if(mesa==0){
						alert("실패");
					}
					else{
						alert("게시글이 이동하였습니다.");
						writingList();
					}
				}
			})
		}
			//$("input[id=postNoBTN]:checked").each(function() {
			//	var test = $(this).val();
			//})
		$("#memberRating").on('click',function(){
			$.ajax({
				method:"GET",
				url:"memberRating",
				success:function(ratingList){
					memberRating(ratingList);
				}
			})
		})
	})
	
	function writingList(){	
		var tag1="게시글 관리";
		
		var tag2 =''
		tag2 = '<colgroup>'
		tag2 += '<col style="width: 5%;" />'
		tag2 += '<col style="width: 10%;" />'
		tag2 += '<col style="width: 15%;" />'
		tag2 += '<col style="width: auto;" />'
		tag2 += '<col style="width: 10%;" />'
		tag2 += '<col style="width: 10%;" />'
		tag2 += '</colgroup>'
		tag2 += '<thead>'
		tag2 += '<tr>'		
		tag2 += '<th><input type="checkbox"></th>'
		tag2 += '<th>게시판</th>'
		tag2 += '<th>글제목</th>'
		tag2 += '<th>작성자</th>'
		tag2 += '<th>조회</th>'
		tag2 += '<th>작성일</th>'
		tag2 += '</tr>'
		tag2 += '</thead>'
		tag2 += '<tbody >'
		tag2 += '<c:if test="${empty list}">'	
		tag2 += '<tr>'
		tag2 += '<td colspan="6" align="center">데이터가 없습니다.</td>'
		tag2 += '</tr>'
		tag2 += '</c:if>'
		tag2 += '<c:if test="${not empty list}">'
		tag2 += '<c:forEach var="board" items="${list}" varStatus="stat">'
		tag2 += '<tr>'
		tag2 += '<td ><input type="checkbox" id="postNoBTN" value="${board.postNo}" data-boardno="${board.postNo}"></td>'
		tag2 += '<td>${board.postType}</td>'
		tag2 += '<td ><a href="file_detail?postNo=${board.postNo}">${board.postTitle}</a></td>'
		tag2 += '<td>${board.memberId}</td>'
		tag2 += '<td>${board.postView}</td>'
		tag2 += '<td>${board.postDate}</td>'
		tag2 += '</tr>'
		tag2 += '</c:forEach>'
		tag2 += '</c:if>'
		tag2 += '</tbody>'
		
		
		var tag3 = ''
		tag3 += '<select class="form-control col-lg-2" style="height: 30px;" id="moveSelect">'
		tag3 += '<option value="voice">voice</option>'
		tag3 += '<option value="video">video</option>'
		tag3 += '<option value="streaming">streaming</option>'
		tag3 += '<option value="community">community</option>'
		tag3 += '</select>'	
		tag3 += '<div class="form-group" style="float: right;">'
		tag3 += '<a href="#" id="move">move</a>'		
		tag3 += '<a> | </a>'
		tag3 += '<a href="#" id="deleted">delete</a>'
		tag3 += '</div>'
		
		var tag4 = '';
		tag4 += '<select class="form-control col-lg-3" name="searchItem">'
		tag4 += "<option value='voice' ${searchItem == 'voice' ? 'selected' : ''}>voice</option>"
		tag4 += "<option value='video' ${searchItem == 'video' ? 'selected' : ''}>video</option>"
		tag4 += "<option value='streaming' ${searchItem == 'streaming' ? 'selected' : ''}>streaming</option>"
		tag4 += "<option value='community' ${searchItem == 'community' ? 'selected' : ''}>community</option>"
		tag4 += '</select>'
		tag4 += '<button class="search-button" type="submit"><span class="fas fa-search"></span></button>'
		
	
		$("#content_title").html(tag1);
		$("#add").html(tag4);
		$("#content_table").html(tag2);
		$("#content_select").html(tag3);
		
	}
	/* function commentList(){
		var tag1="댓글 관리";
		
		var tag2 =''
		tag2 = '<colgroup>'
		tag2 += '<col style="width: 5%;" />'
		tag2 += '<col style="width: 15%;" />'
		tag2 += '<col style="width: auto;" />'
		tag2 += '<col style="width: 10%;" />'
		tag2 += '<col style="width: 10%;" />'
		tag2 += '</colgroup>'
		tag2 += '<thead>'
		tag2 += '<tr>'		
		tag2 += '<th><input type="checkbox"></th>'
		tag2 += '<th>글제목</th>'
		tag2 += '<th>댓글 내용 </th>'
		tag2 += '<th>작성자</th>'
		tag2 += '<th>작성일</th>'
		tag2 += '</tr>'
		tag2 += '</thead>'
		tag2 += '<tbody>'
		tag2 += '<c:if test="${empty commentList}">'	
		tag2 += '<tr>'
		tag2 += '<td colspan="5" align="center">데이터가 없습니다.</td>'
		tag2 += '</tr>'
		tag2 += '</c:if>'
		tag2 += '<c:if test="${not empty commentList}">'
		tag2 += '<c:forEach var="board" items="${commnetList}" varStatus="stat">'
		tag2 += '<tr>'
		tag2 += '<td><input type="checkbox"></td>'
		tag2 += '<td>${board.title}</td>'		
		tag2 += '<td>${board.content}</td>'
		tag2 += '<td>${board.userid}</td>'
		tag2 += '<td>${board.regdate}</td>'
		tag2 += '</tr>'
		tag2 += '</c:forEach>'
		tag2 += '</c:if>'
		tag2 += '</tbody>'
		
		var tag3 = ''
		tag3 += '<input type="checkbox">'
		tag3 += '<div class="form-group" style="float: right;">'
		tag3 += '<a href="#" onclick="rep_delete();">delete</a>'
		tag3 += '</div>'
		
		var tag4 = '';
		tag4 += '<select class="form-control col-lg-3" >'
		tag4 += '<option value="voice">voice</option>'
		tag4 += '<option value="video">video</option>'
		tag4 += '<option value="streaming">streaming</option>'
		tag4 += '<option value="community">community</option>'
		tag4 += '</select>'
		tag4 += '<input class="form-control col-lg-8" type="search" placeholder="Search" >'
		tag4 += '<button class="search-button" type="submit"><span class="fas fa-search"></span></button>'
		
		$("#content_title").html(tag1);
		$("#add").html(tag4);
		$("#content_table").html(tag2);
		$("#content_select").html(tag3);
		
	} */
	
	function memberRating(ratingList){
		var tag1 ="등급관리"
		
		var tag2 =''
		tag2 = '<colgroup>'
		tag2 += '<col style="width: 5%;" />'
		tag2 += '<col style="width: auto%;" />'
		tag2 += '<col style="width: 20%;" />'
		tag2 += '<col style="width: 20%;" />'
		tag2 += '<col style="width: 20%;" />'
		tag2 += '</colgroup>'
		tag2 += '<thead>'
		tag2 += '<tr>'		
		tag2 += '<th><input type="checkbox"></th>'
		tag2 += '<th>회원 아이디</th>'
		tag2 += '<th>회원 생일 </th>'
		tag2 += '<th>등업 대기 등급</th>'
		tag2 += '<th>가입 날짜</th>'
		tag2 += '</tr>'
		tag2 += '</thead>'
		tag2 += '<tbody>'
		
		if(ratingList == null){
			tag2 += '<tr>'
			tag2 += '<td colspan="5" align="center">데이터가 없습니다.</td>'
			tag2 += '</tr>'
		}
		else{
			$.each(ratingList,function(index,item){
				tag2 += '<tr>'
				tag2 += '<td><input type="checkbox" id="postNoBTN" value="'+item.postNo+'" data-boardno="'+item.postNo+'"></td>'
				tag2 += '<td>'+item.memberId+'</td>'		
				tag2 += '<td>'+item.memberBirth+'</td>'
				tag2 += '<td>'+item.memberLevel+'</td>'
				tag2 += '<td>'+item.signupDate+'</td>'
				tag2 += '</tr>'
			})
		}	
		tag2 += '</tbody>'
		
		var tag3 = ''
		tag3 += '<input type="checkbox">'
		tag3 += '<div class="form-group" style="float: right;">'
		tag3 += '<select class="form-control col-lg-4" style="height: 30px;" id="changeLevel">'
		tag3 += '<option value="1">1</option>'
		tag3 += '<option value="2">2</option>'
		tag3 += '<option value="3">3</option>'
		tag3 += '<option value="4">4</option>'
		tag3 += '<option value="5">5</option>'
		tag3 += '</select>'
		tag3 += '<a href="#" id="change">change</a>'		
		tag3 += '<a> | </a>'
		tag3 += '<a href="#" id="stop_activity">stop</a>'
		tag3 += '</div>'
		
		$("#content_title").html(tag1);
		$("#content_table").html(tag2);
		$("#content_select").html(tag3);
	}
		
	function noticeList(){
		var tag1 ="공지관리"
			
			var tag2 =''
			tag2 = '<colgroup>'
			tag2 += '<col style="width: 5%;" />'
			tag2 += '<col style="width: 20%;" />'
			tag2 += '<col style="width: auto%;" />'
			tag2 += '<col style="width: 20%;" />'
			tag2 += '</colgroup>'
			tag2 += '<thead>'
			tag2 += '<tr>'		
			tag2 += '<th><input type="checkbox"></th>'
			tag2 += '<th>게시판</th>'
			tag2 += '<th>제목</th>'
			tag2 += '<th>공지작성일</th>'
			tag2 += '</tr>'
			tag2 += '</thead>'
			tag2 += '<tbody>'
			tag2 += '<c:if test="${empty noticeList}">'	
			tag2 += '<tr>'
			tag2 += '<td colspan="4" align="center">데이터가 없습니다.</td>'
			tag2 += '</tr>'
			tag2 += '</c:if>'
			tag2 += '<c:if test="${not empty noticegList}">'
			tag2 += '<c:forEach var="board" items="${noticeList}" varStatus="stat">'
			tag2 += '<tr>'
			tag2 += '<td><input type="checkbox"></td>'
			tag2 += '<td>${board.column}</td>'		
			tag2 += '<td>${board.title}</td>'
			tag2 += '<td>${board.regdate}</td>'
			tag2 += '</tr>'
			tag2 += '</c:forEach>'
			tag2 += '</c:if>'
			tag2 += '</tbody>'
			
			var tag3 = ''
			tag3 += '<input type="checkbox">'
			tag3 += '<div class="form-group" style="float: right;">'
			tag3 += '<a href="#" onclick="registration();">registration</a>'		
			tag3 += '<a> | </a>'
			tag3 += '<a href="#" onclick="cancel();">cancel</a>'
			tag3 += '</div>'
			
			var tag4 = '';
			tag4 += '<button class="form-control" type="button" onclick="notice_write();">공지 글쓰기</button>'
			

			$("#content_title").html(tag1);
			$("#add").html(tag4);
			$("#content_table").html(tag2);
			$("#content_select").html(tag3);
			
		}
	function notice_write(){
		location.href="notice_write";
	}
	
	function stop_activity(){
		// 활동중지 
	}
	function rep_delete(){
		// 댓글삭제
	}
	function registration(){
		// 공지 등록
	}
	function cancel(){
		// 공지 등록 취
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
                  
                            <li><a href="https://utajjang.shop"><span class="menu-item-span">Streaming</span></a>
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
                            <h2>Management</h2>
                            
                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero end-->

            <!-- Blog-->
            <section class="module">
                <div class="container">
                    <div class="row">
                         <div class="col-lg-2">
                            <div class="sidebar">
                                <h6 class="single-portfolio-title">글 관리 </h6>
                                <p><a href="#" onclick="writingList();">게시글</a></p>
                                <p><a href="#" onclick="commentList()">댓글</a> </p>
                                <p onclick="noticeList();"><a href="#" onclick="noticeList();">공지</a></p>
                                <hr class="m-t-30 m-b-30">
                                <h6 class="single-portfolio-title">카페 회원 </h6>
                                <p><a href="#" id="memberRating">등급 관리</a></p>
                                
                                <hr class="m-t-30 m-b-30">
                                
                                
                                
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-10">
                            <h2 id="content_title"> </h2>
                            <hr class="m-t-30 m-b-30">	 
                            	 <div class="form-group" style="float: right;">
                            	 <aside class="widget widget-search">
                            	 <!-- 페이징 하기 -->
				
                                    <form id="add">
                                        
                                    </form>
                                    
                                </aside>
                                
                            	</div>
                            	
                            	  
                            
                             
                            <table id="content_table" class="table table-striped table-sm table-hover">
							
							</table>
				<p class="paging">
						<a href="managerPage?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a><!-- 앞그룹 요청 -->
						<a href="managerPage?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a><!-- 앞 페이지 요청 -->
						
						<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup }">
							<a href="managerPage?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">&nbsp&nbsp${page}&nbsp&nbsp  </a>
						</c:forEach>
						
						<a href="managerPage?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">▷</a>
						<a href="managerPage?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
				</p>
					<div class="set_list" style="width: 100%;">
					<div class="bundle_set" id="content_select">
					
						
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