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
        <title>Utajjang</title>
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
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- JavaScripts -->
      <script src="resources/assets/js/jquery-3.4.1.min.js"></script>
      <script src="resources/assets/js/login2.js"></script>
      
   
      <!-- 홈아이콘바꾸기 -->
<link rel="icon" type="image/png" href="resources/board/images/icons/favicon.ico"/>
      
   <style>
   img#profileThumb{
		 border-radius: 50%;
		  width:150px;
		 height:150px;
	}
   
   
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
   }
   
   </style>
   
   <script>

   $(function(){
      writingList();
      //체크박스 체크 된 것 배열에 추가하기 
      var DATA = [];
      $("#content_table").on("change","#postNoBTN",function(){
             if($(this).is(':checked')){
                 DATA.push($(this).val());
                 console.log(DATA);
            } else{
               DATA.pop($(this).val());
               console.log(DATA);
            } 
      })
      
      /* $("#move").on("click",function(){
         move(DATA);
         DATA=[];
      });
      $("#deleted").on("click",function(){
         deleted(DATA);
         DATA=[];
      }); */
      
      //등급 이동버튼         
      $("#memberRating").on('click',function(){
         $.ajax({
            method:"GET",
            url:"memberRating",
            success:function(ratingList){
               memberRating(ratingList);
            }
         })
      })
      //공지 이동버튼
      $("#noticeList").on('click',function(){
         $.ajax({
            mehtod:"GET",
            url:"noticeList",
            success: noticeList
         })
      })
      //신고 글 이동버튼
      $("#reportList").on('click',function(){
         $.ajax({
            method:"GET",
            url:"reportList",
            success:reportList
         })
      })
      
      
      
      //전체선택 정적(모델)
      /* $("#checkAll").click(function() {
         $("input[id=postNoBTN]:checkbox").each(function() {
            $(this).attr("checked", true)
            if($(this).is(':checked')){
                    DATA.push($(this).val());
               } else{
                  $(this).attr("checked", false)
                  DATA.pop($(this).val());
               }
         });
      }); */
      $("#checkAll").click(function(){ 
         //만약 전체 선택 체크박스가 체크된상태일경우 
         //해당화면에 전체 checkbox들을 체크해준다 
         if($("#checkAll").prop("checked")) { 
            $("input[type=checkbox]").prop("checked",true); 
         }
         // 전체선택 체크박스가 해제된 경우
         //해당화면에 모든 checkbox들의 체크를해제시킨다. 
         else { 
            $("input[type=checkbox]").prop("checked",false); 
         } 
      });
      
      //$("input[id=postNoBTN]:checked").each(function() {
      //   var test = $(this).val();
      //})
      /* $("input[id=postNoBTN]:checked").each(function(){
            DATA += $('"data-boardno":checked').val();
            console.log(DATA);
         })  */
      //var a= $(this).attr("data-boardno");
         //유저 등급 체크 된 것 배열에 추가하기
         /*var memberDATA=[];
          $("#content_select").on("change","#memberIdBTN",function(){
              if($(this).is(':checked')){
                  memberDATA.push($(this).val());
                   console.log(memberDATA);
              } else{
                 memberDATA.pop($(this).val());
                 console.log(memberDATA);
              }
            }) */
   })      //끝.
   // 게시글 이동 
   function move(){
      jQuery.ajaxSettings.traditional = true;
      var list = [];
       $("input[id=postNoBTN]").each(function(index, item){
            if($(item).is(':checked')){
               list.push($(item).val());
               } 
         });
       
      var postType = $("#moveSelect").val();
      var senddata = {
         "listchecked" : list.toString(),
         "postType" : postType
      }
       
      /* var fd = new FormData();
      fd.append("listchecked", DATA);
      fd.append("postType", postType); */
      
      
      $.ajax({
         method:"POST",
         url:"move",
         data:senddata,
         success : function(mesa){
            if(mesa==0){
               swal("실패");
            }
            else{
               swal("게시글이 이동하였습니다.");
               for(var i=0; i<list.length; i++){
                  $('input[data-boardno |='+list[i]+']').parent().parent().remove();
               }
            }
         }
      });
   }
   // 게시글 삭제 
   function deleted(){
      jQuery.ajaxSettings.traditional = true;
      var list = [];
       $("input[id=postNoBTN]").each(function(index, item){
            if($(item).is(':checked')){
               list.push($(item).val());
               } 
         });
      $.ajax({
         method:"POST",
         url:"deleted",
         data:{
            "listchecked" : list.toString(),
         },
         success : function(mesa){
            if(mesa==0){
               swal("실패");
            }
            else{
               swal("게시글이 삭제 되었습니다.");
               for(var i=0; i<list.length; i++){
                  $('input[data-boardno |='+list[i]+']').parent().parent().remove();
               }
            }
         }
      });
   }
   function writingList(){   
      var tag1="게시글 관리";
      
      var tag2 =''
      tag2 = '<colgroup>'
      tag2 += '<col style="width: 5%;" />'
      tag2 += '<col style="width: 10%;" />'
      tag2 += '<col style="width: auto;" />'
      tag2 += '<col style="width: 15%;" />'
      tag2 += '<col style="width: 10%;" />'
      tag2 += '<col style="width: 10%;" />'
      tag2 += '</colgroup>'
      tag2 += '<thead>'
      tag2 += '<tr>'      
      tag2 += '<th><input type="checkbox" id="checkAll"></th>'
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
       tag3 += '<option value="community">community</option>'
       tag3 += '</select>'
      tag3 += '<div class="form-group" style="float: right;">'
      tag3 += '<a href="#" onclick="move();">move</a>'      
      tag3 += '<a> | </a>'
      tag3 += '<a href="#" onclick="deleted();">delete</a>'
      tag3 += '</div>'
      
      var tag4 = '';
      tag4 += '<select class="form-control col-lg-3" name="searchItem" >'
      tag4 += "<option value='voice' ${searchItem == 'voice' ? 'selected' : ''}>voice</option>"
      tag4 += "<option value='video' ${searchItem == 'video' ? 'selected' : ''}>video</option>"
      tag4 += "<option value='community' ${searchItem == 'community' ? 'selected' : ''}>community</option>"
      tag4 += '</select>'
      tag4 += '<button class="search-button" type="submit"><span class="fas fa-search"></span></button>'
      
   
      $("#content_title").html(tag1);
      $("#add").html(tag4);
      $("#content_table").html(tag2);
      $("#content_select").html(tag3);
      $(".paging").html("");
      
   }
   function reportList(reportList){
      var tag1="신고 글 관리";
      
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
      tag2 += '<th><input type="checkbox" id="checkAll"></th>'
      tag2 += '<th>글제목</th>'
      tag2 += '<th>작성자</th>'
      tag2 += '<th>작성일</th>'
      tag2 += '<th>신고 횟수</th>'
      tag2 += '</tr>'
      tag2 += '</thead>'
      tag2 += '<tbody>'
      if(reportList == null){
         tag2 += '<tr>'
            tag2 += '<td colspan="5" align="center">데이터가 없습니다.</td>'
            tag2 += '</tr>'
      }
      else{
         $.each(reportList,function(index,item){
            tag2 += '<tr>'
            tag2 += '<td><input type="checkbox" id="memberIdBTN" value="'+item.postNo+'" data-boardno="'+item.postNo+'"></td>'
            tag2 += '<td>'+item.postTitle+'</td>'      
            tag2 += '<td>'+item.memberId+'</td>'
            tag2 += '<td>'+item.postDate+'</td>'
            tag2 += '<td>'+item.reported+'</td>'
            tag2 += '</tr>'
         })
      }
      tag2 += '</tbody>'
      
      var tag3 = ''
      tag3 += '<div class="form-group" style="float: right;">'
      tag3 += '<a href="#" onclick="rep_delete()">delete</a>'
      tag3 += '</div>'
      
      $("#content_title").html(tag1);
      $("#add").html("");
      $("#content_table").html(tag2);
      $("#content_select").html(tag3);
      $(".paging").html("");
      
   } 
   
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
      tag2 += '<th><input type="checkbox" id="checkAll"></th>'
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
            tag2 += '<td><input type="checkbox" id="memberIdBTN" value="'+item.memberId+'" data-boardno="'+item.memberId+'" name="gradeCheck"></td>'
            tag2 += '<td>'+item.memberId+'</td>'      
            tag2 += '<td>'+item.memberBirth+'</td>'
            tag2 += '<td>'+item.memberLevel+'</td>'
            tag2 += '<td>'+item.signupDate+'</td>'
            tag2 += '</tr>'
         })
      }   
      tag2 += '</tbody>'
      
      var tag3 = ''
      tag3 += '<div class="form-group" style="float: right;">'
      tag3 += '<select class="form-control col-lg-4" style="height: 30px;" id="changeLevel">'
      tag3 += '<option value="A">A</option>'
      tag3 += '<option value="B">B</option>'
      tag3 += '<option value="C">C</option>'
      tag3 += '<option value="Z">Z</option>'
      tag3 += '</select>'
      tag3 += '<a href="#" id="change">change</a>'
      tag3 += '<a> | </a>'
      tag3 += '<a href="#" id="stop_activity">stop</a>'
      tag3 += '</div>'
      
      $("#content_title").html(tag1);
      $("#content_table").html(tag2);
      $("#content_select").html(tag3);
      $("#add").html("");
      $(".paging").html("");
      
      $("#change").on("click",change);
      //전체선택 동적(ajax)
      $("#checkAll").click(function() {
         $("input[id=memberIdBTN]:checkbox").each(function() {
            $(this).attr("checked", true)
         });
      });
   }
      
   function noticeList(noticeList){
      var tag1 ="공지관리"
         
         var tag2 =''
         tag2 = '<colgroup>'
         tag2 += '<col style="width: 5%;" />'
         tag2 += '<col style="width: 20%;" />'
         tag2 += '<col style="width: auto%;" />'
         tag2 += '<col style="width: 10%;" />'
         tag2 += '<col style="width: 20%;" />'
         tag2 += '</colgroup>'
         tag2 += '<thead>'
         tag2 += '<tr>'      
         tag2 += '<th><input type="checkbox" id="checkAll"></th>'
         tag2 += '<th>게시판</th>'
         tag2 += '<th>제목</th>'
         tag2 += '<th>공지</th>'
         tag2 += '<th>공지작성일</th>'
         tag2 += '</tr>'
         tag2 += '</thead>'
         tag2 += '<tbody>'   
         if(noticeList ==null){
            tag2 += '<tr>'
            tag2 += '<td colspan="4" align="center">데이터가 없습니다.</td>'
            tag2 += '</tr>'
         }
         else{
            $.each(noticeList,function(index,item){
               tag2 += '<tr>'
               tag2 += '<td ><input type="checkbox" id="memberIdBTN" value="'+item.postNo+'"></td>'
               tag2 += '<td>'+item.postType+'</td>'      
               tag2 += '<td>'+item.postTitle+'</td>'
               tag2 += '<td>'+item.isAnnouncement+'</td>'
               tag2 += '<td>'+item.postDate+'</td>'
               tag2 += '</tr>'
            })
         }
         tag2 += '</tbody>'
         
         var tag3 = ''
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
         $(".paging").html("");
         $("#checkAll").click(function() {
            $("input[id=memberIdBTN]:checkbox").each(function() {
               $(this).attr("checked", true)
            });
         });
      }
   function notice_write(){
      location.href="notice_write";
   }
   // 등급변경
   function change(){
      var list = [];
      jQuery.ajaxSettings.traditional = true;
      $("input[id=memberIdBTN]").each(function(index, item){
         if($(item).is(':checked')){
            list.push($(item).val());
            } 
      });
      var changeLevel =  $("#changeLevel").val();
      $.ajax({
         method:"POST",
         url:"change",
         data:{
            "listchecked" : list.toString(),
            "memberLevel" : changeLevel,
            },
            success : function(mesa){
               if(mesa==0){
                  swal("실패");
                  }
               else{
                  swal("등업 성공하였습니다.");
                  location.reload();
               }
             }   
      })
   }
   // 활동중지
   function stop_activity(){
      var list = [];
      jQuery.ajaxSettings.traditional = true;
      $("input[id=memberIdBTN]").each(function(index, item){
         if($(item).is(':checked')){
            list.push($(item).val());
            } 
      });
      var changeLevel =  $("#changeLevel").val();
      $.ajax({
         method:"POST",
         url:"change",
         data:{
            "listchecked" : list.toString(),
            "memberLevel" : changeLevel,
            },
            success : function(mesa){
               if(mesa==0){
                  swal("실패");
                  }
               else{
                  swal("등업 성공하였습니다.");
                  location.reload();
               }
             }   
      })
   }
   //신고 글 삭제
   function rep_delete(){
      jQuery.ajaxSettings.traditional = true;
      var list = [];
      
      $("input[id=memberIdBTN]").each(function(index, item){
         if($(item).is(':checked')){
            list.push($(item).val());
         } 
      });

      $.ajax({
         method:"POST",
         url:"rep_delete",
         data:{
            "listchecked" : list.toString(),
         },
         success : function(mesa){
            if(mesa == 0){
               swal("실패");
            }
            else{
               swal("신고 글 삭제 성공하였습니다.");
               for(var i=0; i<list.length; i++){
                  $('input[data-boardno |='+list[i]+']').parent().parent().remove();
               }
            }
         }
      })
   }
   // 공지 등록
   function registration(){
      var list = [];
      jQuery.ajaxSettings.traditional = true;
      $("input[id=memberIdBTN]").each(function(index, item){
         if($(item).is(':checked')){
            list.push($(item).val());
         } 
      });
      $.ajax({
         method:"POST",
         url:"registration",
         data:{
            "listchecked" : list.toString(),
         },
         success : function(mesa){
            if(mesa==0){
               swal("실패");
            }
            else{
               swal("공지 등록 성공하였습니다.");
               location.reload();
            }
         }
      })
   }
   
   // 공지 등록 취소
   function cancel(){
      var list = [];
      jQuery.ajaxSettings.traditional = true;
      $("input[id=memberIdBTN]").each(function(index, item){
         if($(item).is(':checked')){
            list.push($(item).val());
         } 
      });
      $.ajax({
         method:"POST",
         url:"cancel",
         data:{
            "listchecked" : list.toString(),
         },
         success : function(mesa){
            if(mesa==0){
               swal("실패");
            }
            else{
               swal("공지 취소 성공하였습니다.");
               location.reload();
            }
         }
      })
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
		<section class="module-cover parallax text-center"
			data-background="resources/assets/images/manager_page.jpg"
			data-overlay="0.3">
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
                                <p><a href="#" id="reportList">신고 글 관리</a> </p>
                                <p><a href="#" id="noticeList">공지</a></p>
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
							<!-- Recent works-->
							<aside class="widget widget-recent-works">
								<div class="widget-title">
									<h6>Team Members</h6>  
								</div>      
								<ul>   
									<li><a href="https://github.com/HeejuKim96" target="_blank" title="김 희주"><img
											src="resources/assets/images/team/heeju_cartoon.jpg" alt=""></a></li>
									<li><a href="https://www.linkedin.com/in/hans-lee-6737b0120" target="_blank"  title="이 학민"><img
											src="resources/assets/images/team/hakmin_cartoon.jpg" alt=""></a></li>
								</ul>
								<ul>
									<li><a href="https://github.com/InHyunGyu" target="_blank"><img   
											src="resources/assets/images/team/hyungyu_cartoon.jpg"  title="인 현규" alt=""></a></li>
									<li><a href="https://github.com/ymh1994" target="_blank"><img
											src="resources/assets/images/team/minhyuk_cartoon.jpg"  title="유 민혁" alt=""></a></li>        
								</ul>
							</aside>   
						</div>
						
						

						<div class="col-md-3">
							<!-- Recent entries widget-->
							<aside class="widget widget-recent-entries">
								<div class="widget-title">
									<h6>Announcement</h6>  
								</div>
								<ul>
									<c:forEach var="item" items="${noticeList}">
										<li><a href="file_detail?postNo=${item.postNo}">${item.postTitle}</a><span class="post-date">${item.postDate}
												</span></li> 
									</c:forEach>
								</ul>
							</aside>
						</div>

						<div class="col-md-3">
							<!-- Twitter widget-->
							<aside class="widget twitter-feed-widget">
								<div class="widget-title">
									<h6>About Us</h6>   
								</div>
								<ul>
									<li><a href="companyIntro" target="_blank"><img
											src="resources/assets/images/aboutUs2.jpg" width="500" alt=""></a></li>   
								</ul>   
           
								<div class="twitter-feed" data-twitter="double_theme"
									data-number="1"></div>
							</aside>
						</div>
						
						<div class="col-md-3">  
							<!-- Text widget-->
							<aside class="widget widget-text">
								<div class="widget-title">  
									
								</div> 
								<div class="textwidget">   
									<p style="color:#788487">
									<br>우타짱이 마련한 음악을 통한 특별한 만남. 당신을 찾아갑니다.</p>
									<p style="color:#788487">
										SC IT MASTER 37 DebugKing<br> All Rights Reserved
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
						
					</div>
				</div>
			</div>
			<div class="footer-bar">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="copyright">
								<p style=color:#788487>
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

        <!-- To top button--><a class="scroll-top" href="#top"><i class="fas fa-angle-up"></i></a>

        <!-- Scripts-->
        <script src="resources/assets/js/custom/jquery.min.js"></script>
        <script src="resources/assets/js/custom/popper.min.js"></script>
        <script src="resources/assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>
    </body>
</html>