package com.debugking.www;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.debugking.www.dao.VoiceListRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.PostsService;
import com.debugking.www.util.FileService;
import com.debugking.www.util.PageNavigator;

@Controller
public class VoiceListController {
	@Autowired
	PostsService serivce;
	@Autowired
	VoiceListRepository repo;
	
	final String uploadPath="D:/workspace/DebugKing/src/main/webapp/resources/savefile";
	
	@RequestMapping(value="/voice_new", method=RequestMethod.GET)
	public String voice_new(
			@RequestParam(value="searchItem" , defaultValue="postTitle") String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="")      String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		
		int totalRecordCount = repo.getVoiceCount(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		System.out.println(navi.getStartRecord());
		List<Posts> list = repo.selectAll(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		return "userBoard/voice_new";
		
	}
	
 	@RequestMapping(value="/voice_weekly", method=RequestMethod.GET)
	public String voice_weekly(){
		return "userBoard/voice_weekly";
	}
	
	@RequestMapping(value="/voice_monthly", method=RequestMethod.GET)
	public String voice_monthly(){
		return "userBoard/voice_monthly";
	}
	
	@RequestMapping(value="/voice_all", method=RequestMethod.GET)
	public String voice_all(){
		return "userBoard/voice_all";
	}

	
	//글쓰기
	@RequestMapping(value="/writing", method=RequestMethod.POST)
	public String writing(Posts post, HttpSession session, MultipartFile upload){
		
		post.setMemberId((String)session.getAttribute("memberId"));
		String originalfile = upload.getOriginalFilename();
		String savedfile = FileService.saveFile(upload,uploadPath);
		
		post.setOriginalFile(originalfile);
		post.setSavedFile(savedfile);
		
		
		int result = serivce.writing(post);
		if(result==0){
			return "userBoard/write"; 
		}
		return "redirect:voice_new";
	}
	
	
	//FILE Detail 클릭클릭 > jsp 필요한거 같기두하구.. 이걸로 같이 써도 될꺼 같기도 하고.. ajax로 해야 되는건가 싶기도 하고..  
	@RequestMapping(value="/file_detail", method=RequestMethod.GET)
	public String file_detail(int postNo, Model model){
		Posts result = repo.selectPostOne(postNo);
		model.addAttribute("post", result);
		
		System.out.println("file_detail"+result);
		return "userBoard/file_detail";
	}

}
