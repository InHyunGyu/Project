package com.debugking.www;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.debugking.www.dao.ListRepository;
import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dao.likereportRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;
import com.debugking.www.dto.Replies;
import com.debugking.www.dto.likereport;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.FileService;




@Controller
public class ListController {

	@Autowired
	ListRepository repo;

	@Autowired
	PostsService serivce;

	@Autowired
	MemberRepository memberrepo;
	
	@Autowired
	likereportRepository lrrepo;
	
	
	
	final String uploadPath="D:/workspace/DebugKing/src/main/webapp/resources/savefile"; 

	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice(){

		return "userBoard/notice";
	}

	@RequestMapping(value="/streaming", method=RequestMethod.GET)
	public String streaming(){
		return"userBoard/streaming";
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(String postType, Model model){

		System.out.println(postType);
		
		model.addAttribute("postType", postType);

		return "userBoard/write";
	}

	//글쓰기
	@RequestMapping(value="/writing", method=RequestMethod.POST)
	public String writing(Posts post, HttpSession session, MultipartFile upload){
		post.setMemberId((String)session.getAttribute("memberId"));

		String originalfile = upload.getOriginalFilename();
		String savedfile = FileService.saveFile(upload,uploadPath);

		post.setOriginalFile(originalfile);
		post.setSavedFile(savedfile);

		serivce.writing(post);
		
		if(post.getPostType().equals("community")){
			return "redirect:community"; 
		} else if (post.getPostType().equals("voice")){
			return "redirect:voice_new";
		} else {
			return "redirect:video_new";
		}
		
	}


	
	//파일 들어가기
	@RequestMapping(value="/file_detail", method=RequestMethod.GET)
	public String commuDetail(int postNo, HttpSession session,Model model){
/*		 ModelAndView view = new ModelAndView();*/
		
		
		String checkType = "view";
	        
	      //댓글 받아와 모델에 입력하기
	      ArrayList<Replies> replyList = new ArrayList<>();
	      int replyCount = repo.replyCount(postNo);
	       replyList = repo.replyList(postNo);
	       model.addAttribute("replyCount", replyCount);
	       model.addAttribute("replyList", replyList);
	       
	       
	       
	       

	       //확인하고 조회수 증가 후 페이지 이동
	       Posts post = repo.selectOne(postNo);

			String postType = post.getPostType();
			
			Posts after = repo.after(postNo, postType);
			Posts before = repo.before(postNo, postType);
			
			model.addAttribute("before", before);
			model.addAttribute("after", after);
			model.addAttribute("post", post);
	       
	      
	      List<likereport> result = lrrepo.selectList(postNo,checkType); 
	      String memberId = (String)session.getAttribute("memberId");
	      for(likereport lr : result){
	         if(lr.getMemberId().equals(memberId)){
	            System.out.println("배열에 존재합니다."); 
	            return "userBoard/file_detail";
	         }
	      }
	      if(memberId==null){
	         System.out.println("로그인 하지 않습니다.");
	         return "userBoard/file_detail";
	      }
	      
	      post.setMemberId(memberId);
	      post.setPostNo(postNo);
	      lrrepo.viewinsertLR(post,checkType); //배열에 입력
	      System.out.println("3");
	      repo.postView(postNo); //조회수 증가
	      System.out.println("4");
	      System.out.println("배열에 존재하지 않습니다.");
	      return "userBoard/file_detail";
	
	}

	@ResponseBody
	@RequestMapping(value="/replyinsert", method=RequestMethod.POST)
	public String replyinsert(String replyContent, int postNo, HttpSession session){
		
		String memberId = (String)session.getAttribute("memberId");
		
		repo.replyInsert(replyContent, postNo, memberId);
		
		return "ok";
	}

	@ResponseBody
	@RequestMapping(value="/replyDel", method=RequestMethod.GET)
	public String replyDel(int replyNo){
		
		repo.replyDel(replyNo);
		
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/replyUp", method=RequestMethod.POST)
	public String replyUP(Replies reply){
		System.out.println(reply.getReplyContent());
		System.out.println(reply.getReplyNo());
		
		
		repo.replyUp(reply);
		
		return "ok";
	}
	
	@RequestMapping(value="/streaming_write", method=RequestMethod.GET)
	public String streamingPage(){
		return "userBoard/streaming_write";
	}

	@RequestMapping(value="/streaming_detail", method=RequestMethod.GET)
	public String streaming_detail(){
		return "userBoard/streaming_detail";
	}
	
	@ResponseBody
	@RequestMapping(value="/postLike", method=RequestMethod.GET)
	public int postLike(int postNo,HttpSession session,Model model){
		String checkType = "like";
		
		//댓글 받아와 모델에 입력하기
		ArrayList<Replies> replyList = new ArrayList<>();
		int replyCount = repo.replyCount(postNo);
	    replyList = repo.replyList(postNo);
	    model.addAttribute("replyCount", replyCount);
	    model.addAttribute("replyList", replyList);

	    //확인하고 조회수 증가 후 페이지 이동
	    Posts post = repo.selectOne(postNo);
	    model.addAttribute("post", post);
	    
		List<likereport> result = lrrepo.selectList(postNo,checkType); 
		String memberId = (String)session.getAttribute("memberId");
		for(likereport lr : result){
			if(lr.getMemberId().equals(memberId)){
				System.out.println("배열에 존재합니다.");
				return 0;
			}
		}
		if(memberId==null){
			System.out.println("로그인 하지 않습니다.");
			return 0;
		}
		post.setMemberId(memberId);
		post.setPostNo(postNo);
		lrrepo.viewinsertLR(post,checkType); //배열에 입력
		
		repo.postLike(postNo); //조회수 증가
		System.out.println("배열에 존재하지 않습니다.");
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/reported", method=RequestMethod.GET)
	public int reported(int postNo,HttpSession session,Model model){
		String checkType = "report";
		
		//댓글 받아와 모델에 입력하기
		ArrayList<Replies> replyList = new ArrayList<>();
		int replyCount = repo.replyCount(postNo);
	    replyList = repo.replyList(postNo);
	    model.addAttribute("replyCount", replyCount);
	    model.addAttribute("replyList", replyList);

	    //확인하고 조회수 증가 후 페이지 이동
	    Posts post = repo.selectOne(postNo);
	    model.addAttribute("post", post);
	    
		List<likereport> result = lrrepo.selectList(postNo,checkType); 
		String memberId = (String)session.getAttribute("memberId");
		
		for(likereport lr : result){
			if(lr.getMemberId().equals(memberId)){
				System.out.println("배열에 존재합니다.");
				return 0;
			}
		}
		if(memberId==null){
			System.out.println("로그인 하지 않습니다.");
			return 0;
		}
		post.setMemberId(memberId);
		post.setPostNo(postNo);
		lrrepo.viewinsertLR(post,checkType); //배열에 입력
		
		repo.reported(postNo); //조회수 증가
		System.out.println("배열에 존재하지 않습니다.");
		return 1;
	}
}
