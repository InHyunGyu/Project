package com.debugking.www;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dao.VoiceListRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.PageNavigator;

@Controller
public class VoiceListController {
	@Autowired
	PostsService serivce;
	@Autowired
	VoiceListRepository repo;
	@Autowired
	ManagerRepository Managerrepo;
	
	final String uploadPath="D:/apachetomcat8045/apache-tomcat-8.0.45/webapps/DebugKing/resources/savefile";
	
	@RequestMapping(value="/voice_new", method=RequestMethod.GET)
	public String voice_new(
			@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		//int noticeCount = repo.getNoticeCount();
		int totalRecordCount = repo.getVoiceCount(searchItem, searchWord);
		int countPerPage=10;
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		int noticeCount = getNoticeCount();
		List<Posts> noticeList = selectNoticeAll(); 
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticeList", noticeList);
		
		
		List<Posts> list = repo.selectAll(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeLists = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeLists",noticeLists);
        System.out.println("공지 목록: " + noticeLists);
		
		
		return "userBoard/voice_new";
		
	}
	
 	@RequestMapping(value="/voice_weekly", method=RequestMethod.GET)
	public String voice_weekly(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		//int noticeCount = repo.getNoticeCount();
		int totalRecordCount = repo.getVoiceWeekCount(searchItem, searchWord);
		int countPerPage=10;
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		int noticeCount = getNoticeCount();
		List<Posts> noticeList = selectNoticeAll();
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticeList", noticeList);
		
		List<Posts> list = repo.selectWeek(searchItem, searchWord, navi.getStartRecord(), countPerPage);

		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeLists = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeLists",noticeLists);
        System.out.println("공지 목록: " + noticeLists);
		
		
		return "userBoard/voice_weekly";
		
	}
	
	@RequestMapping(value="/voice_monthly", method=RequestMethod.GET)
	public String voice_monthly(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		//int noticeCount = repo.getNoticeCount();
		int totalRecordCount = repo.getVoiceMonthCount(searchItem, searchWord);
		int countPerPage=10;
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		int noticeCount = getNoticeCount();
		List<Posts> noticeList = selectNoticeAll();
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticeList", noticeList);
		
		List<Posts> list = repo.selectMonth(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeLists = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeLists",noticeLists);
        System.out.println("공지 목록: " + noticeLists);
        
		

		
		return "userBoard/voice_monthly";
		
	}
	
	
	

	public int getNoticeCount(){
		int noticeCount = repo.getNoticeCount();
		
        
		return noticeCount;
	}
	public List<Posts> selectNoticeAll(){
		List<Posts> list = repo.selectNoticeAll();
		
		return list;
	}

}
