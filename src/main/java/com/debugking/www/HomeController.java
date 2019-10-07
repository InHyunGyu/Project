package com.debugking.www;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dao.VideoListRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.PageNavigator;


@Controller
public class HomeController {
	
	
	@Autowired
	PostsService serivce;
	@Autowired
	VideoListRepository repo;
	@Autowired
	ManagerRepository Managerrepo;
	
	
	final String uploadPath="D:/workspace/DebugKing/src/main/webapp/resources/savefile";
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		
		int countPerPage=6;
		int totalRecordCount = repo.getVideoCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		System.out.println(navi.getStartRecord());
		List<Posts> newList = repo.selectAll(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("newList", newList);
		 
		List<Posts> weekList = repo.selectWeek(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("weekList", weekList);
		
		List<Posts> monthList = repo.selectMonth(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("monthList", monthList);
		
		
		return "main";
	}

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2(@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			HttpServletResponse response,
			HttpSession session,
			Model model){
		
		int countPerPage=6;
		
		int totalRecordCount = repo.getVideoCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		System.out.println(navi.getStartRecord());
		List<Posts> newList = repo.selectAll(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("newList", newList);
		
		List<Posts> weekList = repo.selectWeek(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("weekList", weekList);
		
		List<Posts> monthList = repo.selectMonth(searchItem, searchWord, navi.getStartRecord(), countPerPage);
		model.addAttribute("monthList", monthList);
		
		////////////////////////////////////////////////////////////
		int startRecord=1;
		int lastPerPage=3;
		List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
		model.addAttribute("noticeList",noticeList);
		System.out.println("1234"+noticeList);
		
		return "main";
	}
	
	

}
