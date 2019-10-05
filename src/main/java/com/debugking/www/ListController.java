package com.debugking.www;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.debugking.www.dao.ListRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.dto.Replies;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.FileService;

import com.debugking.www.dto.Posts;




@Controller
public class ListController {

	@Autowired
	ListRepository repo;

	@Autowired
	PostsService serivce;

	final String uploadPath="/Users/heeju/Documents/fileIO";

	@RequestMapping(value="/video_new", method=RequestMethod.GET)
	public String video_new(){
		System.out.println("video new ȣ��");
		return "userBoard/video_new";
	}

	@RequestMapping(value="/video_weekly", method=RequestMethod.GET)
	public String video_weekly(){
		return "userBoard/video_weekly";
	}

	@RequestMapping(value="/video_monthly", method=RequestMethod.GET)
	public String video_monthly(){
		return "userBoard/video_monthly";
	}

	@RequestMapping(value="/video_all", method=RequestMethod.GET)
	public String video_all(){
		return "userBoard/video_all";
	}

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

		model.addAttribute("postType", postType);

		return "userBoard/write";
	}
	
/*
	@RequestMapping(value="/file_detail", method=RequestMethod.GET)
	public String commuDetail(int postNo, Model model){
		
		ArrayList<Replies> replyList = new ArrayList<>();
		
		int replyCount = repo.replyCount(postNo);
		replyList = repo.replyList(postNo);
		
		Posts post = repo.selectOne(postNo);
		
		model.addAttribute("post", post);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("replyList", replyList);
		
		return "userBoard/file_detail";
	}
*/
	@ResponseBody
	@RequestMapping(value="/replyinsert", method=RequestMethod.POST)
	public String replyinsert(String replyContent, int postNo, HttpSession session){
		
		String memberId = (String)session.getAttribute("memberId");
		
		int result = repo.replyInsert(replyContent, postNo, memberId);
		
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
	public int postLike(int postNo){
		
		System.out.println(postNo);
		
		int result = repo.postLike(postNo);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/reported", method=RequestMethod.GET)
	public String reported(int postNo){
		return "";
	}
}
