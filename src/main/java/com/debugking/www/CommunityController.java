package com.debugking.www;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.debugking.www.dao.CommunityRepository;
import com.debugking.www.dto.Posts;
import com.debugking.www.util.FileService;
import com.debugking.www.util.PageNavigator;



@Controller
public class CommunityController {

	@Autowired
	CommunityRepository repo;
	
	final String uploadPath = "/uploadfile";
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Posts vo, MultipartFile upload, HttpSession session){
		
		String memberId = (String)session.getAttribute("loginId");

		String originalFilename = upload.getOriginalFilename();
		String savedFilename = FileService.saveFile(upload, uploadPath);
			
		vo.setOriginalFile(originalFilename);
		vo.setSavedFile(savedFilename);
		vo.setMemberId(memberId);
		
		int result = repo.insert(vo);
		
		if(result > 0){
			return "userBoard/community";
		} else {
			return "userBoard/write";
		}
	}
	

	@RequestMapping(value="/community", method=RequestMethod.GET)
	public String commuList(@RequestParam(value="searchItem",  defaultValue="postTitle")String searchItem, 
									@RequestParam(value="searchWord",  defaultValue="")String searchWord, 
									@RequestParam(value="currentPage",  defaultValue="1")int currentPage, Model model){
		ArrayList<Posts> list = new ArrayList<>();
		String postType = "community";
		
		int totalRecordCount = repo.getBoardCount(searchItem, searchWord);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		list = repo.selectAll(postType, searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		return "userBoard/community";
	}
	
	@RequestMapping(value="/commu_detail", method=RequestMethod.GET)
	public String commuDetail(int postNo, Model model){
		
		Posts post = repo.selectOne(postNo);
		
		model.addAttribute("post", post);
		
		return "userBoard/file_detail";
	}
	
	@RequestMapping(value="/post_modify", method=RequestMethod.GET)
	public String commu_update(int postNo, Model model){
		
		Posts post = repo.selectOne(postNo);
		
		model.addAttribute("post", post);
		
		System.out.println(post.getPostType());
		
		return "userBoard/post_modify";
	}	
	
	@RequestMapping(value="/post_modify", method=RequestMethod.POST)
	public String commu_update(Posts post, MultipartFile upload, RedirectAttributes rttr){
		int result = 0;
		int postNo = post.getPostNo();
		
		Posts orgPost = repo.selectOne(postNo);
		
		System.out.println("org" + orgPost.toString());
		System.out.println("post" + post.toString());
		if(post.getOriginalFile() == null){
			result = repo.update(post);
		} else if (upload.getSize() == 0 || upload.isEmpty()) {
			
		} else {
			FileService.deleteFile(uploadPath+"/"+orgPost.getSavedFile());

			String savedname = FileService.saveFile(upload, uploadPath);
			
			post.setSavedFile(savedname);
			post.setOriginalFile(upload.getOriginalFilename());
			
			result = repo.update(post);
			
			System.out.println("result" + result);
		}
		
		rttr.addAttribute("postNo", postNo);
		return "redirect:file_detail";

	}
}