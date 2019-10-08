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
import com.debugking.www.dao.ManagerRepository;
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
	
	@Autowired
	ManagerRepository Managerrepo;
	
	
	
	final String uploadPath="D:/workspace/DebugKing/src/main/webapp/resources/savefile"; 


	



	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(String postType, Model model){

		System.out.println(postType);
		
		model.addAttribute("postType", postType);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);

		return "userBoard/write";
	}

	//글쓰기
	@RequestMapping(value="/writing", method=RequestMethod.POST)
	public String writing(Posts post, HttpSession session, MultipartFile upload,Model model){
		post.setMemberId((String)session.getAttribute("memberId"));

		String originalfile = upload.getOriginalFilename();
		String savedfile = FileService.saveFile(upload,uploadPath);

		post.setOriginalFile(originalfile);
		post.setSavedFile(savedfile);

		serivce.writing(post);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
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

	    //이전 게시물 + 다음게시물 가져오기
        Posts post = repo.selectOne(postNo);
		String postType = post.getPostType();
		
		Posts after = repo.after(postNo, postType);
		
		Posts before = repo.before(postNo, postType);
		
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		model.addAttribute("post", post);
		
	      System.out.println("post11"+post);
		//확인하고 조회수 증가 후 페이지 이동
	    List<likereport> result = lrrepo.selectList(postNo,checkType); 
	    String memberId = (String)session.getAttribute("memberId");
	    for(likereport lr : result){
	        if(lr.getMemberId().equals(memberId)){
	        	System.out.println("post22"+post);
	            System.out.println("배열에 존재합니다."); 
	            return "userBoard/file_detail";
	        	}
	    }
	    if(memberId==null){
	       System.out.println("로그인 하지 않습니다.");
	       return "userBoard/file_detail";
	    }
	     
	    lrrepo.viewinsertLR(memberId,postNo,checkType); //배열에 입력
	    repo.postView(postNo); //조회수 증가
	    System.out.println("배열에 존재하지 않습니다.");
	    System.out.println("post33"+post);
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        

		return "userBoard/file_detail";

	}

	@ResponseBody
	@RequestMapping(value="/replyinsert", method=RequestMethod.POST)
	public String replyinsert(String replyContent, int postNo, HttpSession session,Model model){
		
		String memberId = (String)session.getAttribute("memberId");
		
		repo.replyInsert(replyContent, postNo, memberId);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "ok";
	}

	@ResponseBody
	@RequestMapping(value="/replyDel", method=RequestMethod.GET)
	public String replyDel(int replyNo,Model model){
		
		repo.replyDel(replyNo);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/replyUp", method=RequestMethod.POST)
	public String replyUP(Replies reply,Model model){
		System.out.println(reply.getReplyContent());
		System.out.println(reply.getReplyNo());
		
		
		repo.replyUp(reply);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "ok";
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
	    
	    ///
	    int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);

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

		lrrepo.viewinsertLR(memberId,postNo,checkType); //배열에 입력
		
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
		
		//
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
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

		lrrepo.viewinsertLR(memberId,postNo,checkType); //배열에 입력
		
		repo.reported(postNo); //조회수 증가
		System.out.println("배열에 존재하지 않습니다.");
		return 1;
	}
	
	
	
}
