package com.debugking.www;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dao.VideoListRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.PageNavigator;

@Controller
public class VideoListController {

	@Autowired
	PostsService serivce;
	@Autowired
	VideoListRepository repo;

	
	
	final String uploadPath="C:/Spring/DebugKing/src/main/webapp/resources/savefile";
	

	
	@RequestMapping(value="/video_new", method=RequestMethod.GET)
	public String video_new(
			@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		int countPerPage=3;
		int totalRecordCount = repo.getVideoCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		System.out.println(navi.getStartRecord());
		List<Posts> list = repo.selectAll(searchItem, searchWord, navi.getStartRecord(), countPerPage);
	
	   
	    
	    
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		
		
		
		return "userBoard/video_new";
		
	}
	

	@RequestMapping(value="/video_weekly", method=RequestMethod.GET)
	public String video_weekly(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		int countPerPage=3;
		int totalRecordCount = repo.getVideoWeekCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		System.out.println(navi.getStartRecord());
		List<Posts>list = repo.selectWeek(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		System.out.println(list); 
		
		return "userBoard/video_weekly";
	}

	@RequestMapping(value="/video_monthly", method=RequestMethod.GET)
	public String video_monthly(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
			
		int countPerPage=3;
		int totalRecordCount = repo.getVideoMonthCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		System.out.println(navi.getStartRecord());
		List<Posts>list = repo.selectMonth(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		
	
		
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		System.out.println(list); 
      
		
			
		return "userBoard/video_monthly";
	}

	@RequestMapping(value="/video_all", method=RequestMethod.GET)
	public String video_all(){
		return "userBoard/video_all";
	}

	
	

	
 
	
	
	
	
}
