package com.debugking.www;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.debugking.www.dao.CommunityRepository;
import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.util.FileService;
import com.debugking.www.util.PageNavigator;



 
@Controller
public class CommunityController {

	@Autowired
	CommunityRepository repo;
	@Autowired
	ManagerRepository Managerrepo;
	
	final String uploadPath="/Users/heeju/Documents/fileIO";
	

	@RequestMapping(value="/community", method=RequestMethod.GET)
	public String commuList(@RequestParam(value="searchItem",  defaultValue="postTitle")String searchItem, 
									@RequestParam(value="searchWord",  defaultValue="")String searchWord, 
									@RequestParam(value="currentPage",  defaultValue="1")int currentPage, Model model){
		ArrayList<Posts> list = new ArrayList<>();
		String postType = "community";
        
		int totalRecordCount = repo.getPostCount(searchItem, searchWord);
		
		int countPerPage=10;
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		
		list = repo.selectAll(postType, searchItem, searchWord, navi.getStartRecord(), countPerPage);
		
		int noticeCount = repo.commuNoCount();
		List<Posts> noticeList = repo.commuNoList();
	 
		
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticeList2", noticeList);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
        int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList2 = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList2);
        System.out.println("공지 목록: " + noticeList2);
		
		return "userBoard/community";
	}

	@RequestMapping(value="/post_modify", method=RequestMethod.GET)
	public String commu_update(int postNo, Model model){
		
		Posts post = repo.selectOne(postNo);
		
		model.addAttribute("post", post);
		
        int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "userBoard/post_modify";
	}	
	
	@RequestMapping(value="/post_modify", method=RequestMethod.POST)
	public String commu_update(Posts post, MultipartFile upload, RedirectAttributes rttr, Model model){
		int result = 0;
		int postNo = post.getPostNo();
		
		Posts orgPost = repo.selectOne(postNo);
		
		if(upload == null){
			result = repo.update(post);
		} else if (upload.getSize() == 0 || upload.isEmpty()) {
			
		} else {
			FileService.deleteFile(uploadPath+"/"+orgPost.getSavedFile());

			String savedname = FileService.saveFile(upload, uploadPath);
			
			post.setSavedFile(savedname);
			post.setOriginalFile(upload.getOriginalFilename());
			
			result = repo.update(post);
			
		}
		
		rttr.addAttribute("postNo", postNo);
		
        int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
        
		return "redirect:/file_detail";

	}

	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int postNo, Model model){
		Posts post = repo.selectOne(postNo);
		
		if(post.getSavedFile() != null){
			FileService.deleteFile(uploadPath+"/"+post.getSavedFile()); 
		}
		repo.postDelete(postNo);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return "redirect:/community";
	}
}